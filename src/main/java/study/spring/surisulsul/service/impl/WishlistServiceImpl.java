package study.spring.surisulsul.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Wishlist;
import study.spring.surisulsul.service.WishlistService;

@Slf4j
@Service
public class WishlistServiceImpl implements WishlistService{
	
	/**
	 * wishlist 목록 조회
	 */
	@Override
	public List<Wishlist> getWishlistList(Wishlist input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**
	 * wishlist 갯수 조회
	 */
	@Override
	public int getWishlistCount(Wishlist input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * wishlist 추가
	 */
	@Override
	public int addWishlist(Wishlist input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	/**
	 * wishlist 삭제
	 */
	@Override
	public int deleteWishlist(Wishlist input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
