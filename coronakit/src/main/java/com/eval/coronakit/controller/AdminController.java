package com.eval.coronakit.controller;



import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.ProductService;

import ch.qos.logback.core.rolling.helper.IntegerTokenConverter;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	ProductService productService;
	
	@GetMapping("/home")
	public String home() {
		return "admin-home";
	}
	
	@GetMapping("/product-entry")
	public String productEntry(Model model) {
		ProductMaster product = new ProductMaster();
		model.addAttribute("product", product);
		return "add-new-item";
	}
	
	@PostMapping(value ="/product-save", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String productSave(@Valid @ModelAttribute("product") ProductMaster product, BindingResult result, Model model ) {
		if(result.hasErrors()) {
			return "add-new-item";
		}
		this.productService.addNewProduct(product);
		model.addAttribute("products", this.productService.getAllProducts());
		return "show-all-item-admin";
	}
	

	@GetMapping("/product-list")
	public String productList(Model model) {
		
		List<ProductMaster> products = this.productService.getAllProducts();
		model.addAttribute("products", products);
		return "show-all-item-admin";
	}
	
	@GetMapping("/product-delete/{productId}" )
	public String productDelete(@PathVariable("productId") int productId, Model model) {
		
		this.productService.deleteProduct(productId);
		model.addAttribute("products", this.productService.getAllProducts());
		return "show-all-item-admin";
	}
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		
		StringTrimmerEditor ste = new StringTrimmerEditor(true);
		
		binder.registerCustomEditor(String.class, ste);
		
	}
}
