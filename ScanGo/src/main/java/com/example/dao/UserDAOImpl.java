package com.example.dao;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.example.entity.User;
import com.example.util.KeyUtil;

import aweit.mail.GMail;


@Component("userDaoImpl")
public class UserDAOImpl implements UserDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	//	1. 查詢所有使用者(多筆)
	@Override
	public List<User> findAllUsers() {
		String sql = "select userId, username, password, phone, email, birthday, authType, authId from user";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
	}
	
	//	2. 新增使用者
	@Override
	public int addUser(User user) {
		String sql = "insert into user(username, password, phone, email, birthday, authType, authId) VALUES (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getPhone(), user.getEmail(), user.getBirthday(), user.getAuthType(), user.getAuthId());
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
		String sql = "select userId, userName, password, email, phone, birthday, level, authType, authId, createDate FROM user where username = ?";
		try {
			return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username));
		} catch (Exception e) {
			return Optional.empty();
		}
	}
	
	//5. 根據使用者信箱查找使用者(更改密碼用-單筆)
	public Optional<User> getUserByEmail(String email){
		String sql = "select * from user where email = ?";
		try {
			return Optional.of(jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), email));
		} catch (Exception e) {
			return Optional.empty();
		}
	}
	
	//	4. 根據使用者名稱查找使用者(登入用-單筆)	
//	@Override
//	public Optional<User> findUserByUsername(String username) {
//		String sql = "select userId, username, password from user where username = ?";
//		try {
//			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), username);
//			// 查找使用者可以使用的服務(授權)
//			String sql2 = "select s.serviceId, s.serviceLocation, s.serviceName, s.serviceUrl "
//						+ "from level_ref_service r "
//						+ "left join service s on s.serviceId = r.serviceId "
//						+ "where r.levelId = ? order by r.sort";
//			List<Service> services = jdbcTemplate.query(sql2, new BeanPropertyRowMapper<>(Service.class), user.getLevel());
//			user.setServices(services);
//			return Optional.ofNullable(user);
//		} catch (EmptyResultDataAccessException e) {
//			return Optional.empty();
//		}
//	}
	
	//	5. 根據使用者ID查找使用者(單筆)	
//	@Override
//	public Optional<User> findUserByUserId(Integer userId) {
//		String sql = "select userId, username, password from user where userId = ?";
//		try {
//			User user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), userId);
//			// 查找使用者可以使用的服務(授權)
//			String sql2 = "select s.serviceId, s.serviceLocation, s.serviceName, s.serviceUrl "
//						+ "from level_ref_service r "
//						+ "left join service s on s.serviceId = r.serviceId "
//						+ "where r.levelId = ? order by r.sort";
//			List<Service> services = jdbcTemplate.query(sql2, new BeanPropertyRowMapper<>(Service.class), user.getLevel());
//			user.setServices(services);
//			return Optional.ofNullable(user);
//		} catch (EmptyResultDataAccessException e) {
//			return Optional.empty();
//		}
//	}
	
	/**
     * 生成 10 分鐘內有效的一次性密碼（TOTP）。
     *
     * @return TOTP 密碼
     * @throws InvalidKeyException 密鑰無效時的例外
     * @throws NoSuchAlgorithmException  指定的加密算法無效的例外
     */
	@Override
	public String getTotp() throws InvalidKeyException, NoSuchAlgorithmException {
		int secretLength = 16;
	    StringBuilder secretBuilder = new StringBuilder();
	    for (int i = 0; i < secretLength; i++) {
	    	secretBuilder.append(generateLetter());
	    }
		String secret = Base64.getEncoder().encodeToString(secretBuilder.toString().getBytes()); // 當作金鑰
		System.out.println(secret);
		long timeInterval = System.currentTimeMillis() / 1000L / 60L / 10L; // 10分鐘
		
		// 得到 TOTP 密碼 (使用 HMACSHA256 作為加密算法)
		String totp = KeyUtil.generateTOTP(secret, timeInterval, "HMACSHA256");
		return totp;
	}
	
	/**
	 * 發送有 TOPT 驗證碼的重設密碼信件。
	 * 
	 * @param email 使用者電子信箱
	 */
	@Override
	public void sentEamil(String email, String totp) {
		GMail mail = new GMail("yfchen1217@gmail.com", "hyhm yiwj czpv esbu");
		mail.from("yfchen1217@gmail.com")
			.to(email)
			.personal("ScanGo 自助結帳系統").subject("ScanGo 自助結帳系統 一次性驗證碼通知")
				.context("Hey ScanGo的使用者:<br>"
						 + "您的驗證碼為： " + totp + "<br>"
						 + "此驗證碼有效時間為10分鐘，請儘速回到頁面重設密碼，謝謝。")
				.send();
	}
	
	/**
	 * 隨機生成字母。
	 * 
	 * @return 一個隨機字母
	 */
	public String generateLetter() {
		Random random = new Random();
		String captcha;
		do {
			captcha = String.format("%c", (char) (random.nextInt(26 * 2) + (random.nextBoolean() ? 'A' : 'a')));
		} while (!Character.isLetter(captcha.charAt(0)));
		return captcha;
	}

	
}
