package com.jdc.locations.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jdc.locations.model.entity.Division;

public interface DivisionRepo extends JpaRepository<Division, Integer>{

}
