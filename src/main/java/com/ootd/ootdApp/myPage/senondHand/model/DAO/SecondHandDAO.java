package com.ootd.ootdApp.myPage.senondHand.model.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.myPage.senondHand.model.vo.Review_ProductInfo;
import com.ootd.ootdApp.myPage.senondHand.model.vo.myPageOrderList;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Review;

public interface SecondHandDAO {
	
	int updatePassword(Member member);

	int updateEmail(Member member);

	int updatePhone(Member member);

	int updateBank(Member member);

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
