package com.example.dao;

import java.util.List;
import java.util.Optional;

import com.example.entity.User;

public interface UserDAO {
	// 使用者 User:
	//1. 查詢所有使用者(多筆)
	List<User> findAllUsers();

	//2. 新增使用者
	int addUser(User user);

	//3. 修改密碼
	Boolean updateUserPassword(Integer userId, String newPassword);

	//4. 根據使用者名稱查找使用者(登入用-單筆)
	Optional<User> findUserByUsername(String username);

	//5. 根據使用者Id查找使用者(單筆)
	Optional<User> findUserByUserId(Integer userId);
		
	//6. 根據使用者email查找使用者(單筆)
	Optional<User> findUserByEmail(String email);
	
}


