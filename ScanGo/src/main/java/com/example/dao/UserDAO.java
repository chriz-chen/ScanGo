package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.User;

public interface UserDAO {

	int save(User user);
		
	Optional<User> findUserById(Integer userId);
	
	Optional<User> findUserByEmail(String email);
	
	List<User> findAllUsers();
	
}
