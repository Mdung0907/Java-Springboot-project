package com.mdung.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.mdung.entities.Orders;
import com.mdung.entities.OrdersDetail;
import com.mdung.entities.Product;
import jakarta.persistence.EntityManager;

public interface DetailOrderDao extends JpaRepository<OrdersDetail, Integer> {
	@Query(value = "select * from orderdetail where productid=?1 and status=0", nativeQuery = true)
	OrdersDetail findbyproduct(int id);

	@Query(value = "select * from orderdetail where orderid=?1", nativeQuery = true)
	List<OrdersDetail> findbyOrderId(int id);

	@Query(value = "delete orderdetail where orderid=?1", nativeQuery = true)
	void deletebyOrder(Orders id);

	@Query(value = "SELECT *from orderdetail where status=true", nativeQuery = true)
	List<OrdersDetail> findAllOrdersAndDetail();

	@Transactional
	@Modifying
	@Query(value = "update OrdersDetail o set o.status=true where o.orderid=:od")
	void updatebyOrder(@Param("od") Orders od);

	@Query(value = "SELECT *from orderdetail where checkstatus=true", nativeQuery = true)
	List<OrdersDetail> findAllOrders();
}
