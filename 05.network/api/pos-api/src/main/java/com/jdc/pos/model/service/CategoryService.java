package com.jdc.pos.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jdc.pos.model.entity.Category;
import com.jdc.pos.model.repo.CategoryRepo;

@Service
public class CategoryService {

	@Autowired
	private CategoryRepo repo;

	public List<Category> findAll() {
		return repo.findAll();
	}

	public Category findById(int id) {
		return repo.findById(id).orElseThrow();
	}

	public Category save(Category category) {
		return repo.save(category);
	}
}
