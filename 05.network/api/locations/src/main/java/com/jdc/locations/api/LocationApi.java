package com.jdc.locations.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.jdc.locations.model.entity.Division;
import com.jdc.locations.model.service.LocationService;
import com.jdc.locations.model.service.dto.DivisionWithTownships;

@RestController
@RequestMapping("/locations")
public class LocationApi {

	@Autowired
	private LocationService service;
	
	@GetMapping
	public List<Division> divisions() {
		return service.findAll();
	}
	
	@GetMapping("{id}")
	public DivisionWithTownships findById(@PathVariable int id) {
		return service.findById(id);
	}
}
