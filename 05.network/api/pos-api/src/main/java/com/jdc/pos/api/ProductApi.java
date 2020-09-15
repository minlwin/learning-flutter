package com.jdc.pos.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.pos.model.entity.Product;
import com.jdc.pos.model.service.ProductService;

@RestController
@RequestMapping("products")
public class ProductApi {

	@Autowired
	private ProductService service;
	
	@GetMapping
	public List<Product> search(
			@RequestParam(required = false, defaultValue = "0") int category, 
			@RequestParam(required = false, defaultValue = "") String name) {
		return service.search(category, name);
	}
	
	@GetMapping("{id}")
	public Product findById(@PathVariable int id) {
		return service.findById(id);
	}
	
	@PostMapping
 	public Product create(@RequestBody Product prod) {
		return service.save(prod);
	}
	
	@PutMapping
 	public Product update(@RequestBody Product prod) {
		return service.save(prod);
	}
}
