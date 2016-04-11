package by.topolev.twitter.controller;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import by.topolev.twitter.domain.User;

@Component
public class UserValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		User user =(User) target;
		
		String username = user.getUsername();
		if ((username.length()<3)||(username.length()>10)) {
			errors.rejectValue("username", "Username must be consist 3-10 character");
		}
		
		String password = user.getPassword();
		if ((username.length()<3)||(username.length()>10)) {
			errors.rejectValue("password","password.tooLongOrTooShort", "Password must be consist 3-10 character");
		}
		
		String confirmPassword = user.getConfirmPassword();
		if (!confirmPassword.equals(password)){
			errors.rejectValue("confirmPassword", "confirmPassword.passwordDontMatch", "Passwords don't match. ");
		}
		
	}

}
