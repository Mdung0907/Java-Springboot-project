package com.mdung.controller;

import jakarta.mail.MessagingException;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mdung.dao.AccountDao;
import com.mdung.entities.Account;
import com.mdung.service.MailerService;
import com.mdung.service.SessionService;

@Controller
public class MailController {
	@Autowired
	MailerService mailer;
	@Autowired
	SessionService sessionService;
	@Autowired
	AccountDao accountrepo;

	@GetMapping("/forgotPassword")
	public String SendEmail(Model model) {
		return "account/forgotPassword";
	}

	@GetMapping("/forgotPasswordContinue")
	public String forgotcontinue() {
		return "account/forgotPasswordContinue";

	}

	@GetMapping("/changepassword")
	public String changepassowrd() {
		return "account/ChangePassword";

	}

	@PostMapping("/forgotPassword")
	public String forgot(Model model, @RequestParam("email") String email) {
		Account acc = accountrepo.findByEmail(email);

		if (acc == null) {
			model.addAttribute("messageEmail", "Email invalid");
			return "account/forgotPassword";
		} else {
			try {
				String code = getRandomNumberString();
				mailer.send(email, "Confirm your Account", code);
				sessionService.set("codesend", code);
				sessionService.set("accountUpdate", acc);
			} catch (MessagingException e) {
			}
		}
		return "redirect:/forgotPasswordContinue";
	}

	@PostMapping("/forgotPasswordContinue")
	public String forgot3(Model model, @RequestParam("code") String code) {
		if (code.equals(sessionService.get("codesend"))) {
			sessionService.set("codesend", null);
			return "redirect:/changepassword";
		} else {
			model.addAttribute("messagecode", "Code wrong");
			return "account/forgotPasswordContinue";
		}
	}

	public static String getRandomNumberString() {
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		return String.format("%06d", number);
	}
}
