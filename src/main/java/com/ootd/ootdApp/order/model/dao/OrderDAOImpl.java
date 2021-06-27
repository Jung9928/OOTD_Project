package com.ootd.ootdApp.order.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ootd.ootdApp.order.model.vo.Cart;
import com.ootd.ootdApp.order.model.vo.Order;
import com.ootd.ootdApp.order.model.vo.OrderList;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Cart> selectCartList(int member_no) {
		
		return sqlSession.selectList("cart-mapper.selectCartList", member_no);
	}

	@Override
	public int deleteCartProduct(int cart_no) {
		
		
		return sqlSession.delete("cart-mapper.deleteCartProduct", cart_no);
	}


	@Override
	public int deleteCartProductAll(int member_no) {
		
		return sqlSession.delete("cart-mapper.deleteCartProductAll", member_no);
	}

	@Override
	public int updateQuantity(Map<String, String> map) {
		
		return sqlSession.delete("cart-mapper.updateQuantity", map);
	}

	@Override
	public List<Cart> selectedCartList(int cart_no) {
		
		return sqlSession.selectList("cart-mapper.selectedCartList", cart_no);
	}

	@Override
	public int insertOrder(Order order) {

		return sqlSession.insert("order-mapper.insertOrder", order);
	}

	@Override
	public int insertOrderList(OrderList oList) {
		
		return sqlSession.insert("order-mapper.insertOrderList", oList);
	}

	@Override
	public int insertPurchase(int member_no) {
	
		return sqlSession.insert("order-mapper.insertPurchase", member_no);
	}

	@Override
	public int insertSaleList(int member_no) {
		
		return sqlSession.insert("order-mapper.insertSaleList", member_no);
	}

	@Override
	public Order selectOrderList() {
		
		return sqlSession.selectOne("order-mapper.selectOrderList");
	}

	@Override
	public int addCartList(Cart cart) {
		
		return sqlSession.insert("cart-mapper.addCartList", cart);
	}

	@Override
	public int addTempCartList(Cart cart) {
		
		return sqlSession.insert("cart-mapper.addTempCartList", cart);
	}

	@Override
	public int selectTempCartNo() {
		
		return sqlSession.selectOne("cart-mapper.selectTempCartNo");
	}



}
