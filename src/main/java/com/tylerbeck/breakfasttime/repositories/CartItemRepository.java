package com.tylerbeck.breakfasttime.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerbeck.breakfasttime.models.CartItem;

@Repository
public interface CartItemRepository extends CrudRepository<CartItem, Long> {

}
