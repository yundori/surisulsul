package study.spring.surisulsul.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import study.spring.surisulsul.model.Sales;
import study.spring.surisulsul.service.SalesService;

/**
 * 매분 0초 (테스트용) / 매일 자정 SALES를 업데이트 할 스케줄러 컨트롤러
 */
@Controller
public class SalesScheduler {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	SalesService salesService;
	
	//매 분마다 수행되는 스케줄러 메서드 - 테스트용
	public void everyMinutes() {
		/** 1) 오늘 날짜 구해서 orders_sub로부터 리스트 불러오기 
		//오늘 날짜 구하기
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");			
		
		Sales input = new Sales();
		//edit_date 변수에 오늘 날짜를 추가 (orders_sub에 오늘 상품별 매출을 받아오기 위함)
		input.setEdit_date(sdf.format(date.getTime()));
		
		List<Sales> todaySales = new ArrayList<Sales>();   //오늘 매출을 받아올 todaySales 리스트
		
		// orders_sub로부터 오늘 상품별 매출 받아오기
		try {
			todaySales = salesService.getTodaySales(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//input 객체를 재활용하기 전 edit_date 초기화
		input.setEdit_date(null);
		
		/** 2) 받아온 리스트를 가지고 기존 total_qty / total_price와 합산 후 sales 테이블 업데이트 처리
		for(int i=0; i<todaySales.size(); i++) {
			input.setP_id(todaySales.get(i).getP_id()); //오늘 팔린 상품의 p_id 삽입
			Sales salesDetails = new Sales(); // sales에서 받아올 기존 매출금액
			
			try {
				// a) 받아온 리스트의 반복문을 통해 해당 상품의 기존 total_qty / total_price를 받아오기
				salesDetails = salesService.getSalesItem(input);
				
				// b) 받아온 기존 total_qty / total_price와 오늘 매출량을 합산해서 input 객체에 삽입
				input.setTotal_qty(todaySales.get(i).getTotal_qty()+salesDetails.getTotal_qty());
				input.setTotal_price(todaySales.get(i).getTotal_price()+salesDetails.getTotal_price());
				
				// c) input 객체에 삽입된 값 (p_id, 합산된 total_qty, 합산된 total_price)을 가지고 sales 테이블 UPDATE
				salesService.updateSales(input);
			} catch (Exception e) { e.printStackTrace(); }			
		}*/		
	}
	
	// 매일 자정에 수행되는 스케줄러 메서드 - 실제 사이트에 사용할 메서드
	// 자정이니까 어제 매출을 가져와서 UPDATE 해야됨!
	public void everyMidnight() {
		
		/** 1) 어제 날짜 구해서 orders_sub로부터 리스트 불러오기 */
		//어제 날짜 구하기
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");			
		
		Sales input = new Sales();
		//edit_date 변수에 오늘 날짜를 추가 (orders_sub에 어제 상품별 매출을 받아오기 위함)
		input.setEdit_date(sdf.format(date.getTime()));
		
		List<Sales> yesterdaySales = new ArrayList<Sales>();   //어제 매출을 받아올 yesterdaySales 리스트
		
		// orders_sub로부터 어제 상품별 매출 받아오기
		try {
			yesterdaySales = salesService.getTodaySales(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//input 객체를 재활용하기 전 edit_date 초기화
		input.setEdit_date(null);
		
		/** 2) 받아온 리스트를 가지고 기존 total_qty / total_price와 합산 후 sales 테이블 업데이트 처리 */
		for(int i=0; i<yesterdaySales.size(); i++) {
			input.setP_id(yesterdaySales.get(i).getP_id()); //어제 팔린 상품의 p_id 삽입
			Sales salesDetails = new Sales(); // sales에서 받아올 기존 매출금액
			
			try {
				// a) 받아온 리스트의 반복문을 통해 해당 상품의 기존 total_qty / total_price를 받아오기
				salesDetails = salesService.getSalesItem(input);
				
				// b) 받아온 기존 total_qty / total_price와 어제 매출량을 합산해서 input 객체에 삽입
				input.setTotal_qty(yesterdaySales.get(i).getTotal_qty()+salesDetails.getTotal_qty());
				input.setTotal_price(yesterdaySales.get(i).getTotal_price()+salesDetails.getTotal_price());
				
				// c) input 객체에 삽입된 값 (p_id, 합산된 total_qty, 합산된 total_price)을 가지고 sales 테이블 UPDATE
				salesService.updateSales(input);
			} catch (Exception e) { e.printStackTrace(); }			
		}
		
	}
}
