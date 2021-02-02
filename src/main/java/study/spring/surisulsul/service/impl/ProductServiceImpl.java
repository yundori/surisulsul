package study.spring.surisulsul.service.impl;

import java.util.List;

import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.service.ProductService;

public class ProductServiceImpl implements ProductService{
	
	/* 인기있는술 : 12개 상품목록 조회 */
	@Override
	public List<Product> best_ProductList(Product input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/* 내가찾는술 : 조건에 맞는 상품목록 조회 */
	@Override
	public List<Product> filtered_ProductList(Product input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/* 상품상세페이지 : 상품 상세 정보 조회 */
	@Override
	public Product details_ProductItem(Product input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/* 상품상세페이지 -> 상품정보 : 상품 정보 조회 */
	@Override
	public Product info_ProductItem(Product input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/* 종류별 페이지에서 내가찾는술 페이지로 이동 : 종류별 상품목록 조회 */
	@Override
	public List<Product> types_ProductList(Product input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getProductCount(Product input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addProduct(Product input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int editProduct(Product input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(Product input) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}
