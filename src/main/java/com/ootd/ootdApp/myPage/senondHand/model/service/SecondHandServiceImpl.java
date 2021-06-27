package com.ootd.ootdApp.myPage.senondHand.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.myPage.senondHand.model.DAO.SecondHandDAO;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.myPage.senondHand.model.vo.Review_ProductInfo;
import com.ootd.ootdApp.myPage.senondHand.model.vo.myPageOrderList;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Review;

@Service
public class SecondHandServiceImpl implements SecondHandService {
	
	@Autowired
	SecondHandDAO secondHandDAO;

	@Override
	public int updatePassword(Member member) {
		return secondHandDAO.updatePassword(member);
	}

	@Override
	public int updateEamil(Member member) {
		return secondHandDAO.updateEmail(member);
	}

	@Override
	public int updatePhone(Member member) {
		return secondHandDAO.updatePhone(member);
	}

	@Override
	public int updateBank(Member member) {
		return secondHandDAO.updateBank(member);
	}

	@Override
	public int updateAddress(Member member) {
		return secondHandDAO.updateAddress(member);
	}

	@Override
	public List<Map<String, String>> selectOrderList(int cPage, int numPerPage, String member_name) {
		return secondHandDAO.selectOrderList(cPage, numPerPage, member_name);
	}

	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage, int member_no) {
		return secondHandDAO.selectProductList(cPage, numPerPage, member_no);
	}

	@Override
	public int deleteProduct(int productNo) {
		return secondHandDAO.deleteProduct(productNo);
	}

	@Override
	public List<Map<String, String>> selectSaleProductList(int cPage, int numPerPage, String member_name) {
		return secondHandDAO.selectSaleProductList(cPage, numPerPage, member_name);
	}

	@Override
	public int updateOrderSaleStatus(int orderNo) {
		System.out.println("Service SaleStatus orderNo -> " + orderNo);
		return secondHandDAO.updateOrderSaleStatus(orderNo);
	}

	@Override
	public int updatePurchaseStatus(int orderNo) {
		return secondHandDAO.updatePurchaseStatus(orderNo);
	}

	@Override
	public Review_ProductInfo selectReviewInfo(HashMap<String, Object> map) {
		
		return secondHandDAO.selectReviewInfo(map);
	}

	@Override
	public int insertReview(Review review) {
		
		return secondHandDAO.insertReview(review);
	}

	@Override
	public List<Attachment> selectAttachmentList(int productNo) {
		
		return secondHandDAO.selectAttachmentList(productNo);
	}

	@Override
	public int purchaseSelectTotalContents() {
		return secondHandDAO.purchaseSelectTotalContents();
	}

	@Override
	public int selectProductTotalContents() {
		return secondHandDAO.selectProductTotalContents();
	}

	@Override
	public int selectSaleProductTotalContents() {
		return secondHandDAO.selectSaleProductTotalContents();
	}

	@Override
	public List<Map<String, String>> selectSearchResult(int cPage, int numPerPage, String totalSearch) {
		return secondHandDAO.selectSearchResult(cPage, numPerPage, totalSearch);
	}

	@Override
	public int selectSearchTotalContents(String totalSearch) {
		return secondHandDAO.selectSearchTotalContents(totalSearch);
	}
	

}
