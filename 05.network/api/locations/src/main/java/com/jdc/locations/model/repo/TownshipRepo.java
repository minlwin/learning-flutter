package com.jdc.locations.model.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jdc.locations.model.entity.Township;

public interface TownshipRepo extends JpaRepository<Township, Integer> {

	List<Township> findByDivisionId(int id);

}
