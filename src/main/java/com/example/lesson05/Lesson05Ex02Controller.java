package com.example.lesson05;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/lesson05")
@Controller
public class Lesson05Ex02Controller {
	@RequestMapping("/ex02")
	public String ex02(Model model) {
		// List<String>
		List<String> fruits = new ArrayList<>();
		fruits.add("apple");
		fruits.add("bannana");
		fruits.add("grape");
		fruits.add("watermelon");
		fruits.add("peach");
		
		model.addAttribute("fruits", fruits);
		
		List<Map<String, Object>> users = new ArrayList<>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "이상준");
		map.put("age", "22");
		map.put("hobby", "코딩");
		users.add(map);
		
		map = new HashMap<String, Object>();
		map.put("name", "김진아");
		map.put("age", "54");
		map.put("hobby", "고양이 봐주기");
		users.add(map);
		
		model.addAttribute("users", users);
		
		return "lesson05/ex02";
	}
}
