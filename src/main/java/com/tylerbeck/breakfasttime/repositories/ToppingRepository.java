package com.tylerbeck.breakfasttime.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerbeck.breakfasttime.models.Topping;

@Repository
public interface ToppingRepository extends CrudRepository<Topping, Long> {
	List<Topping> findAll();
}
