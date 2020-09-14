package com.jdc.locations.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jdc.locations.model.entity.Division;
import com.jdc.locations.model.repo.DivisionRepo;
import com.jdc.locations.model.repo.TownshipRepo;
import com.jdc.locations.model.service.dto.DivisionWithTownships;

@Service
public class LocationService {
	
	@Autowired
	private DivisionRepo divisions;
	
	@Autowired
	private TownshipRepo townships;

	public List<Division> findAll() {
		return divisions.findAll();
	}

	@Transactional
	public DivisionWithTownships findById(int id) {
		DivisionWithTownships dto = new DivisionWithTownships();
		dto.setDivision(divisions.findById(id).orElseThrow());
		dto.setTownship(townships.findByDivisionId(id));
		return dto;
	}

}
