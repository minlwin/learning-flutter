package com.jdc.locations.model.service.dto;

import java.util.List;

import com.jdc.locations.model.entity.Division;
import com.jdc.locations.model.entity.Township;

public class DivisionWithTownships {

	private Division division;
	private List<Township> township;

	public Division getDivision() {
		return division;
	}

	public void setDivision(Division division) {
		this.division = division;
	}

	public List<Township> getTownship() {
		return township;
	}

	public void setTownship(List<Township> township) {
		this.township = township;
	}

}
