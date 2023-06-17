package com.mdung.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mdung.dao.AccountDao;
import com.mdung.dao.DetailOrderDao;
import com.mdung.dao.OrderDao;
import com.mdung.entities.Account;
import com.mdung.entities.Orders;
import com.mdung.service.CookieService;
import com.mdung.service.ParamService;
import com.mdung.service.SessionService;

import jakarta.validation.Valid;

@Controller
public class AccountController {
	@Autowired
	AccountDao accountrepo;
	@Autowired
	SessionService sessionService;
	@Autowired
	ParamService paramService;
	@Autowired
	CookieService cookieService;
	@Autowired
	OrderDao orderDao;
	@Autowired
	DetailOrderDao detailOrderDao;

	@GetMapping("/register")
	public String register(@ModelAttribute("account") Account acc) {
		return "account/register";
	}

	@PostMapping("/account-register")
	public String register(@Valid @ModelAttribute("account") Account acc, BindingResult error, ModelMap model) {
		if (error.hasErrors()) {
			return "account/register";
		} else {
			acc.setRole(false);
			accountrepo.save(acc);
		}
		return "redirect:/";
	}

	@PostMapping("/account-login")
	public String login(Model model) {
		String username = paramService.getString("username", "");
		String password = paramService.getString("password", "");
		boolean rm = paramService.getBoolean("remember", false);
		Account acc = accountrepo.findByUsername(username, password);
		if (acc != null) {
			sessionService.set("accountlogin", acc);
		} else {
			return "redirect:/";
		}
		return "redirect:/";
	}

	@GetMapping("/account-management")
	public String register(Model model, @ModelAttribute("account") Account acc2) {
		List<Account> acc = accountrepo.findAll();
		model.addAttribute("accounts", acc);
		return "account/AccountManagement";
	}

	@PostMapping("/account-registerAdmin")
	public String registeradmin(@ModelAttribute("account") Account acc, ModelMap model) {
		accountrepo.save(acc);
		return "redirect:/account-management";
	}

	@GetMapping("/account-updateAdmin")
	public String updateaccountadmin(@ModelAttribute("account") Account acc2, ModelMap model,
			@RequestParam("id") int id) {
		List<Account> acc1 = accountrepo.findAll();
		Optional<Account> acc = accountrepo.findById(id);
		model.addAttribute("accounts", acc1);
		model.addAttribute("accountupdate", acc);
		return "account/AccountManagement";
	}

	@PostMapping("/account-updateAdmin")
	public String updateaccountadmin2(@ModelAttribute("account") Account acc, ModelMap model) {
		acc.setId(acc.getId());
		accountrepo.save(acc);
		return "redirect:/account-management";
	}

	@PostMapping("/account-delete")
	public String deleteaccount2(@ModelAttribute("account") Account acc, @RequestParam("iddelete") int id) {
		acc.setId(id);
		Orders od = orderDao.findAllByUserDelete(id);
		if (od == null) {
			accountrepo.deleteById(id);
		} else {
			try {
				detailOrderDao.deletebyOrder(od);
				orderDao.delete(od);
				accountrepo.deleteById(id);
			} catch (Exception e) {
				orderDao.delete(od);
				accountrepo.deleteById(id);
			}

		}

		return "redirect:/account-management";
	}

	@PostMapping("/changepassword")
	public String changepassword(@RequestParam("newpassword") String newpass) {
		Account newacc = sessionService.get("accountUpdate");
		newacc.setPassword(newpass);
		accountrepo.save(newacc);
		return "redirect:/";
	}

}
