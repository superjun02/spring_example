package com.example.lesson06;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.lesson04.bo.NewUserBO;
import com.example.lesson04.model.NewUser;

@RequestMapping("/lesson06/ex01")
@Controller
public class Lesson06Ex01Controller {
	
	@Autowired
	private NewUserBO newUserBO;
	
	// 유저 추가 화면
	@RequestMapping("/add_user_view")
	public String addUserView() {
		return "lesson06/addUser";
	}
	
	@ResponseBody
	@PostMapping("/add_user")
	public String addUser(
			@RequestParam("name") String name,
			@RequestParam("yyyymmdd") String yyyymmdd,
			@RequestParam(value="email", required = false) String email,
			@RequestParam(value="introduce", required = false) String introduce ) {
		NewUser newUser = new NewUser();
		
		newUser.setName(name);
		newUser.setYyyymmdd(yyyymmdd);
		newUser.setEmail(email);
		newUser.setIntroduce(introduce);
		
		//DB에 insert
		newUserBO.addNewUser(newUser);
		//return "lesson06/afterAddUser";
		
		return "success";
	}
	
	@RequestMapping("/after_add_user")
	public String afterAddUser() {
		
		return "lesson06/afterAddUser";
	}
}
