package com.mdung.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mdung.entities.Danhmuc;
import com.mdung.entities.Product;

public interface ProductDao extends JpaRepository<Product, Integer> {
	Page<Product> findAllByNameLike(String keywords, Pageable pageable);

	List<Product> findByPriceBetween(double minPrice, double maxPrice);

	@Query(value = "SELECT * FROM Product  WHERE gia BETWEEN ?1 AND ?2", nativeQuery = true)
	Page<Product> findAllByPrice2(double minPrice, double maxPrice, Pageable pageable);

	@Query("select p from Product p where p.price BETWEEN ?1 and ?2 and p.name like ?3")
	Page<Product> getAllProductBetweenPriceAndName(double min, double max, String name, Pageable pageable);

	@Query("select p from Product p where p.price BETWEEN ?1 and ?2 and p.name like ?3 and p.category=?4  ")
	Page<Product> getAllProductByCategory(double min, double max, String name,Danhmuc ctg, Pageable pageable);

}
