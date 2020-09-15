package com.jdc.pos.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.pos.model.entity.Category;
import com.jdc.pos.model.service.CategoryService;

import io.swagger.v3.oas.annotations.parameters.RequestBody;

@RestController
@RequestMapping("/categories")
public class CategoryApi {

	@Autowired
	private CategoryService service;
	
	@GetMapping
	public List<Category> index() {
		return service.findAll();
	}
	
	@GetMapping("{id}")
	public Category findById(@PathVariable int id) {
		return service.findById(id);
	}
	
	@PostMapping
	public Category create(@RequestBody Category category) {
		return service.save(category);
	}

	@PutMapping
	public Category update(@RequestBody Category category) {
		return service.save(category);
	}
}
