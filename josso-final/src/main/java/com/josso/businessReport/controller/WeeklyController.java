package com.josso.businessReport.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.josso.businessReport.controller.model.service.WeeklyService;
import com.josso.businessReport.vo.WeeklyReport;
import com.josso.employee.vo.Employee;

@Controller
public class WeeklyController {
	
	@Autowired
	WeeklyService ws;
	
	// 주간업무보고(목록)
	@RequestMapping(value="report/weekly/list", method=RequestMethod.GET)
	public ModelAndView weeklyList(ModelAndView mv) throws Exception {
		System.out.println("주간업무보고 컨트롤러 - 목록보기 들어옴");
		
		List<WeeklyReport> weeklyReport = ws.selectList();
			
			
			// 캘린더 생성
			System.out.println("캘린더 생성까지 들어옴");
			Calendar calendar = Calendar.getInstance();
			
			// 몇 년, 몇 주차 전역변수 선언
			int yearth;
			int monthth;
			int weekth;

			
			// 전송할 타이틀 결과값을 Array리스트로 전역변수 생성
			List<String> sendTitle = new ArrayList<>();
			
		try {
			System.out.println("try들어옴");
			// 날짜형식 맞춤
			System.out.println("날짜변환 시작");
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println("날짜변환 끝");
			

			String strDate;
			
			System.out.println("weeklyReport.size : " + weeklyReport.size());
			
			for(int i=0; i<weeklyReport.size(); i++) {
				System.out.println("반복문 시작");
				strDate = simpleDateFormat.format(weeklyReport.get(i).getThisStart());
				
				// 날짜를 String 배열로 받아 년/월 쪼개기
				System.out.println("날짜변환 시작");
				String thisDate = String.valueOf(strDate);
				String[] titleDate = thisDate.split("-");
				
				// 년, 월로 쪼개기
				System.out.println("년 월 쪼개기 시작");
				int year = Integer.parseInt(titleDate[0]);
				int month = Integer.parseInt(titleDate[1]);
				int day = Integer.parseInt(titleDate[2]);
				
				// 캘린더에 년, 월 세팅
				System.out.println("년, 월 세팅");
				System.out.println(year);
				System.out.println(month);
				System.out.println(day);
				
				// 캘린더 셋 시작
				System.out.println("캘린더 셋 시작");
				calendar.set(year, month, day);
				System.out.println("여기가 안 들어옴");
				
				// 몇 번째 주인지 추출
				System.out.println("주차 추출");
				yearth = calendar.get(Calendar.YEAR);
				monthth = calendar.get(Calendar.MONTH);
				weekth = calendar.get(Calendar.WEEK_OF_MONTH);
				
				// 출력 찍어봄
				System.out.println(i+"번째");
				System.out.println(yearth + "년 " + weekth + "번째 주 업무보고");
				
				// 뷰단에 뿌려주기
				sendTitle.add(yearth + "년 " + monthth + "월 " + weekth + "번째 주 업무보고");
				System.out.println("sendTitle : " + sendTitle);
				mv.addObject("sendTitle", sendTitle);


			}

			
		} catch (NumberFormatException e) {
			System.out.println("NumberFormatException 예외발생");
		} catch (Exception e) {
			System.out.println("예외 발생 : " );
			e.printStackTrace();
		}



		mv.addObject("ws", weeklyReport);
		mv.setViewName("businessReport/weeklyList");
		return mv;
	}
	
	
	
	
	
	
	// 주간업무보고(작성 페이지) '브릿지'
	@RequestMapping(value="report/weekly/write", method=RequestMethod.GET)
	public ModelAndView weeklyWrite(ModelAndView mv) throws Exception {
		System.out.println("작성 브릿지");
		mv.setViewName("businessReport/weeklyWrite");
		return mv;
	}
	
	
	
	
	
	
	// 주간업무보고(글등록)
	@RequestMapping(value="report/weekly/register", method=RequestMethod.POST)
	public ModelAndView weeklyRegister(ModelAndView mv, WeeklyReport wr, HttpSession session) throws Exception {
		System.out.println("주간업무보고 등록 들어옴");
		Employee employee = (Employee)session.getAttribute("employee");
		
		wr.setWriter(employee.getEmployeeNumber());
		wr.setReportTitle("제에목");
		
		System.out.println(wr.getWriter());
		System.out.println(wr.getReportTitle());
		
		System.out.println("인트 리절트");
		
		int result = ws.reportWrite(wr);
		
		System.out.println("글이 등록되었습니다.");
		
		mv.setViewName("redirect:list");
		
		
		return mv;
	}
	
	
	
	
	
	
	
	// 주간업무보고(디테일페이지)
	@RequestMapping(value="report/weekly/DetailPage", method=RequestMethod.GET)
	public ModelAndView weeklyDetailPage(ModelAndView mv) throws Exception {
		mv.setViewName("businessReport/weeklyDetailPage");
		return mv;
	}
	
	
	
	
	
	
	// 주간업무보고(수정)
	@RequestMapping(value="report/weekly/update", method=RequestMethod.GET)
	public ModelAndView weekly(ModelAndView mv) throws Exception {
		mv.setViewName("businessReport/weeklyUpdate");
		return mv;
	}
	
	
	
	
	
}
