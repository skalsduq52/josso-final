package com.josso.businessReport.controller;

import java.text.DateFormat;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.board.vo.BoardPaging;
import com.josso.businessReport.controller.model.service.WeeklyService;
import com.josso.businessReport.vo.ReportPaging;
import com.josso.businessReport.vo.WeeklyReport;
import com.josso.employee.vo.Employee;

@Controller
public class WeeklyController {
	
	@Autowired
	WeeklyService ws;
	
	// 주간업무보고(목록) - 완료
	@RequestMapping(value="report/weekly/list", method=RequestMethod.GET)
	public ModelAndView weeklyList(ModelAndView mv, ReportPaging page) throws Exception {
			// 세팅 시작
			if(page.getTitle().contentEquals("")) {
				page.setTitle("REPORT_TITLE");
			}
			int weeklyReporCount = ws.weeklyReporCount(page);
			page.setCount(weeklyReporCount);
			page.setStartNum(page.getPage());
			page.setLastNum(page.getCount());
			page.setStartRange(page.getPage());
			page.setEndRange(page.getPage());
		
			List<WeeklyReport> weeklyReport = ws.selectList(page);
			// 캘린더 생성
			Calendar calendar = Calendar.getInstance();
			// 몇 년, 몇 주차 전역변수 선언
			int yearth;
			int monthth;
			int weekth;
			// 전송할 타이틀 결과값을 Array리스트로 전역변수 생성
			List<String> sendTitle = new ArrayList<>();
		try {
			// 날짜형식 맞춤
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String strDate;
			for(int i=0; i<weeklyReport.size(); i++) {
				strDate = simpleDateFormat.format(weeklyReport.get(i).getThisStart());
				// 날짜를 String 배열로 받아 년/월 쪼개기
				String thisDate = String.valueOf(strDate);
				String[] titleDate = thisDate.split("-");
				// 년, 월로 쪼개기
				int year = Integer.parseInt(titleDate[0]);
				int month = Integer.parseInt(titleDate[1]);
				int day = Integer.parseInt(titleDate[2]);
				// 캘린더 셋 시작
				calendar.set(year, month, day);
				// 몇 번째 주인지 추출
				yearth = calendar.get(Calendar.YEAR);
				monthth = calendar.get(Calendar.MONTH);
				weekth = calendar.get(Calendar.WEEK_OF_MONTH);
				// 뷰단에 뿌려주기
				sendTitle.add(yearth + "년 " + monthth + "월 " + weekth + "번째 주 업무보고");
				mv.addObject("sendTitle", sendTitle);
			}
		} catch (NumberFormatException e) {
			System.out.println("NumberFormatException 예외발생");
		} catch (Exception e) {
			System.out.println("예외 발생 : " );
			e.printStackTrace();
		}
		mv.addObject("page", page);
		mv.addObject(weeklyReporCount);
		mv.addObject("ws", weeklyReport);
		mv.setViewName("businessReport/weeklyList");
		return mv;
	}
	
	
	// 주간업무보고(작성 페이지) '브릿지' - 완료
	@RequestMapping(value="report/weekly/write", method=RequestMethod.GET)
	public ModelAndView weeklyWrite(ModelAndView mv) throws Exception {
		mv.setViewName("businessReport/weeklyWrite");
		return mv;
	}
	
	// 주간업무보고(글등록) - 완료
	@RequestMapping(value="report/weekly/register", method=RequestMethod.POST)
	public ModelAndView weeklyRegister(@RequestParam("thisStart") String thisStart, WeeklyReport wr, ModelAndView mv,  HttpSession session) throws Exception {
		System.out.println("주간업무보고 등록 들어옴");
		/* 제목값 구하기*/
		// thisStart로 변환하여 제목으로 활용
		Calendar calendar = Calendar.getInstance();
		// 년, 월로 쪼개기
		String titleDate[] = thisStart.split("-");
		int year = Integer.parseInt(titleDate[0]);
		int month = Integer.parseInt(titleDate[1]);
		int day = Integer.parseInt(titleDate[2]);
		// 캘린더 셋 시작
		calendar.set(year, month, day);
		// 몇 번째 주인지 추출
		int yearth = calendar.get(Calendar.YEAR);
		int monthth = calendar.get(Calendar.MONTH);
		int weekth = calendar.get(Calendar.WEEK_OF_MONTH);
		// title변수에 제목값 저장
		String title = yearth + "년 " + monthth + "월 " + weekth + "번째 주 업무보고";
		// title값 출력 찍어봄
		System.out.println("날짜값 : " + title);
		// Employee 세션 가져오기
		Employee employee = (Employee)session.getAttribute("employee");
		// 제목에 날짜로 계산해 온 제목값 세팅해줌
		wr.setReportTitle(title);
		// writer에 세션값(employeeName) 넣음
		wr.setWriter(employee.getEmployeeNumber());
		int result = ws.reportWrite(wr);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	
	// 주간업무보고(디테일페이지) - 완료
	@RequestMapping(value="report/weekly/DetailPage", method=RequestMethod.GET)
	public ModelAndView weeklyDetailPage(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		String num1= num;
		WeeklyReport wr = ws.selectDetailPage(num);
		mv.addObject("num1", num1);
		mv.addObject("wr", wr);
		mv.setViewName("businessReport/weeklyDetailPage");
		return mv;
	}
	
	// 주간업무보고(update 브릿지) - 완료
	@RequestMapping(value="report/weekly/updateBridge", method=RequestMethod.GET)
	public ModelAndView updateBridge(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		System.out.println(num);
		String num1=num;
		WeeklyReport wr = ws.selectDetailPage(num);
		mv.addObject("num", num1);
		mv.addObject("wr", wr);
		mv.setViewName("businessReport/weeklyUpdate");
		return mv;
	}
	
	// 주간업무보고(수정하기 완료 버튼) - 진행 중
	@RequestMapping(value="report/weekly/update", method=RequestMethod.POST)
	public ModelAndView weeklyUpdate(WeeklyReport wr, ModelAndView mv) throws Exception {
		int result = ws.reportUpdate(wr);
		mv.addObject("num",wr.getReportNumber());
		mv.setViewName("redirect:DetailPage");
		return mv;
	}
	
	// 주간업무보고(삭제하는 페이지) - 완료
	@RequestMapping(value="report/weekly/delete", method=RequestMethod.GET)
	public ModelAndView weeklyDelete(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		int result = ws.reportDelete(num);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	
}
