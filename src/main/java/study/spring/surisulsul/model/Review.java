package study.spring.surisulsul.model;

import lombok.Data;

@Data
public class Review {
	// 1) review table의 기본 컬럼
		private int id;
		private int m_id;
		private String m_name;
		private int p_id;
		private String title;
		private String content;
		private String star;
		private String reg_date;
		private String edit_date;
		private String rev_img;

		// 2) Join 절에 따른 추가 컬럼
		
		// 3) 페이지 구현을 위한 static 변수
		/** LIMIT 절에서 사용할 조회 시작 위치 */
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;
		
		public static int getOffset() {
			return offset;
		}
		
		public static void setOffset(int offset) {
			Review.offset = offset;
		}
		
		public static int getListCount() {
			return listCount;
		}
		
		public static void setListCount(int listCount) {
			Review.listCount = listCount;
		}
}
