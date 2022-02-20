package com.StaffManager.utils;

import java.lang.reflect.InvocationTargetException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.BeanUtils;

public class FormUtils {
	
	
	@SuppressWarnings({ "unchecked", "deprecation" })
	public static <T> T toModel(Class<T> classModel, HttpServletRequest request) {
		T object =null;
		try {			
			object = classModel.newInstance();			
			BeanUtils.populate(object, request.getParameterMap());			
		} catch (IllegalAccessException | InstantiationException | InvocationTargetException e) {
			e.printStackTrace();
		} 
		return object;
	}
}
