package com.mdung.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mdung.entities.Account;
import com.mdung.entities.Orders;
import com.mdung.entities.Product;


public interface OrderDao extends JpaRepository<Orders, Integer> {
	@Query(value = "SELECT * FROM Orders  WHERE user=?1 and status=false", nativeQuery = true)
	Orders findAllByUser(int id);
	
	@Query(value = "SELECT * FROM Orders  WHERE user=?1 ", nativeQuery = true)
	Orders findAllByUserDelete(int id);
	
	
}
