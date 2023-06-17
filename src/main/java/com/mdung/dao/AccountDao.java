package com.mdung.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.mdung.entities.Account;
public interface AccountDao extends JpaRepository<Account, Integer>{
	@Query(value="select*from Account where username=?1 && password=?2",nativeQuery = true)
	Account findByUsername(String username,String Password);
	
	@Query("SELECT c FROM Account c WHERE c.email = ?1")
    public Account findByEmail(String email); 
	
	@Query(value="select*from Account where username=?1 && password=?2",nativeQuery = true)
	void UpdatePassword(String username,String Password);
}
