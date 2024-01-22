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
		
		if (!registerUser.getPassword().equals(registerUser.getConfirmPassword())) {
	        return RegisterStatus.TWO_PASSWORD_ERROR;
	    }
		
// 		處理大頭照
//		MultipartFile multipartFile = registerUser.getAvator();
//		String avator = registerUser.getEmail()+"-"+multipartFile.getOriginalFilename();
//		Path picPath = upPath.resolve(avator);
//		Files.copy(multipartFile.getInputStream(), picPath, StandardCopyOption.REPLACE_EXISTING);
		
		// 新增用戶資訊至資料庫
		User user = new User();
		user.setUsername(registerUser.getUsername());
		user.setPassword(BCrypt.hashpw(registerUser.getPassword(), BCrypt.gensalt()));
		user.setEmail(registerUser.getEmail());
		user.setPhone(registerUser.getPhone());
		user.setBirthday(registerUser.getBirthday());
		//user.setAvator(avator);

		int rowCount = userDAO.addUser(user);
		
		if(rowCount == 0) {
			return RegisterStatus.USER_ADD_FAILURE;
		}
		return RegisterStatus.USER_ADD_SUCCESS;
	}

}
