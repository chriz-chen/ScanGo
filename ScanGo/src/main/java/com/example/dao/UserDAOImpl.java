package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.User;

@Component("userDaoImpl")
public class UserDAOImpl implements UserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public int save(User user) {
		String sql = "insert into User(firstName,lastName,email,password,avator) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(sql, user.getFirstName(),user.getLastName(),user.getEmail(), user.getPassword(),user.getAvator());
	}

	@Override
	public Optional<User> findUserById(Integer userId) {
		String sql = "select userId,firstName,lastName,email,password,avator,createDate FROM User where userId = ?";
		try {
			return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), userId));
		} catch (Exception e) {
			return Optional.empty();
		}
		
	}

	@Override
	public List<User> findAllUsers() {
		String sql = "select userId,firstName,lastName,email,password,avator,createDate FROM User";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper(User.class));
	}

	@Override
	public Optional<User> findUserByEmail(String email) {
		String sql = "select userId,firstName,lastName,email,password,avator,createDate FROM User where email = ?";
		try {
			return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), email));
		} catch (Exception e) {
			return Optional.empty();
		}
	}

}
