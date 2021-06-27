package com.ootd.ootdApp.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.reflect.TypeToken;
import com.ootd.ootdApp.member.model.vo.Member;
import com.ootd.ootdApp.order.model.service.OrderService;
import com.ootd.ootdApp.order.model.vo.BuyList;
import com.ootd.ootdApp.order.model.vo.Cart;
import com.ootd.ootdApp.order.model.vo.Order;
import com.ootd.ootdApp.order.model.vo.OrderList;

import org.json.JSONArray;
import org.json.JSONObject;




@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
		
	// =========== 카트 영역 ===============1 //
	
	// 장바구니 리스트 불러오기
	@RequestMapping("/order/cart.or")
	public String cartList(Model model, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		
		int member_no = member.getMember_no();
		
		List<Cart> cart = orderService.selectCartList(member_no);

//		System.out.println(cart);
		
		model.addAttribute("cart", cart);
				
		return "/order/cart";
	}
	
	@RequestMapping("/order/deleteCartProduct.or")
	public String deleteCartProduct(@RequestParam int cart_no) {

		int result = orderService.deleteCartProduct(cart_no);
	
		if(result>0) {
			System.out.println("카트 번호 "+ cart_no+" 삭제 성공");
		} else {
			System.out.println("상품 삭제 실패");
		}
		
		return "redirect:/order/cart.or";
		
	}
	
	// 선택 항목 삭제
	@RequestMapping("/order/deleteCartProductList.or")
	public String deleteCartProductList(@RequestParam(value="selchk[]") int selchk[]) {
		
		// jsp 에서 배열 넘어오는거 확인
		// System.out.println(selchk[0]);
		
		int cart_no = 0;
		
		// 반복문으로 selchk 배열에 담긴 상품번호를 반복문을 통해 하나씩 삭제
		for(int no : selchk) {
			cart_no = no;
			int result = orderService.deleteCartProduct(cart_no);
			
			if(result>0) {
				System.out.println("카트번호 " + no +"번 상품 선택 삭제 성공");
			} else {
				System.out.println("카트번호 " + no +"번 상품 삭제 실패");
			}
		}	
		return "redirect:/order/cart.or";
	}
	
	// 전체 항목 삭제
	@RequestMapping("/order/deleteCartProductAll.or")
	public String deleteCartProductAll(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		
		int member_no = member.getMember_no();
		
		int result = orderService.deleteCartproductAll(member_no);
		
		if(result>0) {
			System.out.println("카트 리스트 전체 삭제 성공");
		} else {
			System.out.println("카트 리스트 전체 삭제 실패");
		}
		
		return "redirect:/order/cart.or";
	}
	
	// 수량 변경 업데이트
	@RequestMapping("/order/updateQuantity.or")
	@ResponseBody
	public Map<String, String> updateQuantity(
			@RequestParam String cart_no,
			@RequestParam String quantity) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("cart_no", cart_no);
		map.put("quantity", quantity);
		
		System.out.println(map);
		
		int result = orderService.updateQuantity(map);
				
		if(result>0) {
			System.out.println("업데이트 완료");
		} else System.out.println("실패");
		
		return map;
		
	}
	
	
	// add cartList from product Detail
	@RequestMapping("/order/addCartList.or")
	@ResponseBody
	public void addCartList(HttpServletRequest req, 
						     @RequestParam(value="product_no[]") int product_no[],
							 @RequestParam(value="order_quantity[]")int order_quantity[],
							 @RequestParam(value="product_size[]") String product_size[]
								) {
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");

		int member_no = member.getMember_no();
		
//		System.out.println(product_no);
//		System.out.println(order_quantity);
//		System.out.println(product_size);
		
		for(int i = 1 ; i < product_no.length ; i++) {
			Cart cart = new Cart();
		cart.setMember_no(member_no);
		cart.setProduct_no(product_no[i]);
		cart.setCart_quantity(order_quantity[i]);
		cart.setCart_size(product_size[i]);
				
		int Result = orderService.addCartList(cart);
		
		if(Result > 0) {
			System.out.println("카트에 상품담기 성공");
		} else {
			System.out.println("카트에 상품담기 실패");
			};
		};
		
	};
	
	
	// add cartList from SecondHand Product Detail
		@RequestMapping("/order/addCartListSecondHand.or")
		@ResponseBody
		public void addCartListSecondHand(HttpServletRequest req, 
							     @RequestParam int product_no,
								 @RequestParam int order_quantity,
								 @RequestParam String product_size
									) {
			
			HttpSession session = req.getSession();
			Member member = (Member) session.getAttribute("member");

			int member_no = member.getMember_no();
			
			System.out.println(product_no);
			System.out.println(order_quantity);
			System.out.println(product_size);
			
			
			Cart cart = new Cart();
			cart.setMember_no(member_no);
			cart.setProduct_no(product_no);
			cart.setCart_quantity(order_quantity);
			cart.setCart_size(product_size);
					
			int Result = orderService.addCartList(cart);
			
			if(Result > 0) {
				System.out.println("카트에 상품담기 성공");
			} else {
				System.out.println("카트에 상품담기 실패");
				};
		
			
		};

	
	
	
