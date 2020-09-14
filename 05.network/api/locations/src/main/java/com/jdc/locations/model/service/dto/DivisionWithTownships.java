package com.jdc.locations.model.service.dto;

import java.util.List;

import com.jdc.locations.model.entity.Division;
import com.jdc.locations.model.entity.Township;

import lombok.Data;

@Data
public class DivisionWithTownships {

	private Division division;
	private List<Township> township;
}
