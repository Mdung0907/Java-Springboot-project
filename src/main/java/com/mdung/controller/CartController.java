package com.mdung.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mdung.dao.CategoryDao;
import com.mdung.dao.DetailOrderDao;
import com.mdung.dao.OrderDao;
import com.mdung.dao.ProductDao;
import com.mdung.entities.Account;
import com.mdung.entities.Orders;

import com.mdung.entities.OrdersDetail;
import com.mdung.entities.Product;
import com.mdung.service.ParamService;
import com.mdung.service.SessionService;

@Controller
public class CartController {
	@Autowired
	ProductDao productrepo;
	@Autowired
	CategoryDao categoryrepo;
	@Autowired
	SessionService session;
	@Autowired
	OrderDao orderDao;
	@Autowired
	DetailOrderDao detailOrderDao;
	@Autowired
	ParamService param;

	@GetMapping("/cart")
	public String cart(Model model) {
		Account acc = session.get("accountlogin");
		Orders orders = orderDao.findAllByUser(acc.getId());
		if (orders == null) {
			return "cart/cartindex";
		} else {
			List<OrdersDetail> oddt = detailOrderDao.findbyOrderId(orders.getId());
			model.addAttribute("orders", orders);
			model.addAttribute("orderdetail", oddt);
		}
		return "cart/cartindex";
	}

	@GetMapping("/cartManagement")
	public String cart2(Model model) {
		List<OrdersDetail> od = detailOrderDao.findAllOrdersAndDetail();
		model.addAttribute("orderanddetail", od);
		return "cart/cartManagement";
	}

	@GetMapping("/addtoCart")
	public String addtocart(@RequestParam("id") int idproduct) {
		Account acc = session.get("accountlogin");
		Orders orders = orderDao.findAllByUser(acc.getId());
		OrdersDetail oddt = detailOrderDao.findbyproduct(idproduct);
		Orders od = new Orders();
		Date date = new Date();
		if (orders == null) {
			od.setUser(acc);
			od.setCreatedate(date);
			od.setStatus(false);
			orderDao.save(od);

			OrdersDetail detail = new OrdersDetail();
			Optional<Product> pd = productrepo.findById(idproduct);
			detail.setOrderid(od);
			detail.setProductid(pd.get());
			detail.setQuantity(1);
			detail.setPrice(pd.get().getPrice());
			detail.setCreatedate(date);
			detail.setStatus(false);
			detailOrderDao.save(detail);

		} else {

			if (oddt == null) {
				OrdersDetail detail = new OrdersDetail();
				Optional<Product> pd = productrepo.findById(idproduct);
				detail.setOrderid(orders);
				detail.setProductid(pd.get());
				detail.setQuantity(1);
				detail.setPrice(pd.get().getPrice());
				detail.setCreatedate(date);
				detail.setStatus(false);
				detailOrderDao.save(detail);
			} else {
				OrdersDetail od2 = new OrdersDetail();
				od2.setId(oddt.getId());
				od2.setCreatedate(oddt.getCreatedate());
				od2.setOrderid(oddt.getOrderid());
				od2.setProductid(oddt.getProductid());
				od2.setStatus(oddt.isStatus());
				od2.setQuantity(oddt.getQuantity() + 1);
				od2.setPrice(oddt.getPrice());
				detailOrderDao.save(od2);
			}
		}

		return "redirect:/";
	}

	@GetMapping("/addtoCartNullAccount")
	public String addtocart2(@RequestParam("id") int idproduct) {
		Account acc = session.get("accountlogin");
		Orders orders = orderDao.findAllByUser(acc.getId());
		OrdersDetail oddt = detailOrderDao.findbyproduct(idproduct);
		Orders od = new Orders();
		Date date = new Date();
		if (orders == null) {
			od.setUser(acc);
			od.setCreatedate(date);
			od.setStatus(false);
			orderDao.save(od);

			OrdersDetail detail = new OrdersDetail();
			Optional<Product> pd = productrepo.findById(idproduct);
			detail.setOrderid(od);
			detail.setProductid(pd.get());
			detail.setQuantity(1);
			detail.setPrice(pd.get().getPrice());
			detail.setCreatedate(date);
			detail.setStatus(false);
			detail.setCheckstatus(false);
			detailOrderDao.save(detail);

		} else {

			if (oddt == null) {
				OrdersDetail detail = new OrdersDetail();
				Optional<Product> pd = productrepo.findById(idproduct);
				detail.setOrderid(orders);
				detail.setProductid(pd.get());
				detail.setQuantity(1);
				detail.setPrice(pd.get().getPrice());
				detail.setCreatedate(date);
				detail.setStatus(false);
				detail.setCheckstatus(false);
				detailOrderDao.save(detail);
			} else {
				OrdersDetail od2 = new OrdersDetail();
				od2.setId(oddt.getId());
				od2.setCreatedate(oddt.getCreatedate());
				od2.setOrderid(oddt.getOrderid());
				od2.setProductid(oddt.getProductid());
				od2.setStatus(oddt.isStatus());
				od2.setQuantity(oddt.getQuantity() + 1);
				od2.setPrice(oddt.getPrice());
				od2.setCheckstatus(oddt.isCheckstatus());
				detailOrderDao.save(od2);
			}
		}

		return "redirect:/";
	}

