package com.ootd.ootdApp.product.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.product.model.vo.Review;

public interface ProductService {

	// =========Product List (selectList) 조회=========

	/**
	 * productList 조회를 위한 메소드
	 * 
	 * @param numPerPage
	 * @param cPage
	 * @param pType = 1? brand : secondHand
	 * @param product 
	 * 
	 * @return List<Product>
	 */
	List<Map<String, String>> productSelectList(int cPage, int numPerPage, int pType, Product product);

	/**
	 * 전체 상품 갯수 조회를 위한 메소드
	 * @param pType = 1? brand : secondHand
	 */
	int productSelectTotalContents(int pType);
	
	/**
	 * 전체 brand_name 조회를 위한 메소드
	 */
	List<String> brandNameSelectList();

	// =========Product Input (insert)=========

	/**
	 * 상품 등록을 위한 메소드
	 * 
	 * @param product
	 * @return int
	 */
	int productInsert(Product product, int pType, List<Attachment> attachList);

	// =========Product Detail (selectOne)=========

	/**
	 * 상품 번호로 상품 한 개 조회를 위한 메소드
	 * 
	 * @param product_no
	 * @return Product
	 */
	Product productSelectOne(int pType, int product_no);

	// =========Product Update (Update)=========

	/**
	 * 상품 수정하는 메소드
	 * 

	 * @param Product
	 * @param pType
	 * @param List<Attachment>
	 * @return int

	 */

	int productUpdate(Product originalProduct, List<Attachment> attachList, int pType);


	// =========Product Delete( Delete )========

	/**
	 * 상품번호로 상품 삭제하는 메소드
	 * 
	 * @param product_no
	 * @return int
	 */
	int productDelete(int product_no);
	
	List<Review> selectProductReview(int product_no);

	List<Map<String, String>> selectReviewList(int cPage, int numPerPage, int product_no);

	// 다인
	List<Attachment> selectProductImages(); 
	
	int selectReviewTotalContents(int product_no);

	
	

}
