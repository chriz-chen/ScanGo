package com.example.service;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.bean.RegisterUser;
import com.example.dao.UserDAO;
import com.example.entity.User;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public RegisterStatus register(RegisterUser registerUser) {
		
		// 檢查兩次輸入的密碼是否一致
		if (!registerUser.getPassword().equals(registerUser.getConfirmPassword())) {
	        return RegisterStatus.TWO_PASSWORD_ERROR;
	    }
		
		// 新增用戶資訊至資料庫
		User user = new User();
		user.setUsername(registerUser.getUsername());
		// 使用BCrypt對密碼進行加密處理
		user.setPassword(BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt()));
		user.setEmail(registerUser.getEmail());
		user.setPhone(registerUser.getPhone());
		user.setBirthday(registerUser.getBirthday());
		user.setAuthType("ScanGo");
		user.setLevelId(1);
		
		// 呼叫DAO層的方法將用戶資訊寫入資料庫
		int rowCount = userDAO.addUser(user);
		
		// 如果新增用戶失敗，返回用戶新增失敗的狀態
		if(rowCount == 0) {
			return RegisterStatus.USER_ADD_FAILURE;
		}
		// 返回用戶新增成功的狀態
		return RegisterStatus.USER_ADD_SUCCESS;
	}

}
