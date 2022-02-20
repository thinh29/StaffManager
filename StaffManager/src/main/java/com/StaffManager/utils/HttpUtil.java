package com.StaffManager.utils;

import java.io.BufferedReader;
import java.io.IOException;

import com.fasterxml.jackson.databind.ObjectMapper;

public class HttpUtil {
	
	private String value;
	
	public HttpUtil(String value) {
		this.value=value;
	}
	
	public static HttpUtil of (BufferedReader reader) {
		StringBuffer sb = new StringBuffer();
		try {
			String line;
			while((line = reader.readLine())!=null) {
				sb.append(line);
			}
		}catch(IOException e) {
			e.printStackTrace();
		}
		return new HttpUtil(sb.toString());
	}
	
	public <T> T toModel(Class<T> tClass) {
		try {
			return new ObjectMapper().readValue(value, tClass);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
