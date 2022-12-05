package com.tylerbeck.breakfasttime.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerbeck.breakfasttime.models.Cart;

@Repository
public interface CartRepository extends CrudRepository<Cart, Long> {
	List<Cart> findAll();

}
