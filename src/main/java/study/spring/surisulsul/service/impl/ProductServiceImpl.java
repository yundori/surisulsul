package study.spring.surisulsul.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.model.Product;
import study.spring.surisulsul.model.Wishlist;
import study.spring.surisulsul.service.ProductService;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;

	/** 상품 베스트 12개 목록 조회 : best_items */
	@Override
	public List<Product> best_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.bestItemList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 베스트 데이터(12개)가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 베스트 데이터(12개) 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 상품 베스트 12개 목록 조회 : best_items -> 매출내역이 없을 비싼가격순으로 조회 */
	@Override
	public List<Product> best_ProductList_price(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.bestItemList_price", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 베스트 데이터(12개)가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 베스트 데이터(12개) 조회에 실패했습니다.");
		}

		return result;
	}

	/** 상품 베스트 4개 목록 조회 : main */
	@Override
	public List<Product> main_best_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.mainbestItemList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 베스트 데이터(4개)가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 베스트 데이터(4개) 조회에 실패했습니다.");
		}

		return result;
	}

	/** 조건에 맞는 상품 목록 조회 : item_filetered */
	@Override
	public List<Product> filtered_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.filteredItemList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조건에 맞는 조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조건에 맞는 데이터 조회에 실패했습니다.");
		}
		/*
		 * System.out.println(">>>>>>>>>>>>serviceimpl 출력결과"); for(Product res : result)
		 * { System.out.println(res); }
		 */

		return result;
	}

	/** 상품 상세 정보 조회 : item_details */
	@Override
	public Product details_ProductItem(Product input) throws Exception {
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.detailsItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 상세 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 상세 데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 상품 정보 조회 : item_info */
	@Override
	public Product info_ProductItem(Product input) throws Exception {
		Product result = null;

		try {
			result = sqlSession.selectOne("ProductMapper.infoItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 종류별 상품 목록 조회 : extra */
	@Override
	public List<Product> types_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.typesItemList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 종류별 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("종류별 상품 데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 상품 데이터 수 조회하기 */
	@Override
	public int getProductCount(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ProductMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 수 조회에 실패했습니다.");
		}

		return result;
	}
	
	/** 상품 데이터 전체 조회 */
	@Override
	public List<Product> getAllProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.allItemlist", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 전체 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("전체 상품 데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/** 상품 데이터 저장 */
	@Override
	public int addProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("ProductMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 저장에 실패했습니다.");
		}

		return result;
	}

	/** 상품 데이터 수정 */
	@Override
	public int editProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ProductMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 수정에 실패했습니다.");
		}

		return result;
	}
	
	/** 상품 별점 데이터 수정 **/
	@Override
	public int editStarProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("ProductMapper.starUpdateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 상품 별점 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 별점 데이터 수정에 실패했습니다.");
		}

		return result;
	}

	/** 상품 데이터 삭제 */
	@Override
	public int deleteProduct(Product input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("ProductMapper.deleteItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 삭제에 실패했습니다.");
		}

		return result;
	}

	/** 주능 결과 4개 상품 조회 */
	@Override
	public List<Product> jn_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.jnItemList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 주능 결과에 맞는 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("주능 결과에 맞는 상품 조회에 실패했습니다.");
		}

		return result;
	}
	
	/**Wishlist에 있는 상품 조회*/
	@Override
	public List<Product> wish_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.wishlistProductList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 위시리스트 상품이 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("해당 위시리스트 상품 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> manage_wish_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectItemCount", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<Product> manage_by_wish_ProductList(Product input) throws Exception {
		List<Product> result = null;

		try {
			result = sqlSession.selectList("ProductMapper.selectItemCountByWish", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 상품 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("상품 데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
