package com.example.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson04.dao.NewUserDAO;
import com.example.lesson04.model.NewUser;

@Service
public class NewUserBO {
	@Autowired
	NewUserDAO newUserDao;
	
	public void addNewUser(NewUser newUser) {
		newUserDao.insertNewUser(newUser);
	}
	
	public NewUser getLastNewUser() {
		return newUserDao.selectLastNewUser();
	}
}
