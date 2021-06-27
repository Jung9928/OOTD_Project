package com.ootd.ootdApp.myPage.senondHand.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ootd.ootdApp.common.Utils;
import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.myPage.senondHand.model.service.SecondHandService;
import com.ootd.ootdApp.myPage.brand.model.vo.O_Order;
import com.ootd.ootdApp.product.model.vo.Product;
import com.ootd.ootdApp.myPage.senondHand.model.vo.Review_ProductInfo;
import com.ootd.ootdApp.myPage.senondHand.model.vo.myPageOrderList;
import com.ootd.ootdApp.product.model.vo.Attachment;
import com.ootd.ootdApp.product.model.vo.Review;

@SessionAttributes({ "member" })
@Controller
public class SecondHandConrtoller {

	// Order_Detail 모달 (주문번호클릭시)
	// Info 회원정보
	// Product 상품목록 (중고상품 올린 페이지)
	// Purchased 주문상품(구매완료)
	// Sale 판매한 상품
	// Review Sale페이지에서 구매한 상품 리뷰 작성하기

	// O_ORDER , O_ORDER_LIST 는 무조건 결제가 된 상품들

	@Autowired
	SecondHandService secondHandService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;

	@RequestMapping("/myPage/myPage_Info.mp")
	public String myPage_Info() {
		return "myPage/myPage_Info";
	}

	// 비밀번호 변경
	@RequestMapping("/myPage/update_Password.do")
	public String update_Password(@RequestParam(value = "password") String password,
			@RequestParam(value = "new_password") String new_password,
			@RequestParam(value = "confirm_password") String confirm_password, Member member, Model model) {

		System.out.println("로그인 된 회원 / 비밀번호 : " + member.getMember_id() + " / " + member.getMember_pw());

		if (!new_password.equals(confirm_password)) {
			System.out.println("new password not equals");
			return "redirect:myPage_Info.mp";
		}
		if (!bcryptPasswordEncoder.matches(password, member.getMember_pw())) {
			System.out.println("not equals current password");
			return "redirect:myPage_Info.mp";
		}

		member.setMember_pw(bcryptPasswordEncoder.encode(new_password));

		int result = secondHandService.updatePassword(member);

		if (result > 0) {
			model.addAttribute("member", member);
			System.out.println("비밀번호 변경 완료 -> " + member.getMember_pw());
		}

		return "redirect:myPage_Info.mp";
	}

	// 이메일 변경
	@RequestMapping("/myPage/update_Email.do")
	public String update_Email(@RequestParam(value = "update_email") String update_email, Member member, Model model) {

		System.out.println("current email -> " + member.getEmail());

		if (update_email == null) {
			System.out.println("Email Null");
			return "redirect:myPage_Info.mp";
		}

		if (member.getEmail().equals(update_email)) {
			System.out.println("same email");
			return "redirect:myPage_Info.mp";
		}

		member.setEmail(update_email);

		int result = secondHandService.updateEamil(member);

		if (result > 0) {
			model.addAttribute("member", member);
			System.out.println("change email -> " + member.getEmail());
		}

		return "redirect:myPage_Info.mp";
	}

	// 전화번호 변경
	@RequestMapping("/myPage/update_Phone.do")
	public String update_Phone(@RequestParam(value = "update_phone") String update_phone, Member member, Model model) {

		System.out.println("변경할 핸드폰 번호 :: " + member.getPhone());

		if (update_phone == null) {
			System.out.println("Phone number Null");
			return "redirect:myPage_Info.mp";
		}

		if (member.getPhone().equals(update_phone)) {
			System.out.println("same Phone number");
			return "redirect:myPage_Info.mp";
		}

		member.setPhone(update_phone);

		int result = secondHandService.updatePhone(member);

		if (result > 0) {
			model.addAttribute(member);
			System.out.println("change Phone number -> " + member.getPhone());
		}

		return "redirect:myPage_Info.mp";
	}

