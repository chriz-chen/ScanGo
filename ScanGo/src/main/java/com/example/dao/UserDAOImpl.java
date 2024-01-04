package com.example.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.*;


@Component("userDaoImpl")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	//	1. 查詢所有使用者(多筆)
	@Override
	public List<User> findAllUsers() {
		String sql = "select userId, username, password, phone, email, birthday, level, authType, authId from user";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
	}
	
	//	2. 新增使用者
	@Override
	public int addUser(User user) {
		String sql = "insert into User(username, password, phone, email, birthday, level, authType, authId) VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(), user.getUserId(), user.getPassword(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getLevel(), user.getAuthType(), user.getAuthId());
	}

	//	3. 修改密碼
	@Override
	public Boolean updateUserPassword(Integer userId, String newPassword) {
		String sql = "update user set password = ? where userId = ?";
		int rowcount = jdbcTemplate.update(sql, newPassword, userId);
		return rowcount > 0;
	}
	
	//	4. 根據使用者名稱查找使用者(登入用-單筆)	
	@Override
	public Optional<User> findUserByUsername(String username) {
		String sql = "select userId, username, password, level, authType, authId from user where username = ?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
			// 查找使用者可以使用的服務(授權)
			String sql2 = "select s.serviceId, s.serviceLocation, s.serviceName, s.serviceUrl "
						+ "from level_ref_service r "
						+ "left join service s on s.serviceId = r.serviceId "
						+ "where r.levelId = ? order by r.sort";
			List<Service> services = jdbcTemplate.query(sql2, new BeanPropertyRowMapper<>(Service.class), user.getLevel());
			user.setServices(services);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	//	5. 根據使用者ID查找使用者(單筆)	
	@Override
	public Optional<User> findUserByUserId(Integer userId) {
		String sql = "select userId, username, password, level, authType, authId from user where userId = ?";
		try {
			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), userId);
			// 查找使用者可以使用的服務(授權)
			String sql2 = "select s.serviceId, s.serviceLocation, s.serviceName, s.serviceUrl "
						+ "from level_ref_service r "
						+ "left join service s on s.serviceId = r.serviceId "
						+ "where r.levelId = ? order by r.sort";
			List<Service> services = jdbcTemplate.query(sql2, new BeanPropertyRowMapper<>(Service.class), user.getLevel());
			user.setServices(services);
			return Optional.ofNullable(user);
		} catch (EmptyResultDataAccessException e) {
			return Optional.empty();
		}
	}
	
	
	//6. 根據使用者email查找使用者(單筆)  ##要留?
	@Override
	public Optional<User> findUserByEmail(String email) {
		String sql = "select userId, account, username, birthday, email, password, createDate FROM User where email = ?";
		try {
			return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), email));
		} catch (Exception e) {
			return Optional.empty();
		}
	}

}
