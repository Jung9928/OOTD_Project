package com.ootd.ootdApp.myPage.brand.model.dao;

import java.util.List;
import java.util.Map;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.myPage.brand.model.vo.MypageOrderList;
import com.ootd.ootdApp.myPage.brand.model.vo.O_Order;
import com.ootd.ootdApp.myPage.brand.model.vo.O_Order_List;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Product;


public interface BrandDAO {

	List<Map<String, String>> selectBrandOrderList(int cPage, int numPerPage, String brand_name);

	List<Map<String, String>> selectBrandProductList(int cPage, int numPerPage, int member_no);

	int deleteBrandProductList(int productNo);

	List<MypageOrderList> selectBrandOrderDetail(O_Order tempOrder);

	int updateBrandInfo(Member tempMember);

	int emUpdateBrandInfo(Member tempMember);

	int phUpdateBrandInfo(Member tempMember);

	int acUpdateBrandInfo(Member tempMember);

	List<Product> selectBrandProductRankList(int member_no);

	int updateBrandStatus(O_Order_List tempOrder);

	int brandSelectTotalContents();

	int brandProductSelectTotalContents();

	List<Attachment> selectAttachmentList(int productNo);

}
