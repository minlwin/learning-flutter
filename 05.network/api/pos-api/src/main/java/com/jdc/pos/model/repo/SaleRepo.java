package com.jdc.pos.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jdc.pos.model.entity.Sale;

public interface SaleRepo extends JpaRepository<Sale, Integer>{

}
