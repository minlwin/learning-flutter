package com.jdc.pos.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jdc.pos.model.entity.SaleDetails;

public interface SaleDetailRepo extends JpaRepository<SaleDetails, Integer>{

}
