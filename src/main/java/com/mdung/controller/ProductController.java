package com.mdung.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.mdung.dao.CategoryDao;
import com.mdung.dao.ProductDao;
import com.mdung.entities.Danhmuc;
import com.mdung.entities.Product;
import com.mdung.entities.ProductSaveFile;
import com.mdung.service.ParamService;
import com.mdung.service.SessionService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
	@Autowired
	ProductDao productrepo;
	@Autowired
	CategoryDao caterepo;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;

	@GetMapping("/product-management")
	public String ProductManagement(Model model, @ModelAttribute("product") Product pro) {
		List<Product> pro2 = productrepo.findAll();
		List<Danhmuc> dm = caterepo.findAll();
		model.addAttribute("products", pro2);
		model.addAttribute("dm", dm);
		return "ProductManagement";
	}

	@PostMapping("/product-create")
	public String ProductSave(@ModelAttribute("product") ProductSaveFile pro, ModelMap model) {
		Product product = new Product();
		Date newdate = new Date();
		product.setName(pro.getName());
		product.setPrice(pro.getPrice());
		product.setDescription(pro.getDescription());
		product.setCategory(pro.getCategory());
		product.setQuantity(pro.getQuantity());
		product.setDatecreated(newdate);
		product.setStatus(true);
		product.setImage(pro.getImage().getOriginalFilename());
		paramService.save(pro.getImage(), "/images/" + pro.getImage().getOriginalFilename());
		productrepo.save(product);
		return "redirect:/product-management";
	}

	@GetMapping("/product-update")
	public String ProductUpdate(ModelMap model, @RequestParam("id") int id,
			@ModelAttribute("product") ProductSaveFile pro) {
		List<Product> pro2 = productrepo.findAll();
		List<Danhmuc> dm = caterepo.findAll();
		Optional<Product> proc = productrepo.findById(id);
		model.addAttribute("test", proc);
		model.addAttribute("products", pro2);
		model.addAttribute("dm", dm);
		return "ProductManagement";
	}

	@PostMapping("/product-update")
	public String ProductUpdateSave(@ModelAttribute("product") ProductSaveFile pro) {
		Product product = new Product();
		Optional<Product> product2 = productrepo.findById(pro.getId());
		product.setId(pro.getId());
		product.setName(pro.getName());
		product.setPrice(pro.getPrice());
		product.setDescription(pro.getDescription());
		product.setCategory(pro.getCategory());
		product.setQuantity(pro.getQuantity());
		product.setDatecreated(product2.get().getDatecreated());
		product.setStatus(pro.getStatus());
		product.setImage(pro.getImage().getOriginalFilename());
		paramService.save(pro.getImage(), "/images/" + pro.getImage().getOriginalFilename());
		productrepo.save(product);
		return "redirect:/product-management";
	}

	@GetMapping("/product-delete")
	public String Productdelete(ModelMap model, @RequestParam("iddelete") int id,
			@ModelAttribute("product") ProductSaveFile pro) {
		List<Product> pro2 = productrepo.findAll();
		List<Danhmuc> dm = caterepo.findAll();
		model.addAttribute("products", pro2);
		model.addAttribute("dm", dm);
		return "ProductManagement";
	}

	@PostMapping("/product-delete")
	public String Productdelete2(ModelMap model, @RequestParam("iddelete") int id,
			@ModelAttribute("product") ProductSaveFile pro) {
		productrepo.deleteById(id);
		return "redirect:/product-management";
	}

	@GetMapping("/product_details")
	public String Productdetails(ModelMap model, @RequestParam("id") int id) {
		Optional<Product> pro = productrepo.findById(id);
		model.addAttribute("details", pro);
		return "product/product_details";
	}
}
