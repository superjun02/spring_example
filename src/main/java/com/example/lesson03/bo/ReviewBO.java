package com.example.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.lesson03.dao.ReviewDAO;
import com.example.lesson03.model.Review;

@Service
public class ReviewBO {

	@Autowired
	private ReviewDAO reviewDao;
	
	public Review getReviewById(int id) {
		return reviewDao.selectReviewById(id);
	}
	
	public int addReview(Review review) {
		return reviewDao.insertReview(review);
	}
	
	public int addReviewAsField(int storeId, String menu, String userName, double point, String review) {
		return reviewDao.insertReviewAsField(storeId, menu, userName, point, review);
	}
	
	public int updateReview(int id, String review) {
		return reviewDao.updateReview(id, review);
	}
	
	public int deleteReviewById(int id) {
		return reviewDao.deleteReviewById(id);
	}
}
