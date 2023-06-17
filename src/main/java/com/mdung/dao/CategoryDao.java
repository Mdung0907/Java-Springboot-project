package com.mdung.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mdung.entities.Danhmuc;

public interface CategoryDao extends JpaRepository<Danhmuc, Integer>{

}
