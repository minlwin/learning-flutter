package com.jdc.pos.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Predicate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jdc.pos.model.entity.Category_;
import com.jdc.pos.model.entity.Product;
import com.jdc.pos.model.entity.Product_;
import com.jdc.pos.model.repo.ProductRepo;

@Service
public class ProductService {

	@Autowired
	private ProductRepo repo;

	public List<Product> search(int category, String name) {

		Specification<Product> spec = (root, query, builder) -> {

			var predicates = new ArrayList<Predicate>();

			if (category > 0) {
				var pred = builder.equal(root.get(Product_.category)
						.get(Category_.id), category);
				predicates.add(pred);
			}

			if (!StringUtils.isEmpty(name)) {
				var pred  = builder.like(builder.lower(root.get(Product_.name)), 
						name.toLowerCase().concat("%"));
				predicates.add(pred);
			}

			return builder.and(predicates.toArray(new Predicate[predicates.size()]));
		};

		return repo.findAll(spec);
	}

	public Product save(Product prod) {
		return repo.save(prod);
	}

	public Product findById(int id) {
		return repo.findById(id).orElseThrow();
	}

	public long count() {
		return repo.count();
	}
}
