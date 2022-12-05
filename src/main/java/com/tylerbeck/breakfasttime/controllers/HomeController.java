package com.tylerbeck.breakfasttime.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tylerbeck.breakfasttime.models.Cart;
import com.tylerbeck.breakfasttime.models.CartItem;
import com.tylerbeck.breakfasttime.models.MenuItem;
import com.tylerbeck.breakfasttime.models.Topping;
import com.tylerbeck.breakfasttime.models.User;
import com.tylerbeck.breakfasttime.service.OrderService;
import com.tylerbeck.breakfasttime.service.UserService;
import com.tylerbeck.breakfasttime.validators.UserValidator;

@Controller
public class HomeController {
	@Autowired
	private UserService uService;
	@Autowired
	private OrderService oService;
	@Autowired
	private UserValidator validator;
	
	@GetMapping("")
	public String registration(@ModelAttribute("user") User user) {
		return "registration.jsp";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login.jsp";
	}
	
	
	@PostMapping(value="/register")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
	    validator.validate(user, result);
		if(result.hasErrors()) {
	    	return "registration.jsp";
	    }
	    User newUser = this.uService.registerUser(user);
	    session.setAttribute("user__id", newUser.getId());
	    Cart cart = new Cart();
    	newUser.setCart(cart);
    	this.oService.createCart(cart);
	    session.setAttribute("cart__id", user.getCart().getId());
	    return "redirect:/home";
	}
	
	@PostMapping(value="/login")
	public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, RedirectAttributes redirectAttrs, HttpSession session) {
	    if(!this.uService.authenticateUser(email, password)) {
	    	redirectAttrs.addFlashAttribute("loginError", "Invalid Credentials");
	    	return "redirect:/login";
	    }
	    User user = this.uService.getByEmail(email);
	    session.setAttribute("user__id", user.getId());
	    if(user.getCart() == null) {
	    	Cart cart = new Cart();
	    	user.setCart(cart);
	    	this.oService.createCart(cart);
	    	System.out.println("cart null");
	    } else {
	    	session.setAttribute("cart__id", user.getCart().getId());
	    }
	    return "redirect:/home";
	}   
	 
	@GetMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
	@GetMapping("/home")
	public String home(HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user__id");
	    User user = this.uService.find(userId);
	    Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);
	    viewModel.addAttribute("cart", cart);
	    viewModel.addAttribute("loggedUser", user);
		
	    return "quickOptions.jsp";
	}
	
	@GetMapping("/account/{id}")
	public String accountInfo(@PathVariable("id") Long id, HttpSession session, Model viewModel) {
		Long userId = (Long)session.getAttribute("user__id");
		User user = this.uService.find(userId);
		viewModel.addAttribute("loggedUser", user);
	    Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);
	    viewModel.addAttribute("cart", cart);
	    viewModel.addAttribute("orders", user.getOrders());
		//add view model for orders
		return "accountInfo.jsp";
	}
	
	@GetMapping("/customize/{id}")
	public String customize(@PathVariable("id") Long id, Model viewModel, HttpSession session, @ModelAttribute("cartItem") CartItem cartItem) {
	    Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);
	    viewModel.addAttribute("cart", cart);
	    Long userId = (Long)session.getAttribute("user__id");
		User user = this.uService.find(userId);
		viewModel.addAttribute("loggedUser", user);
		viewModel.addAttribute("menuItem", this.oService.getOneMenuItem(id));
		viewModel.addAttribute("toppings", this.oService.getAllToppings());
		return "customize.jsp";
	}
	
	@PostMapping("/addToCart/{id}")
	public String addToCart(HttpSession session, 
			@PathVariable("id") Long id,
			@RequestParam("quantity") int quantity,
			@RequestParam(value = "1", required = false) String toppingOne,
			@RequestParam(value = "2", required = false) String toppingTwo,
			@RequestParam(value = "3", required = false) String toppingThree,
			@RequestParam(value = "4", required = false) String toppingFour,
			@RequestParam(value = "5", required = false) String toppingFive,
			@RequestParam(value = "6", required = false) String toppingSix) {
		Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);	
	    MenuItem menuItem = this.oService.getOneMenuItem(id);
	    CartItem cartItem = new CartItem();
	    cartItem.setCart(cart);
	    cartItem.setMenuItem(menuItem);
	    cartItem.setQuantity(quantity);
	    this.oService.createCartItem(cartItem);	
	    String[] toppings = {toppingOne, toppingTwo, toppingThree, toppingFour, toppingFive, toppingSix};
	    for(int i = 0; i < toppings.length; i++) {
	    	if(toppings[i] != null) {
	    		Long toppingId = (long) (i + 1);
	    		System.out.println(toppingId);
	    		Topping topping = this.oService.getOneTopping(toppingId);
	    		System.out.println(topping.getName());
	    		this.oService.addTopping(cartItem, topping);
	    	}
	    }		
		return "redirect:/checkout";
	}
	
	@GetMapping("/addToCart/3")
	public String addToCart(HttpSession session) {
		Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);	
	    MenuItem menuItem = this.oService.getOneMenuItem((long) 3);
	    CartItem cartItem = new CartItem();
	    cartItem.setCart(cart);
	    cartItem.setMenuItem(menuItem);
	    cartItem.setQuantity(1);
	    this.oService.createCartItem(cartItem);	
		return "redirect:/checkout";
	}
	
	@GetMapping("/remove/{id}")
	public String removeFromCart(HttpSession session, @PathVariable("id") Long id) {
		Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);
	    CartItem cartItem = this.oService.getOneCartItem(id);
	    System.out.println(id);
	    this.oService.removeFromCart(cart, cartItem);
	    return "redirect:/checkout";
	}
	
	@GetMapping("/checkout")
	public String checkout(HttpSession session, Model viewModel) {
	    Long cartId = (Long)session.getAttribute("cart__id");
	    Cart cart = this.oService.getOneCart(cartId);
	    this.oService.getTotalCost(cart);
	    viewModel.addAttribute("cart", cart);
	    
		return "checkout.jsp";
	}
	
	@PostMapping("/purchase")
	public String purchase(HttpSession session, @RequestParam("delivery") Boolean delivery) {
		//get cart and user
		 Long cartId = (Long)session.getAttribute("cart__id");
		 Cart cart = this.oService.getOneCart(cartId);
		 Long userId = (Long)session.getAttribute("user__id");
		 User user = this.uService.find(userId);
		 //set cart attributes
		 cart.setDelivery(delivery);
		 this.oService.purchase(cart);
		 //link cart to order
		 this.oService.createOrder(cart, user);
		 //make new cart
		 Cart newCart = new Cart();
		 user.setCart(newCart);
	     this.oService.createCart(cart);
		 session.setAttribute("cart__id", user.getCart().getId());
		 //redirect
		 return "redirect:/account/" + userId;
	}
}
