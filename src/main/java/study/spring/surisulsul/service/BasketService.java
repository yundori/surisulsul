package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Basket;

/** 장바구니 삽입/조회/부분삭제 기능을 제공하기 위한 Service 계층 */
public interface BasketService {
	
	/**
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public List<Basket> getBasketList(Basket input) throws Exception;
	
	/**
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int addBasket(Basket input) throws Exception;
	
	/**
	 * @param input
	 * @return
	 * @throws Exception
	 */
	public int deleteBasket(Basket input) throws Exception;
}
