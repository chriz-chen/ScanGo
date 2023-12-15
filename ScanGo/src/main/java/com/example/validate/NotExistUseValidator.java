package com.example.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.example.dao.UserDAO;

@Component
public class NotExistUseValidator implements ConstraintValidator<NotExistUser, String>{

	@Autowired
	@Qualifier("userDaoImpl")
	private UserDAO userDAO;
	
	@Override
	public boolean isValid(String value, ConstraintValidatorContext context) {
		return !userDAO.findUserByEmail(value).isPresent();
	}

}
