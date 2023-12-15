package com.example.validate;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = NotExistUseValidator.class)
@Target( { METHOD, FIELD })
@Retention(RUNTIME)
public @interface NotExistUser {
    String message() default "this account was registered";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