	@GetMapping("/cart/update")
	public String update() {
		Integer id = param.getInt("id", 0);
		int qty = param.getInt("qty", 0);
		if (qty < 1) {
			detailOrderDao.deleteById(id);
		} else {
			Optional<OrdersDetail> od = detailOrderDao.findById(id);
			OrdersDetail od2 = new OrdersDetail();
			od2.setId(od.get().getId());
			od2.setCreatedate(od.get().getCreatedate());
			od2.setOrderid(od.get().getOrderid());
			od2.setProductid(od.get().getProductid());
			od2.setStatus(od.get().isStatus());
			od2.setQuantity(qty);
			od2.setPrice(od.get().getPrice());
			od2.setCheckstatus(od.get().isCheckstatus());
			detailOrderDao.save(od2);
		}
		return "redirect:/cart";
	}

	@GetMapping("/cart/update+1")
	public String update1() {
		Integer id = param.getInt("id", 0);
		int qty = param.getInt("qty", 0) + 1;
		Optional<OrdersDetail> od = detailOrderDao.findById(id);
		OrdersDetail od2 = new OrdersDetail();
		od2.setId(od.get().getId());
		od2.setCreatedate(od.get().getCreatedate());
		od2.setOrderid(od.get().getOrderid());
		od2.setProductid(od.get().getProductid());
		od2.setStatus(od.get().isStatus());
		od2.setQuantity(qty);
		od2.setPrice(od.get().getPrice());
		od2.setCheckstatus(od.get().isCheckstatus());
		detailOrderDao.save(od2);
		return "redirect:/cart";
	}

	@GetMapping("/cart/update-1")
	public String update2() {
		Integer id = param.getInt("id", 0);
		int qty = param.getInt("qty", 0) - 1;
		if (qty < 1) {
			detailOrderDao.deleteById(id);
		} else {
			Optional<OrdersDetail> od = detailOrderDao.findById(id);
			OrdersDetail od2 = new OrdersDetail();
			od2.setId(od.get().getId());
			od2.setCreatedate(od.get().getCreatedate());
			od2.setOrderid(od.get().getOrderid());
			od2.setProductid(od.get().getProductid());
			od2.setStatus(od.get().isStatus());
			od2.setQuantity(qty);
			od2.setPrice(od.get().getPrice());
			od2.setCheckstatus(od.get().isCheckstatus());
			detailOrderDao.save(od2);
		}
		return "redirect:/cart";
	}

	@GetMapping("/deleteItem")
	public String delete(@RequestParam("id") int id) {
		detailOrderDao.deleteById(id);
		return "redirect:/cart";
	}

	@GetMapping("/ViewOrders")
	public String vieworders(Model model) {
		List<OrdersDetail> od = detailOrderDao.findAllOrdersAndDetail();
		model.addAttribute("orderanddetail", od);
		return "cart/ViewOrders";
	}

	@PostMapping("/Pay")
	public String Pay() {
		String address = param.getString("address", null);
		String phonenumber = param.getString("phonenumber", null);
		Account acc = session.get("accountlogin");
		Orders od = orderDao.findAllByUser(acc.getId());
		od.setAddress(address);
		od.setPhonenumber(phonenumber);
		od.setStatus(true);

		detailOrderDao.updatebyOrder(od);
		orderDao.save(od);
		return "redirect:/ViewOrders";
	}

	@PostMapping("/confirm-item")
	public String confirm(@RequestParam("id") int id) {
		Optional<OrdersDetail> oddt = detailOrderDao.findById(id);
		oddt.get().setCheckstatus(true);
		detailOrderDao.save(oddt.get());
		return "redirect:/cartManagement";
	}

	@PostMapping("/delete-item")
	public String deleteitem(@RequestParam("iditem") int id) {
		detailOrderDao.deleteById(id);
		return "redirect:/ViewOrders";
	}
	
	@GetMapping("/History")
	public String history(Model model) {
		List<OrdersDetail> od = detailOrderDao.findAllOrders();
		model.addAttribute("orderhistory", od);
		return "cart/History";
	}
}
