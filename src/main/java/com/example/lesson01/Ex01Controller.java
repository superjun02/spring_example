package com.example.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/ex01")
@Controller
public class Ex01Controller {
	
	// String 출력하기
	// 요청 URL : http://localhost/lesson01/ex01/1
	@ResponseBody                  // 리턴되는 값을 HTML Response Body로 보낸다.
	@RequestMapping("/1")     // 주소 매핑
	public String prinString() {
		String text = "예제 1번<br>문자열을 response body로 보내는 예제";
		return text;
	}
	
	// 요청 URL : http://localhost/lesson01/ex01/2
	@RequestMapping("/2")
	public @ResponseBody Map<String, Object> printMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("apple", 4);
		map.put("바나나", 123123);
		map.put("파인애플", 9382);
		map.put("포도", 8822);
		
		// map을 리턴하면 json으로 나타난다. web starter에 jackson 이라는 라이브러리가 포함되어 있기 떄문
		// @ResponseBody 어노테이션이 있기 때문에 jackson이 동작함
		return map;
	}
	
}
