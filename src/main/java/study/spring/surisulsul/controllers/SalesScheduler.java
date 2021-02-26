package study.spring.surisulsul.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import lombok.extern.slf4j.Slf4j;
import study.spring.surisulsul.service.OrderService;
import study.spring.surisulsul.service.SalesService;

/**
 * 매분 0초 (테스트용) / 매일 자정 SALES를 업데이트 할 스케줄러 컨트롤러
 */
@Slf4j
@Controller
public class SalesScheduler {
	
	/** Service 패턴 구현체 주입 */
	@Autowired
	SalesService salesService;
	@Autowired
	OrderService orderService;
	

	public void everyMinutes() {
		log.debug("......................분 단위로 실행되는 작업 수행 중..........");
	}
	
	public void everyMidnight() {
		log.debug("......................매일 자정 실행되는 작업 수행 중..........");
	}
}
