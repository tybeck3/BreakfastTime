package com.tylerbeck.breakfasttime.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerbeck.breakfasttime.models.Order;

@Repository
public interface OrderRepository extends CrudRepository<Order, Long> {

}
