package com.example.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/ex01/")
@RestController          // @Controller + @ResponseBody
public class Ex01RestController {
	
	@RequestMapping("/3")
	public String printString() {
		return "@RestController를 사용해서 String을 리턴해본다.";
	}
	
	@RequestMapping("/4")
	public Map<String, String> prinMap() {
		Map<String, String> result = new HashMap<String, String>();
		result.put("111", "222");
		result.put("333", "444");
		result.put("555", "666");
		
		return result;
	}
	
	@RequestMapping("/5")
	public Data printData() {
		Data data = new Data();
		
		data.setId(1);
		data.setName("이상준");
		
		return data;   // 일반 bean 객체도 json으로 내려간다.
	}
	
	@RequestMapping("/6")
	public ResponseEntity<Data> entity() {
		Data data = new Data(); // 일반 자바 bean
		data.setId(100);
		data.setName("이상준");
		
		//return new ResponseEntity<>(data, HttpStatus.OK);
		return new ResponseEntity<>(data, HttpStatus.INTERNAL_SERVER_ERROR);  // 500 error
	}
}
