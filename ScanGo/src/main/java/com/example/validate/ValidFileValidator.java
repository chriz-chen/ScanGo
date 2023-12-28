package com.example.validate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class ValidFileValidator implements ConstraintValidator<ValidFile, MultipartFile>{

	@Override
	public boolean isValid(MultipartFile file, ConstraintValidatorContext context) {
		if(file == null)
			return false;
		
		return (file.getSize() == 0) ? false : true;
	}

}
