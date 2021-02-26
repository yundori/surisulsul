package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import study.spring.surisulsul.service.OrderService;
import study.spring.surisulsul.service.SalesService;

/**
 * 매분 0초 (테스트용) / 매일 자정 SALES를 업데이트 할 스케줄러 컨트롤러
 */
@Controller
public class SalesScheduler {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	SalesService salesService;
	@Autowired
	OrderService orderService;
	

	public void everyMinutes() {
		
	}
	
	public void everyMidnight() {
		
	}
}