//  ajax 통신 시도
//	@RequestMapping("/order/deleteCartProduct.or")
//	public void deleteCartProduct(
//			@RequestParam int cart_no, Model model, HttpServletRequest req) {
//
//		System.out.println(cart_no + "번 장바구니 데이터 삭제");
//		
//		int result = orderService.deleteCartProduct(cart_no);
//
//		if(result>0) {
//			System.out.println("삭제 성공");
//			cartList(model, req);
//		} else {
//			System.out.println("삭제 실패");
//		}
//
//
//	}
	
	// =========== 카트 영역 =============== //
	
	
	
	
		
	// =========== 주문 페이지 영역 =========== //
	@RequestMapping("/order/order.or")
	public String selectOrderList(
			Model model, HttpServletRequest req,
			@RequestParam(value="selectedCart_no") List<Integer> selectedCart_no) {
		// ---------- 상품 리스트 가져오기 시작 ----------- //
		int cart_no = 0;

		ArrayList<Cart> cart = new ArrayList<>();
		
		// 반복문으로 selProduct 배열에 담긴 상품번호를 반복문을 통해 하나씩 search
		for(int pNo : selectedCart_no) {
//			List<Cart> cart = new ArrayList<>();
			cart_no = pNo;
			List<Cart> list = orderService.selectedCartList(cart_no);  // cart_no 1개 조회
			cart.addAll(list);

		}	
		System.out.println(cart);
		// ---------- 상품 리스트 가져오기 끝 ----------- //
		
		
		// ---------- 멤버 정보 가져오기 시작 ----------- //
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");

				
		// ---------- 멤버 정보 가져오기 끝 ----------- //		
		
		model.addAttribute("cart", cart);
		model.addAttribute("m", member);
		
		
		
		// 장바구니에서 주문 선택한 품목 불러오기		
		return "order/order";
	}
	
	// 결제 완료 후 주문번호 생성 -> 각 테이블에 데이터 전송
	@RequestMapping("/order/paymentSuccess.or")
	@ResponseBody
	public void paymentSuccess(Model model, HttpServletRequest req,
			@RequestParam String receiver_name,
			@RequestParam String order_address,
			@RequestParam String order_memo,
			@RequestParam int total_price,
			@RequestParam (value="order_size[]") String order_size[],
			@RequestParam (value="order_quantity[]")int order_quantity[],
			@RequestParam (value="product_no[]")int product_no[],
			@RequestParam (value="cart_no[]") int cart_no[]
			) {
		
		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("member");
		int member_no = member.getMember_no();
		
		if(order_memo == "") {
			order_memo = "없음";
		}
		
		// O_Order 에 값 넘기기
		Order order = new Order();
		order.setReceiver_name(receiver_name);
		order.setOrder_address(order_address);
		order.setOrder_memo(order_memo);
		order.setTotal_price(total_price);
		order.setMember_no(member_no);
				
		System.out.println("order 객체 값 확인 : " + order);
		int iResult = orderService.insertOrder(order); 
		
		if(iResult >0) {
			System.out.println("ORDER 테이블 데이터 입력 성공!");
			} else {
				System.out.println("실패");
			}
		
		// 성 공 했 다 !!!!! //
		

		// Order_List에 데이터 넣기
		// 반복문으로 상품번호, 수량, 사이즈 하나씩 insert
		for(int i = 0 ; i < product_no.length; i++) {
			
			OrderList oList = new OrderList();
			
			oList.setProduct_no(product_no[i]);
			oList.setOrder_quantity(order_quantity[i]);
			oList.setOrder_size(order_size[i]);
			
			// System.out.println(oList);
	
		
			int olResult = orderService.insertOrderList(oList);
			
			if(olResult >0) {
			System.out.println(i +"번째 orderList 데이터 입력 성공!");
			} else {
				System.out.println("실패");
			}
		}
		
		// !!!!!!!!! 성 공 !!!!!!!!! //
		
		
		// PURCHASE 테이블에 데이터 넣기
		
		int pResult = orderService.insertPurchase(member_no);
		
		if(pResult >0) {
		System.out.println("PURCHASE TABLE 데이터 입력 성공!");
		} else {
			System.out.println("실패");
		}
		// !!!!!!!!! 성 공 !!!!!!!!! //
			
		
		
		// SALE_LIST 테이블에 데이터 넣기
		int sResult = orderService.insertSaleList(member_no);
		
		if(sResult >0) {
			System.out.println("SALE_LIST TABLE 데이터 입력 성공!");
		} else {
			System.out.println("실패");
		}
		// !!!!!!!!! 성 공 !!!!!!!!! //
		
		
		// 카트 번호 삭제하기
		for(int i = 0 ; i< cart_no.length ; i++) {
			
			int cResult = orderService.deleteCartProduct(cart_no[i]);
			if(cResult >0 ) {
				System.out.println("구매 완료, 카트번호 "+cart_no[i]+"번 삭제");
			} else System.out.println("삭제 실패");
			
		}
	}
	
	// 결제하지 않고 페이지 이동시 카트번호 삭제
	
