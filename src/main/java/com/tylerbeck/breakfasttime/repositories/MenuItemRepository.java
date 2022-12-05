package com.tylerbeck.breakfasttime.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.tylerbeck.breakfasttime.models.MenuItem;

@Repository
public interface MenuItemRepository extends CrudRepository<MenuItem, Long> {

}
