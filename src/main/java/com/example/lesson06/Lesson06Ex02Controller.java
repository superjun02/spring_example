package com.example.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lesson04.bo.NewUserBO;

@RequestMapping("/lesson06/ex02")
@Controller
public class Lesson06Ex02Controller {
	
	@Autowired
	private NewUserBO newUserBO;
	
	@RequestMapping("/add_name_view")
	public String addNameView() {
		return "lesson06/addName";
	}
	
	@ResponseBody   // 데이터를 내려줄 때는 반드시 @ResponseBody !!!!!
	@RequestMapping("/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("name") String name) {
		
		// SELECT DB - name
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", newUserBO.existNewUserByName(name));
		
		return result;
	}
}
