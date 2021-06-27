package com.ootd.ootdApp.product.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product implements Serializable {

	private int product_no;				// 상품번호 시퀀스
	private String product_name;		// 상품명
	private String product_detail;		// 상품 설명
	private String product_sizeinfo;	// 상품 사이즈
	private String product_size;		
	private int product_price;			
	private int product_stock_s;
	private int product_stock_m;
	private int product_stock_l;
	private int product_type;
	private int member_no;
	private char product_status;
	private int product_category;
	
	
	private String originalFileName;
	private String renamedFileName;
	
	// Product Detail 에서 첨부파일 List<Attachment> 를  Product에 한번에 받아오기 위한 변수
	private List<Attachment> attachment;
	
	
	// 상품 리스트 및 정렬에 사용하기 위한 변수들

	private int fileCount;			// 각 상품당 첨부파일 갯수
	private String brand_name;		// 상품의 브랜드 명 담을 추가변수
	private String att_name;		// 상품의 각 대표(1)번 사진 담아오는 변수
	private String sortVal;			// 상품의 최신순, 가격순으로 정렬하기 위한 사용자 선택값을 담아오는 변수 
	
	public Product(int product_category, String brand_name, String sortVal) {
		this.product_category = product_category;
		this.brand_name = brand_name;
		this.sortVal = sortVal;
	}
	

}
