package com.ootd.ootdApp.myPage.senondHand.model.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.myPage.senondHand.model.vo.Review_ProductInfo;
import com.ootd.ootdApp.myPage.senondHand.model.vo.myPageOrderList;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Review;

@Repository
public class SecondHandDAOImpl implements SecondHandDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	RowBounds rows;

	@Override
	public int updatePassword(Member member) {
		return sqlSession.update("member-mapper.updatePassword", member);
	}

	@Override
	public int updateEmail(Member member) {
		return sqlSession.update("member-mapper.updateEmail", member);
	}

	@Override
	public int updatePhone(Member member) {
		return sqlSession.update("member-mapper.updatePhone", member);
	}

	@Override
	public int updateBank(Member member) {
		return sqlSession.update("member-mapper.updateBank", member);
	}

	@Override
	public int updateAddress(Member member) {
		return sqlSession.update("member-mapper.updateAddress", member);
	}

	@Override
	public List<Map<String, String>> selectOrderList(int cPage, int numPerPage, String member_name) {
		
		rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("orderList-mapper.selectOrderList", member_name, rows);
	}

	@Override
	public List<Map<String, String>> selectProductList(int cPage, int numPerPage, int member_no) {
		
		rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("productList-mapper.selectProductList", member_no, rows);
	}

	@Override
	public int deleteProduct(int productNo) {
		
		int resultP = 0;	// 상품 삭제 결과
		int resultA = 0; 	// 첨부파일 삭제 결과
		
		resultP = sqlSession.delete("productList-mapper.deleteProduct", productNo); 
		
		if( resultP > 0) {
			resultA = sqlSession.delete("productList-mapper.deleteSecondProductAttachment", productNo);
		}
		
		return resultA;
	}

	@Override
	public List<Map<String, String>> selectSaleProductList(int cPage, int numPerPage, String member_name) {
		
		rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("orderList-mapper.selectSaleProductList", member_name, rows);
	}

	@Override
	public int updateOrderSaleStatus(int orderNo) {
		System.out.println("DAO Sale Status -> " + orderNo);
		
		int resultSale = sqlSession.update("orderList-mapper.updateOrderSaleStatus", orderNo);
		int resultOrder = sqlSession.update("orderList-mapper.updateOrderStatus", orderNo);
		
		System.out.println(resultSale + "/" + resultOrder);
		
		int result = 0;
		
		if(resultSale * resultOrder == 1) {
			result = 1;
		} else result = 0;
		
		return result;
	}

	@Override
	public int updatePurchaseStatus(int orderNo) {
		
		int result1 = sqlSession.update("orderList-mapper.updatePurchaseStatus", orderNo); 
		int result2 = sqlSession.update("orderList-mapper.updatefianlstatus", orderNo);
		
		System.out.println(result1 + "/" + result2);
		
		int result = 0;
		
		if(result1 * result2 == 1) {
			result = 1;
		} else result = 0;
		
		return result;
	}

	@Override
	public Review_ProductInfo selectReviewInfo(HashMap<String, Object> map) {
		
		return sqlSession.selectOne("orderList-mapper.selectReviewInfo", map);
	}

	@Override
	public int insertReview(Review review) {
		
		return sqlSession.insert("orderList-mapper.insertReview", review);
	}

	@Override
	public List<Attachment> selectAttachmentList(int productNo) {

		return sqlSession.selectList("productList-mapper.selectAttachList", productNo);
	}

	@Override
	public int purchaseSelectTotalContents() {
		return sqlSession.selectOne("orderList-mapper.purchaseSelectTotalContents");
	}

	@Override
	public int selectProductTotalContents() {
		return sqlSession.selectOne("productList-mapper.selectProductTotalContents");
	}

	@Override
	public int selectSaleProductTotalContents() {
		return sqlSession.selectOne("orderList-mapper.selectSaleProductTotalContents");
	}

	@Override
	public List<Map<String, String>> selectSearchResult(int cPage, int numPerPage, String totalSearch) {
		
		rows = new RowBounds((cPage - 1) * numPerPage, numPerPage);
		
		return sqlSession.selectList("product-mapper.selectSearchResult", totalSearch, rows);
	}

	@Override
	public int selectSearchTotalContents(String totalSearch) {
		return sqlSession.selectOne("product-mapper.selectSearchTotalContents", totalSearch);
	}


}
