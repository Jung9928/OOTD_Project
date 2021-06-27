package com.ootd.ootdApp.myPage.brand.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.myPage.brand.model.dao.BrandDAO;
import com.ootd.ootdApp.myPage.brand.model.vo.MypageOrderList;
import com.ootd.ootdApp.myPage.brand.model.vo.O_Order;
import com.ootd.ootdApp.myPage.brand.model.vo.O_Order_List;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Product;

@Service
public class BrandServiceImpl implements BrandService {

	@Autowired
	BrandDAO brandDAO;

	@Override
	public List<Map<String, String>> selectBrandOrderList(int cPage, int numPerPage, String brand_name) {
		System.out.println("order :: 서비스 왔나요");
		
		return brandDAO.selectBrandOrderList(cPage, numPerPage, brand_name);
	}

	@Override
	public List<Map<String, String>> selectBrandProductList(int cPage, int numPerPage, int member_no) {
		System.out.println("product :: 서비스 왔나요");
		return brandDAO.selectBrandProductList(cPage, numPerPage, member_no);
	}

	@Override
	public int deleteBrandProductList(int productNo) {
		System.out.println("product_delete :: 서비스 왔나요");
		return brandDAO.deleteBrandProductList(productNo);
	}

	@Override
	public List<MypageOrderList> selectBrandOrderDetail(O_Order tempOrder) {
		System.out.println("order_detail :: 서비스 왔나요");
		return brandDAO.selectBrandOrderDetail(tempOrder);
	}

	@Override
	public int updateBrandInfo(Member tempMember) {
		System.out.println("brandMypage_UpdatePw :: 서비스 왔나요");
		return brandDAO.updateBrandInfo(tempMember);
	}

	@Override
	public int emUpdateBrandInfo(Member tempMember) {
		System.out.println("brandMypage_UpdateEmail :: 서비스 왔나요");
		return brandDAO.emUpdateBrandInfo(tempMember);
	}

	@Override
	public int phUpdateBrandInfo(Member tempMember) {
		System.out.println("brandMypage_UpdatePhone :: 서비스 왔나요");
		return brandDAO.phUpdateBrandInfo(tempMember);
	}

	@Override
	public int acUpdateBrandInfo(Member tempMember) {
		System.out.println("brandMypage_UpdateAccount :: 서비스 왔나요");
		return brandDAO.acUpdateBrandInfo(tempMember);
	}

	@Override
	public List<Product> selectBrandProductRankList(int member_no) {
		System.out.println("rank :: 서비스 왔나요");
		return brandDAO.selectBrandProductRankList(member_no);
	}

	@Override
	public int updateBrandStatus(O_Order_List tempOrder) {
		System.out.println("send :: 서비스 왔나요");
		return brandDAO.updateBrandStatus(tempOrder);
	}

	@Override
	public int brandSelectTotalContents() {
		
		return brandDAO.brandSelectTotalContents();
	}

	@Override
	public int brandProductSelectTotalContents() {
		
		return brandDAO.brandProductSelectTotalContents();

	}
	
	@Override
	public List<Attachment> selectAttachmentList(int productNo) {

		return brandDAO.selectAttachmentList(productNo);

	}
	
}