	// 주소변경
	@RequestMapping("/myPage/updateAddress.do")
	public String updateAddress(@RequestParam(value = "update_address") String address,
			@RequestParam(value = "update_detail_address") String detailAddress, Member member, Model model) {

		System.out.println(address + " / " + detailAddress);

		String[] newAddress = { address + " " + detailAddress };

		member.setAddress(newAddress);

		int result = secondHandService.updateAddress(member);

		if (result > 0) {
			model.addAttribute(member);

			for (int i = 0; i < newAddress.length; i++) {

				System.out.println(newAddress[i]);

			}
		}

		return "redirect:myPage_Info.mp";
	}

	// 계좌번호 변경
	@RequestMapping("/myPage/updateBank.do")
	public String updateBank(@RequestParam(value = "account") String accountNumber,
			@RequestParam(value = "bank_name") String bank_code, Member member, Model model) {

		System.out.println(bank_code); // 변경할 은행 코드
		System.out.println(accountNumber); // 변경할 계좌번호

		member.setAccount_number(accountNumber);
		member.setBank_code(bank_code);

		int result = secondHandService.updateBank(member);

		if (result > 0) {
			model.addAttribute(member);
			System.out.println(
					"change Bank_code / Bank_accout -> " + member.getBank_code() + " / " + member.getAccount_number());
		}

		return "redirect:myPage_Info.mp";
	}

	// 주문 상품 가져오기
	@RequestMapping("/myPage/myPage_Purchased.mp")
	public String selectOrderList(Member member, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		// 한 페이지당 상품 갯수
		int numPerPage = 12;

		String member_name = member.getMember_name();
		System.out.println(member_name);

		// 현재 페이지의 상품 갯수
		List<Map<String, String>> list = secondHandService.selectOrderList(cPage, numPerPage, member_name);

		// 전체 상품 갯수
		int totalContents = secondHandService.purchaseSelectTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage_Purchased.mp");
		model.addAttribute("pageBar", pageBar);

		System.out.println("list : " + list);

		model.addAttribute("member", member);
		model.addAttribute("list", list);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents", totalContents);

//		List<myPageOrderList> list = secondHandService.selectOrderList(member_name);
//
//		model.addAttribute("list", list);
//
//		System.out.println("주문상품 리스트 -> " + list);

		return "myPage/myPage_Purchased";
	}

	// 판매상품 리스트 가져오기
	@RequestMapping("/myPage/myPage_Product.mp")
	public String myPageProduct(Member member, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		int member_no = member.getMember_no();

		System.out.println(member_no);

		// 한 페이지당 상품 갯수
		int numPerPage = 12;

		// 현재 페이지의 상품 갯수
		List<Map<String, String>> list = secondHandService.selectProductList(cPage, numPerPage, member_no);

		// 전체 상품 갯수
		int totalContents = secondHandService.selectProductTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage_Product.mp");
		model.addAttribute("pageBar", pageBar);

		System.out.println("list : " + list);

		model.addAttribute("member", member);
		model.addAttribute("list", list);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents", totalContents);

//		List<Product> list = secondHandService.selectProductList(member_no);
//
//		model.addAttribute("list", list);
//
//		System.out.println("판매상품 리스트 -> " + list);

		return "myPage/myPage_Product";
	}

	// 판매상품 삭제
	@RequestMapping("/myPage/myPage_Product_Delete.mp")

	public String myPageProductDelete(@RequestParam int productNo, HttpServletRequest req, Model model) {

		System.out.println(productNo);

		String savePath = req.getServletContext().getRealPath("/resources/images/productImgUpload");

		// 첨부파일 삭제 명단
		List<Attachment> delList = secondHandService.selectAttachmentList(productNo);

		System.out.println("브랜드 상품 삭제 controller 확인 :: " + delList);

		int result = secondHandService.deleteProduct(productNo);
		String loc = "/myPage/myPage_Product.mp";
		String msg = "";

		if (result > 0) {
			msg = "삭제 완료!";

			for (Attachment a : delList) {
				new File(savePath + "/" + a.getAtt_name()).delete();
			}

		} else {
			msg = "삭제 실패!";
		}

		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);

