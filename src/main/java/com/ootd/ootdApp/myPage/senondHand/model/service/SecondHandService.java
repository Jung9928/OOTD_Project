package com.ootd.ootdApp.myPage.senondHand.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.myPage.senondHand.model.vo.Review_ProductInfo;
import com.ootd.ootdApp.myPage.senondHand.model.vo.myPageOrderList;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Review;

public interface SecondHandService {

	int updatePassword(Member member); // 회원 비밀번호 변경

	int updateEamil(Member member); // 회원 이메일 변경

	int updatePhone(Member member); // 회원 전화번호 변경

	int updateBank(Member member); // 회원 계좌번호 변경

	int updateAddress(Member member);

	List<Map<String, String>> selectOrderList(int cPage, int numPerPage, String member_name);

	List<Map<String, String>> selectProductList(int cPage, int numPerPage, int member_no);

	int deleteProduct(int productNo);

	List<Map<String, String>> selectSaleProductList(int cPage, int numPerPage, String member_name);

	int updateOrderSaleStatus(int orderNo);

	int updatePurchaseStatus(int orderNo);

	Review_ProductInfo selectReviewInfo(HashMap<String, Object> map);

	int insertReview(Review review);

	List<Attachment> selectAttachmentList(int productNo);

	int purchaseSelectTotalContents();

	int selectProductTotalContents();

	int selectSaleProductTotalContents();

	List<Map<String, String>> selectSearchResult(int cPage, int numPerPage, String totalSearch);

	int selectSearchTotalContents(String totalSearch);


}
