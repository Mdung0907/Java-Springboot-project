package com.mdung.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.introspect.TypeResolutionContext.Empty;
import com.mdung.dao.CategoryDao;
import com.mdung.dao.ProductDao;
import com.mdung.entities.Danhmuc;
import com.mdung.entities.Product;
import com.mdung.service.SessionService;

@Controller
public class HomeController {
	@Autowired
	ProductDao productrepo;
	@Autowired
	CategoryDao categoryrepo;
	@Autowired
	SessionService session;

	@GetMapping("/")
	public String searchAndPage(Model model, @RequestParam("keywords") Optional<String> kw,
			@RequestParam("min") Optional<Double> min, @RequestParam("max") Optional<Double> max,
			@RequestParam("p") Optional<Integer> p, @RequestParam("categoryID") Optional<Integer> cate,
			@RequestParam("Sort") Optional<String> paramSort) {

		List<Danhmuc> dm = categoryrepo.findAll();
		model.addAttribute("category", dm);
		double minPrice = min.orElse(session.get("minPrice", 0.0));
		double maxPrice = max.orElse(session.get("maxPrice", 10000.0));
		String keywords = kw.orElse(session.get("keywords", ""));
		String SortId = paramSort.orElse(session.get("Sort", ""));
		int ctg = cate.orElse(session.get("categoryID", 0));
		Optional<Danhmuc> danhmuc = categoryrepo.findById(ctg);
		int indexPage = 0;
		Pageable pageable;
		pageable = PageRequest.of(indexPage, 9);
		Page<Product> page;
		if (!p.isEmpty()) {
			indexPage = p.get() - 1;
			model.addAttribute("page", indexPage + 1);
			pageable = PageRequest.of(indexPage, 9);
		}
		if (!keywords.equals("") && minPrice == 0.0 && maxPrice == 10000.0 && ctg == 0) {
			session.set("keywords", keywords);
			page = productrepo.findAllByNameLike("%" + keywords + "%", pageable);
			model.addAttribute("page", page);
		} else if (!keywords.equals("") || minPrice != 0.0 && maxPrice != 10000.0 && ctg == 0) {
			session.set("keywords", keywords);
			page = productrepo.getAllProductBetweenPriceAndName(minPrice, maxPrice, "%" + keywords + "%", pageable);
			model.addAttribute("page", page);
		} else if (ctg != 0 && SortId.equals("")) {
			page = productrepo.getAllProductByCategory(minPrice, maxPrice, "%" + keywords + "%", danhmuc.get(),
					pageable);
			model.addAttribute("page", page);
		} else if (!SortId.equals("")) {
			switch (SortId) {
			case "ASC":
				Pageable sortedByPrice = PageRequest.of(indexPage, 9, Sort.by(Direction.ASC, ("price")));
				page = productrepo.findAll(sortedByPrice);
				model.addAttribute("page", page);
				break;
			case "DESC":
				Pageable sortedByPrice2 = PageRequest.of(indexPage, 9, Sort.by(Direction.DESC, ("price")));
				page = productrepo.findAll(sortedByPrice2);
				model.addAttribute("page", page);
				break;
			}
		} else {
			session.set("keywords", null);
			page = productrepo.findAll(pageable);
			model.addAttribute("page", page);
		}

		return "index";
	}

	@GetMapping("/list-view")
	public String listview() {
		return "list-view";
	}

	@GetMapping("/grid-view")
	public String gridview() {
		return "grid-view";
	}

	@GetMapping("/four-col-view")
	public String fourcol() {
		return "four-col-view";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/logout")
	public String logout() {
		session.set("accountlogin", null);
		return "redirect:/";
	}

}
