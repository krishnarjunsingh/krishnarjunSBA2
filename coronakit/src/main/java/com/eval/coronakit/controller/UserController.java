package com.eval.coronakit.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eval.coronakit.entity.CoronaKit;
import com.eval.coronakit.entity.KitDetail;
import com.eval.coronakit.entity.ProductMaster;
import com.eval.coronakit.service.CoronaKitService;
import com.eval.coronakit.service.KitDetailService;
import com.eval.coronakit.service.ProductService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	ProductService productService;
	
	@Autowired
	CoronaKitService coronaKitService;
	
	@Autowired
	KitDetailService kitDetailService;
	
	@RequestMapping("/home")
	public String home() {
		return "user-home";
	}
	
	@RequestMapping("/show-kit")
	public String showKit(@ModelAttribute("products") ProductMaster products, BindingResult result, Model model) {
		model.addAttribute("products",  this.kitDetailService.getProductsInCart());
		return "show-cart";
	}

	@RequestMapping("/show-list")
	public String showList(Model model) {
	List<ProductMaster> products = this.productService.getAllProducts();
	model.addAttribute("products", products);
		return "show-all-item-user";
	}
	
	@GetMapping("/add-to-cart/{productId}")
	public String showKit(@PathVariable("productId") int productId, Model model) {
		this.productService.getProductById(productId).ifPresent(this.kitDetailService::addKitItem);
		model.addAttribute("products", this.kitDetailService.getProductsInCart());
		return "show-cart";
	}
	
	@RequestMapping("/checkout")
	public String checkout(Model model) {
		CoronaKit ckit = new CoronaKit();
		model.addAttribute("ckit", ckit);
		return "checkout-address";
	}
	
	@RequestMapping(value = "/finalize", method = RequestMethod.POST)
	public String finalizeOrder(@ModelAttribute("ckit") CoronaKit ckit, BindingResult result, String address, Model model) {
		if(result.hasErrors()) {
			return "checkout-address";
		}
		model.addAttribute("products", this.kitDetailService.getProductsInCart());
		return "show-summary";
	}
	
	@GetMapping("/delete/{itemId}")
	public String deleteItem(@PathVariable("itemId") int itemId, Model model) {
		 this.productService.getProductById(itemId).ifPresent(this.kitDetailService::removeProduct);
		 model.addAttribute("products", this.kitDetailService.getProductsInCart());
		return "show-cart";
	}
}
