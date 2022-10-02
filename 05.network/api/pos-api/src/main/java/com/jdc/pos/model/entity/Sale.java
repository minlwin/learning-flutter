package com.jdc.pos.model.entity;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Sale {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime saleTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getSaleTime() {
		return saleTime;
	}

	public void setSaleTime(LocalDateTime saleTime) {
		this.saleTime = saleTime;
	}

}
