package study.spring.surisulsul.service;

import java.util.List;

import study.spring.surisulsul.model.Product;

/** 상품 데이터 조회 기능을 제공하기 위한 Service 계층 */
public interface ProductService {

	/**
	 * 상품 베스트 12개 목록 조회 (best_items)
	 * 
	 * @param Product Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> best_ProductList(Product input) throws Exception;
	
	/**
	 * 조건에 맞는 상품 목록 조회 (item_filtered)
	 * 
	 * @param Product Beans
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Product> filtered_ProductList(Product input) throws Exception;
	
	/**
	 * 상품 상세 정보 조회 (item_details)
	 * 
	 * @param Product Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Product details_ProductItem(Product input) throws Exception;
	
	/**
	 * 상품 정보 조회 (item_details -> item_info)
	 * 
	 * @param Product Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Product info_ProductItem(Product input) throws Exception;
	
	/**
	 * 종류별 상품 목록 조회 (extra)
	 * 
	 * @param Product Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<Product> types_ProductList(Product input) throws Exception;

	/**
	 * 상품 데이터가 저장되어 있는 개수 조회
	 * 
	 * @return int
	 * @throws Exception
	 */
	public int getProductCount(Product input) throws Exception;

	/** <<관리자 페이지에 필요한 서비스>> */
	/**
	 * 상품 데이터 등록하기
	 * 
	 * @param Product 저장할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int addProduct(Product input) throws Exception;

	/**
	 * 상품 데이터 수정하기
	 * 
	 * @param Product 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editProduct(Product input) throws Exception;

	/**
	 * 상품 데이터 삭제하기
	 * 
	 * @param Product 삭제할 학과의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteProduct(Product input) throws Exception;
}
