package com.jdc.pos.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jdc.pos.model.entity.Category;

public interface CategoryRepo extends JpaRepository<Category, Integer>{

}
