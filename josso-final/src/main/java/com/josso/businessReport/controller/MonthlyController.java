package com.josso.businessReport.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.businessReport.controller.model.service.MonthlyService;
import com.josso.businessReport.vo.MonthlyReport;
import com.josso.employee.vo.Employee;

@Controller
public class MonthlyController {
	
	@Autowired
	MonthlyService ms;
	
	// 월간실적보고(목록)
	@RequestMapping(value="report/monthly/list", method=RequestMethod.GET)
	public ModelAndView monthlyList(ModelAndView mv) throws Exception  {
		List<MonthlyReport> monthlyReport = ms.selectList();
		
		// 캘린더 생성
		Calendar calendar = Calendar.getInstance();
		
		// 몇 년, 몇 월 전역변수 선언
		int yearth;
		int monthth;

		// 전송할 타이틀 결과값을 Array리스트로 전역변수 생성
		List<String> sendTitle = new ArrayList<>();
		
	try {
		// 날짜형식 맞춤
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

		String strDate;
		
		System.out.println("monthlyReport.size : " + monthlyReport.size());
		
		for(int i=0; i<monthlyReport.size(); i++) {
			strDate = simpleDateFormat.format(monthlyReport.get(i).getThisMonth());
			System.out.println("STR : " + strDate);
			// 날짜를 String 배열로 받아 년/월 쪼개기
			String thisDate = String.valueOf(strDate);
			String[] titleDate = thisDate.split("-");
			
			// 년, 월로 쪼개기
			int year = Integer.parseInt(titleDate[0]);
			int month = Integer.parseInt(titleDate[1]);
			
			// 캘린더 셋 시작
			calendar.set(year, month);
			
			// 몇 번째 주인지 추출
			yearth = calendar.get(Calendar.YEAR);
			monthth = calendar.get(Calendar.MONTH);
			
			// 출력 찍어봄
			// System.out.println(i+"번째");
			// System.out.println(yearth + "년 " + monthth + "월 " + weekth + "번째 주 업무보고");
			
			// 뷰단에 뿌려주기
			sendTitle.add(yearth + "년 " + monthth + "월 성과 업무보고");
			mv.addObject("sendTitle", sendTitle);

		}

		
	} catch (NumberFormatException e) {
		System.out.println("NumberFormatException 예외발생");
	} catch (Exception e) {
		System.out.println("예외 발생 : " );
		e.printStackTrace();
	}

	mv.addObject("ms", monthlyReport);
		mv.setViewName("businessReport/monthlyList");
		return mv;
	}
	
	// 월간실적보고(작성) '브릿지'
	@RequestMapping(value="report/monthly/write", method=RequestMethod.GET)
	public ModelAndView monthlyWrite(ModelAndView mv) throws Exception  {
		mv.setViewName("businessReport/monthlyWrite");
		return mv;
	}
	
	// 월간실적보고(글등록) - 완료
	@RequestMapping(value="report/monthkly/register", method=RequestMethod.POST)
	public ModelAndView monthlyRegister(@RequestParam("thisMonth") String thisMonth, MonthlyReport mr, ModelAndView mv,  HttpSession session) throws Exception {
		System.out.println("주간업무보고 등록 들어옴");
		
		/* 제목값 구하기*/
		// thisStart로 변환하여 제목으로 활용
		Calendar calendar = Calendar.getInstance();
		System.out.println(thisMonth);
		
		String titleDate[] = thisMonth.split("-");
		
		// 년, 월로 쪼개기
		int year = Integer.parseInt(titleDate[0]);
		int month = Integer.parseInt(titleDate[1]);
		
		// 캘린더 셋 시작
		calendar.set(year, month);
		
		// 몇 번째 주인지 추출
		int yearth = calendar.get(Calendar.YEAR);
		int monthth = calendar.get(Calendar.MONTH);
		
		// title변수에 제목값 저장
		String title = yearth + "년 " + monthth + "월 실적  보고";
		
		// title값 출력 찍어봄
		System.out.println("날짜값 : " + title);
			/* 제목값 구하기 끝 */
		
		// Employee 세션 가져오기
		Employee employee = (Employee)session.getAttribute("employee");

		// 제목에 날짜로 계산해 온 제목값 세팅해줌
		mr.setReportTitle(title);
		System.out.println("wr vo에 넣은 제목값 : " + mr.getReportTitle() );

		// writer에 세션값(employeeName) 넣음
		System.out.println("세션에 있는 사원번호값 : "+employee.getEmployeeNumber());
		mr.setWriter(employee.getEmployeeNumber());
		System.out.println("세션에 있는 사원번호값 : " + mr.getWriter());
		
		int result = ms.reportWrite(mr);
		
		mv.setViewName("redirect:list");
		
		return mv;
	}
	
	
	// 월간실적보고(디테일페이지)
	@RequestMapping(value="report/monthly/DetailPage", method=RequestMethod.GET)
	public ModelAndView monthlyDetailPage(ModelAndView mv, @RequestParam("num") String num) throws Exception  {
		
		String num1 = num;
		
		MonthlyReport mr = ms.selectDetailPage(num);
		
		mv.addObject("num1", num1);
		mv.addObject("mr", mr);
		mv.setViewName("businessReport/monthlyDetailPage");
		return mv;
	}
	
	// 월간실적보고(update 브릿지) - 완료
	@RequestMapping(value="report/monthly/updateBridge", method=RequestMethod.GET)
	public ModelAndView updateBridge(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		System.out.println("- 수정페이지 들어옴 -");
		System.out.println(num);
		
		String num1=num;
		
		MonthlyReport mr = ms.selectDetailPage(num);
		
		mv.addObject("num", num1);
		mv.addObject("wr", ms);
		mv.setViewName("businessReport/monthlyUpdate");
		return mv;
	}
	
	
	
	// 월간실적보고(수정하기 완료 버튼) - 진행 중
	@RequestMapping(value="report/monthly/update", method=RequestMethod.POST)
	public ModelAndView monthlyUpdate(MonthlyReport mr, ModelAndView mv, @RequestParam("num") int num) throws Exception {
		System.out.println("- 수정완료 버튼 누름 -");
		System.out.println("num값 : " + num);
		System.out.println("이것도 드러오나? : " + mr);
		
		// 완료
		mr.setReportNumber(num);
		
		int result = ms.reportUpdate(num);
		
		System.out.println("result : " + result);
		
		mv.setViewName("businessReport/monthlyUpdate");
		return mv;
	}
	
	// 월간실적보고(삭제하는 페이지) - 완료
	@RequestMapping(value="report/monthly/delete", method=RequestMethod.GET)
	public ModelAndView monthlyDelete(ModelAndView mv, @RequestParam("num") String num) throws Exception {
		System.out.println("삭제 드가자");
		System.out.println(num);
		
		int result = ms.reportDelete(num);
		
		mv.setViewName("redirect:list");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
}
