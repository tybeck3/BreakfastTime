package com.tylerbeck.breakfasttime.models;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "toppings")
public class Topping {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String name;
	private double cost;
	@ManyToMany(fetch=FetchType.LAZY)
	@JoinTable(
			name = "cart_toppings",
			joinColumns = @JoinColumn(name = "topping_id"),
			inverseJoinColumns = @JoinColumn(name = "cartItem_id")
			)
	private List<CartItem> toppingCarts;
	
	public Topping() {
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getCost() {
		return cost;
	}
	public void setCost(double cost) {
		this.cost = cost;
	}

	public List<CartItem> getToppingCarts() {
		return toppingCarts;
	}

	public void setToppingCarts(List<CartItem> toppingCarts) {
		this.toppingCarts = toppingCarts;
	}
	
}