		return "common/msg";
	}

	// 판매내역 가져오기
	@RequestMapping("/myPage/myPage_Sale.mp")
	public String myPageSaleProductList(Member member, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {

		String member_name = member.getMember_name();

		System.out.println("판매자 이름 -> " + member_name);

		// 한 페이지당 상품 갯수
		int numPerPage = 12;

		// 현재 페이지의 상품 갯수
		List<Map<String, String>> list = secondHandService.selectSaleProductList(cPage, numPerPage, member_name);

		// 전체 상품 갯수
		int totalContents = secondHandService.selectSaleProductTotalContents();

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage_Sale.mp");
		model.addAttribute("pageBar", pageBar);

		System.out.println("list : " + list);

		model.addAttribute("member", member);
		model.addAttribute("list", list);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("totalContents", totalContents);

//		List<myPageOrderList> list = secondHandService.selectSaleProductList(member_name);
//
//		System.out.println("판매내역 리스트 -> " + list + "\n");
//
//		model.addAttribute("list", list);

		return "myPage/myPage_Sale";
	}

	@RequestMapping("/myPage/orderStatusChange.do")
	@ResponseBody
	public int OrderStatuschange(@RequestParam int orderNo) {

		System.out.println("주문 상태 바꿀 주문번호 -> " + orderNo);

		int result = secondHandService.updateOrderSaleStatus(orderNo);

		int order_status = 0;

		if (result > 0) {
			order_status = 2;
		}

		return order_status;
	}

	@RequestMapping("/myPage/purchaseStatusChange.do")
	@ResponseBody
	public int purchaseStatusChange(@RequestParam int orderNo) {

		int result = secondHandService.updatePurchaseStatus(orderNo);
		
		//int status = secondHandService.selectSecondHandStatus(orderNo);

		System.out.println("현재 배송상태 -> " + orderNo);

		int order_status = 0;

		if (result > 0) {
			order_status = 3;
		}

		return order_status;
	}

	@RequestMapping("/myPage/myPage_Review.mp")
	public String myPageReview(@RequestParam int ono, @RequestParam int pno, @RequestParam int mno, Model model) {

		System.out.println("Review Controller access");

		HashMap<String, Object> map = new HashMap<String, Object>();

		map.put("product_no", pno);
		map.put("member_no", mno);

		System.out.println("service에 전달할 map : " + map);

		Review_ProductInfo info = secondHandService.selectReviewInfo(map);

		model.addAttribute("info", info);
		model.addAttribute("orderNo", ono);

		return "myPage/myPage_Review";
	}

	@RequestMapping("/myPage/reviewEnroll.mp")
	public String reviewEnroll(Review review, Model model) {
		
		int pno = review.getProduct_no();
		
		System.out.println("review 등록 controller 접근 : " + review);

		String msg = "";
		String loc = "";
		
		int result = secondHandService.insertReview(review);

		if (result > 0) {
			msg = "리뷰가 성공적으로 등록되었습니다.";
			loc = "/product/productDetail.do?product_no="+pno+"&pType=1";
		} else {
			msg = "리뷰 등록에 실패하였습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);
		

		return "common/msg";
	}

	@RequestMapping("/header/totalSearch.do")
	public String totalSearch(@RequestParam(value = "totalSearch") String totalSearch, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "1") int cPage) {
		System.out.println(totalSearch);

		int numPerPage = 12;

		// 현재 페이지의 상품 갯수
		List<Map<String, String>> result = secondHandService.selectSearchResult(cPage, numPerPage, totalSearch);

		// 전체 상품 갯수
		int totalContents = secondHandService.selectSearchTotalContents(totalSearch);

		System.out.println(totalContents);

		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "myPage_Product.mp");
		model.addAttribute("pageBar", pageBar);

		// List<Product> result = secondHandService.selectSearchResult(totalSearch);

		System.out.println("중고 검색 결과 -> " + result);

		if (result.size() > 0) {
			model.addAttribute("list", result);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("totalContents", totalContents);
			return "product/searchProduct";
		} else
			return "redirect:/";
	}

}