//	@RequestMapping("/order/deleteTempCartNo.or")
//	public String deleteTempCartNo(@RequestParam (value="cart_no[]") int cart_no[]) {
//		String result = "";
//		for(int i = 0 ; i< cart_no.length ; i++) {
//			
//			int cResult = orderService.deleteCartProduct(cart_no[i]);
//			if(cResult >0 ) {
//				System.out.println("카트번호 "+cart_no[i]+"번 삭제");
//				result = "true";
//			} else System.out.println("삭제 실패");
//			result = "false";
//		}
//		
//		return result;
//	}
	
	
	
	// 결제 완료 페이지 영역
	
	@RequestMapping("/order/orderResult.or")
	public String orderResult(Model model, Order order) {
		
		Order oResult = orderService.selectOrderList();
		
		model.addAttribute("order", oResult);
		System.out.println(model);
		
		
		return "/order/orderResult";
		
	}
	
	// 브랜드 상품 상세 페이지에서 즉시 구매
		@RequestMapping("/order/buyList.or")
		@ResponseBody
		public List<Integer> buyDirect(@RequestParam String data, HttpServletRequest req, Model model){
			  
			  	List<Integer> cartNo = new ArrayList<Integer>();
			 
				HttpSession session = req.getSession();
				Member member = (Member) session.getAttribute("member");
				
				int mNo = member.getMember_no();
	
			      List<Map<String, Object>> buyList = new Gson().fromJson(String.valueOf(data),
			              new TypeToken<List<Map<String, Object>>>(){}.getType());

			      for (Map<String, Object> b : buyList) {
	    	  
			  		Cart cart = new Cart();
			  		
			  		int pNo = Integer.parseInt( (String) b.get("product_no"));
			  		int pQuan = Integer.parseInt( (String) b.get("cart_quantity"));
			  		String pSize = (String) b.get("cart_size");
			  		String pName = (String) b.get("product_name");
			  		String bName = (String) b.get("brand_name");
			  		int pPrice = Integer.parseInt( (String) b.get("product_price"));
			  		String aName = (String) b.get("att_name");

			  		cart.setProduct_no(pNo);
			  		cart.setProduct_name(pName);
			  		cart.setCart_quantity(pQuan);
			  		cart.setCart_size(pSize);
			  		cart.setProduct_name(pName);
			  		cart.setBrand_name(bName);
			  		cart.setProduct_price(pPrice);
			  		cart.setAtt_name(aName);
			  		cart.setMember_no(mNo);
			  		
					int dbResult = orderService.addTempCartList(cart);
					
					if(dbResult > 0) {
						System.out.println("카트에 상품담기 성공");
						int cNo = orderService.selectTempCartNo();
						
					cartNo.add(cNo);
						
					} else System.out.println("카트에 상품담기 실패");
			  	  } 
			      
			      System.out.println(cartNo);
			      
									      
			  return cartNo; 
			}
		
		// 중고 상품 상세 페이지에서 즉시 구매
				@RequestMapping("/order/buyDirectSecondHand.or")
				@ResponseBody
				public List<Integer> buyDirectSecondHand(@RequestParam String data, HttpServletRequest req, Model model){
					  
					  	List<Integer> cartNo = new ArrayList<Integer>();
					 
						HttpSession session = req.getSession();
						Member member = (Member) session.getAttribute("member");
						
						int mNo = member.getMember_no();
			
					      List<Map<String, Object>> buyList = new Gson().fromJson(String.valueOf(data),
					              new TypeToken<List<Map<String, Object>>>(){}.getType());

					      for (Map<String, Object> b : buyList) {
			    	  
					  		Cart cart = new Cart();
					  		
					  		int pNo = Integer.parseInt( (String) b.get("product_no"));
					  		int pQuan = Integer.parseInt( (String) b.get("cart_quantity"));
					  		String pSize = (String) b.get("cart_size");
					  		String pName = (String) b.get("product_name");
					  		String bName = (String) b.get("brand_name");
					  		int pPrice = Integer.parseInt( (String) b.get("product_price"));
					  		String aName = (String) b.get("att_name");

					  		cart.setProduct_no(pNo);
					  		cart.setProduct_name(pName);
					  		cart.setCart_quantity(pQuan);
					  		cart.setCart_size(pSize);
					  		cart.setProduct_name(pName);
					  		cart.setBrand_name(bName);
					  		cart.setProduct_price(pPrice);
					  		cart.setAtt_name(aName);
					  		cart.setMember_no(mNo);
					  		
							int dbResult = orderService.addTempCartList(cart);
							
							if(dbResult > 0) {
								System.out.println("카트에 상품담기 성공");
								int cNo = orderService.selectTempCartNo();
								
							cartNo.add(cNo);
								
							} else System.out.println("카트에 상품담기 실패");
					  	  } 
					      
					      System.out.println(cartNo);
					      
											      
					  return cartNo; 
					}
	
}
