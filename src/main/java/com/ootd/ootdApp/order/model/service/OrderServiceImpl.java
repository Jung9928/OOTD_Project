package com.ootd.ootdApp.order.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ootd.ootdApp.order.model.dao.OrderDAO;
import com.ootd.ootdApp.order.model.vo.Cart;
import com.ootd.ootdApp.order.model.vo.Order;
import com.ootd.ootdApp.order.model.vo.OrderList;


@Service
public class OrderServiceImpl implements OrderService {
	
	@Autowired
	OrderDAO orderDAO;

	@Override
	public List<Cart> selectCartList(int member_no) {
		
		return orderDAO.selectCartList(member_no);
	}

	@Override
	public int deleteCartProduct(int cart_no) {
		
		return orderDAO.deleteCartProduct(cart_no);
	}

	@Override
	public int deleteCartproductAll(int member_no) {
		
		return orderDAO.deleteCartProductAll(member_no);
	}
	

	@Override
	public int updateQuantity(Map<String, String> map) {
		
		return orderDAO.updateQuantity(map);
	}

	@Override
	public List<Cart> selectedCartList(int cart_no) {
		
		return orderDAO.selectedCartList(cart_no);
	}

	@Override
	public int insertOrder(Order order) {
		
		return orderDAO.insertOrder(order);
	}

	@Override
	public int insertOrderList(OrderList oList) {
		
		return orderDAO.insertOrderList(oList);
	}

	@Override
	public int insertPurchase(int member_no) {
		
		return orderDAO.insertPurchase(member_no);
	}

	@Override
	public int insertSaleList(int member_no) {

		return orderDAO.insertSaleList(member_no);
	}

	@Override
	public Order selectOrderList() {
		
		return orderDAO.selectOrderList();
	}

	@Override
	public int addCartList(Cart cart) {
		
		return orderDAO.addCartList(cart);
	}

	@Override
	public int addTempCartList(Cart cart) {
	
		return orderDAO.addTempCartList(cart);
	}

	@Override
	public int selectTempCartNo() {
		
		return orderDAO.selectTempCartNo();
	}


}
