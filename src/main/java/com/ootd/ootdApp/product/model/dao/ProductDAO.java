package com.ootd.ootdApp.product.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.product.model.vo.Review;

public interface ProductDAO {

	// =========Product List (select) 조회=========

	/**
	 * brandList 조회를 위한 메소드
	 * @param numPerPage 
	 * @param cPage 
	 * @param product 
	 * 
	 * @return List<Product>
	 */
	List<Map<String, String>> brandSelectList(int cPage, int numPerPage, Product product);

	/**
	 * secondHandList 조회를 위한 메소드
	 * @param numPerPage 
	 * @param cPage 
	 * 
	 * @return List<Product>
	 */
	List<Map<String, String>> secondHandSelectList(int cPage, int numPerPage , Product product);
	
	
	/**
	 * brnadList 전체갯수 조회를 위한 메소드
	 */
	int brandSelectTotalContents();

	/**
	 * secondHandList 전체갯수 조회를 위한 메소드
	 */
	int secondHandSelectTotalContents();
	
	/**
	 * brand_name 전체조회를 위한 메소드
	 */
	List<String> brandNameSelectList();
	
	
	
	// =========Product Input (insert)=========

	/**
	 * brand 상품 등록을 위한 메소드
	 * 
	 * @param product
	 * @return int
	 */
	int brandInsert(Product product, List<Attachment> a);

	/**
	 * secondHand 상품 등록을 위한 메소드
	 * 
	 * @param product
	 * @return int
	 */
	int secondHandInsert(Product product, List<Attachment> a);
	
	/**
	 * 상품 이미지파일 등록을 위한 메소드
	 * 
	 * @param Attachment
	 * @return int
	 */
	int attachmentInsert(Attachment a);

	// =========Product Detail (selectOne)=========

	/**
	 * 상품 번호로 brand상품 한 개 조회를 위한 메소드
	 * 
	 * @param product_no
	 * @return Product
	 */
	Product brandSelectOne(int product_no);

	/**
	 * 상품 번호로 secondHand상품 한 개 조회를 위한 메소드
	 * 
	 * @param product_no
	 * @return Product
	 */
	Product secondHandSelectOne(int product_no);
	
	
	/**
	 * 상품 번호로 상품 한 개 조회를 위한 메소드
	 * 
	 * @param pType, product_no
	 * @return Product, List<Attachement>
	 */
	Product productSelectOne(int pType, int product_no);
	
	
	

	// =========Product Update (Update)=========

	/**
	 * brand상품 수정하는 메소드
	 * 
	 * @param Product
	 * @return int
	 */
	int brandUpdate(Product originalProduct, List<Attachment> attachList);

	/**
	 * secondHand상품 수정하는 메소드
	 * 
	 * @param Product
	 * @return int
	 */

	int secondHandUpdate(Product originalProduct, List<Attachment> attachList);

	// =========Product Delete( Delete )========

	/**
	 * 상품번호로 brand상품 삭제하는 메소드
	 * 
	 * @param product_no
	 * @return int
	 */
	int brandDelete(int product_no);

	/**
	 * 상품번호로 secondHand상품 삭제하는 메소드
	 * 
	 * @param product_no
	 * @return int
	 */
	int secondHandDelete(int product_no);
	
	int secondHandAttachmentDelete(int product_no);
	
	int updateAttachment(Attachment a);
	
	int deleteAttachment(int product_no);
	
	List<Review> selectProductReview(int product_no);

	List<Map<String, String>> selectReviewList(int cPage, int numPerPage, int product_no);

	int selectReviewTotalContents(int product_no);

	// 다인
	List<Attachment> selectProductImages();

	

}
