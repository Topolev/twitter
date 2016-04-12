package by.topolev.twitter.constraints;

import java.lang.reflect.Method;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class FieldEqualsValidator implements ConstraintValidator<FieldEquals, Object> {
	
	private String field;
	private String equalsTo;
	private String message = FieldEquals.MESSAGE;
	
	@Override
	public void initialize(FieldEquals constraintAnnotation) {
		this.message = constraintAnnotation.message();
		this.field = constraintAnnotation.field();
		this.equalsTo = constraintAnnotation.equalsTo();
	}

	@Override
	public boolean isValid(Object value, ConstraintValidatorContext context) {
		final Object fieldObject = getProperty(value, field, null);
		final Object equalsToObject = getProperty(value, equalsTo, null);
		

		boolean matches = ((fieldObject != null) && (fieldObject.equals(equalsToObject)) && (!fieldObject.equals("")));
		System.out.println("field: '" + fieldObject + "'");
		System.out.println("VALIDATION " + matches);
		if (!matches){
			String msg = field + " is not equal to " + equalsTo;
			System.out.println(msg);
			context.disableDefaultConstraintViolation();
			context.buildConstraintViolationWithTemplate(msg).addNode(equalsTo).addConstraintViolation();
		}
		return matches;
	}
	
	private Object getProperty(Object value, String fieldName, Object defaultValue){
		Class<?> clazz = value.getClass();
		String methodName = "get" + Character.toUpperCase(fieldName.charAt(0)) + fieldName.substring(1);
		try {
			Method method = clazz.getDeclaredMethod(methodName, new Class[0]);
			return method.invoke(value);
		} catch (Exception e) {} 
		return defaultValue;
	}
}
