package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Wishlist;

public interface WishlistService {
	/**
	 * 위시리스트 데이터 목록 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Wishlist> getWishlistList(Wishlist input) throws Exception;

	/**
	 * 위시리스트 데이터가 저장되어 있는 갯수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getWishlistCount(Wishlist input) throws Exception;

	/**
	 * 위시리스트 데이터 등록하기
	 * 
	 * @param Wishlist 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addWishlist(Wishlist input) throws Exception;

	/**
	 * 위시리스트 데이터 삭제하기
	 * 
	 * @param Wishlist 삭제할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteWishlist(Wishlist input) throws Exception;
}
