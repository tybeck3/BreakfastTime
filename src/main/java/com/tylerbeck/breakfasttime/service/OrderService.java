package com.tylerbeck.breakfasttime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tylerbeck.breakfasttime.models.Cart;
import com.tylerbeck.breakfasttime.models.CartItem;
import com.tylerbeck.breakfasttime.models.MenuItem;
import com.tylerbeck.breakfasttime.models.Order;
import com.tylerbeck.breakfasttime.models.Topping;
import com.tylerbeck.breakfasttime.models.User;
import com.tylerbeck.breakfasttime.repositories.CartItemRepository;
import com.tylerbeck.breakfasttime.repositories.CartRepository;
import com.tylerbeck.breakfasttime.repositories.MenuItemRepository;
import com.tylerbeck.breakfasttime.repositories.OrderRepository;
import com.tylerbeck.breakfasttime.repositories.ToppingRepository;

@Service
public class OrderService {
	@Autowired
	private OrderRepository oRepo;
	@Autowired 
	private MenuItemRepository mRepo;
	@Autowired
	private ToppingRepository tRepo;
	@Autowired
	private CartRepository cRepo;
	@Autowired
	private CartItemRepository iRepo;

	public MenuItem getOneMenuItem(Long id) {
		return this.mRepo.findById(id).orElse(null);
	}

	public List<Topping> getAllToppings() {
		return this.tRepo.findAll();
	}
	
	public Topping getOneTopping(Long id) {
		return this.tRepo.findById(id).orElse(null);
	}
	
	public Cart getOneCart(Long id) {
		return this.cRepo.findById(id).orElse(null);
	}
	
	public CartItem getOneCartItem(Long id) {
		return this.iRepo.findById(id).orElse(null);
	}
	
	public Cart createCart(Cart cart) {
		cart.setPurchased(false);
		return cRepo.save(cart);
	}

	public CartItem createCartItem(CartItem cartItem) {
		return this.iRepo.save(cartItem);
		
	}

	public void addToCart(Cart cart, CartItem cartItem) {
		List<CartItem> cartItems = cart.getCartItems();
		cartItems.add(cartItem);
		cart.setCartItems(cartItems);
		this.cRepo.save(cart);
	}
	
	public void addTopping(CartItem cartItem, Topping topping) {
		List<CartItem> cartItems = topping.getToppingCarts();
		System.out.println(topping);
		cartItems.add(cartItem);
		this.tRepo.save(topping);
	}
	
	public void getTotalCost(Cart cart) {
		List<CartItem> cartItems = cart.getCartItems();
		Double total = 0.0;
		for(CartItem cartItem : cartItems) {
			Double itemCost = cartItem.getMenuItem().getCost() * cartItem.getQuantity();
			total = total + itemCost;
		}
		System.out.println(total);
		cart.setCost(total);
		this.cRepo.save(cart);
	}

	public void purchase(Cart cart) {
		cart.setPurchased(true);
		this.cRepo.save(cart);
		
	}

	public void createOrder(Cart cart, User user) {
		Order order = new Order();
		order.setCart(cart);
		order.setUser(user);
		this.oRepo.save(order);
	}

	public void removeFromCart(Cart cart, CartItem cartItem) {
		List<CartItem> cartItems = cart.getCartItems();
		cartItems.remove(cartItem);
		cart.setCartItems(cartItems);
		this.cRepo.save(cart);
	}

}
