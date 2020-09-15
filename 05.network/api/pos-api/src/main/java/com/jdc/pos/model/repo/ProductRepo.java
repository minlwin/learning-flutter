package com.jdc.pos.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.jdc.pos.model.entity.Product;

public interface ProductRepo extends JpaRepository<Product, Integer>, JpaSpecificationExecutor<Product>{

}
