package com.josso.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.josso.employee.vo.Employee;
import com.josso.schedule.service.ScheduleService;
import com.josso.schedule.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService ss;
	
	// schedule 화면
	@RequestMapping(value="schedule", method=RequestMethod.GET)
	public ModelAndView schedule() throws Exception {
		
		ModelAndView mv = new ModelAndView();

		
		
		mv.setViewName("schedule.scheduleList");
		return mv;
	}
	
	// ajax를 이용한 schedule 목록 출력
	@ResponseBody
	@RequestMapping(value="scheduleListAll", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String scheduleListAll(HttpSession session) throws Exception{
		
		
		ArrayList<Schedule> scheduleListArr = new ArrayList<Schedule>();
		Employee emp = (Employee) session.getAttribute("employee");
		
		List<Schedule> scheduleList = ss.selectScheduleMe(emp.getEmployeeNumber());
		
		for(int i = 0; i<scheduleList.size(); i++) {
			Schedule sd = scheduleList.get(i);
			scheduleListArr.add(sd);
		}
		
		JSONArray jArr = new JSONArray();
		for(Schedule sd : scheduleListArr) {
			JSONObject jObj = new JSONObject();
			jObj.put("id", sd.getScheduleNumber());
			jObj.put("title", sd.getScheduleTitle());
			jObj.put("start", sd.getScheduleStartDate());
			jObj.put("end", sd.getScheduleEndDate());
			jArr.add(jObj);
		}
		return jArr.toJSONString();
	}
	
	// ajax를 이용한 schedule 목록 출력
	@ResponseBody
	@RequestMapping(value="scheduleListAll2", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String scheduleListAll2(HttpSession session, @RequestBody String checkList) throws Exception{
		
		
		System.out.println("선택번호 크기: "+checkList.length());
		
		List<Schedule> scheduleList = null;
		
		ArrayList<Schedule> scheduleListArr = new ArrayList<Schedule>();

		JSONArray jArr = new JSONArray();
		
		Employee emp = (Employee) session.getAttribute("employee");
		
		if(checkList.length()==11 && checkList.contains("option3")) {
			
			scheduleList = ss.selectScheduleAll();
			
			for(int i = 0; i<scheduleList.size(); i++) {
				Schedule sd = scheduleList.get(i);
				scheduleListArr.add(sd);
			}
			
			for(Schedule sd : scheduleListArr) {
				JSONObject jObj = new JSONObject();
				jObj.put("id", sd.getScheduleNumber());
				jObj.put("title", sd.getScheduleTitle());
				jObj.put("start", sd.getScheduleStartDate());
				jObj.put("end", sd.getScheduleEndDate());
				jArr.add(jObj);
			}
			
		}else if(checkList.length()==11 && checkList.contains("option2")) {

			scheduleList = ss.selectScheduleTeam(emp.getDepartmentCode());
			
			for(int i = 0; i<scheduleList.size(); i++) {
				Schedule sd = scheduleList.get(i);
				scheduleListArr.add(sd);
			}
			
			for(Schedule sd : scheduleListArr) {
				JSONObject jObj = new JSONObject();
				jObj.put("id", sd.getScheduleNumber());
				jObj.put("title", sd.getScheduleTitle());
				jObj.put("start", sd.getScheduleStartDate());
				jObj.put("end", sd.getScheduleEndDate());
				jArr.add(jObj);
			}
			
		}else if(checkList.length()==11 && checkList.contains("option1")) {
			
			scheduleList = ss.selectScheduleMe(emp.getEmployeeNumber());
			
			for(int i = 0; i<scheduleList.size(); i++) {
				Schedule sd = scheduleList.get(i);
				scheduleListArr.add(sd);
			}
			
			for(Schedule sd : scheduleListArr) {
				JSONObject jObj = new JSONObject();
				jObj.put("id", sd.getScheduleNumber());
				jObj.put("title", sd.getScheduleTitle());
				jObj.put("start", sd.getScheduleStartDate());
				jObj.put("end", sd.getScheduleEndDate());
				jArr.add(jObj);
			}
		}else {
			System.out.println("일정 없음");
		}
		
		System.out.println(jArr);
		return jArr.toJSONString();
	}
	
	// 일정등록 페이지
	@RequestMapping(value="schedule/write", method=RequestMethod.GET)
	public ModelAndView scheduleWrite() throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		List<Employee> ep = ss.selectAttendeeAll();
		for(int i = 0; i<ep.size(); i++) {
			Employee em = ep.get(i);
		}
		mv.addObject("employee", ep);
		mv.setViewName("schedule.scheduleWrite");
		return mv;
	}
	
	
//	@RequestMapping(value="attendeeList", method=RequestMethod.POST)
//	public ModelAndView attendeeList() {
//		
//		List<Employee> ep = ss.
//		
//		ModelAndView mv = new ModelAndView();
//		
//		return mv;
//	}
	
	// 일정등록 (로그인 한 사원번호로 일정등록)
	@RequestMapping(value="schedule/register", method=RequestMethod.POST)
	public ModelAndView insertSchedule(Schedule schedule, HttpSession session,
			ModelAndView mv) throws Exception {
		
		System.out.println(schedule.getScheduleTitle());
//		System.out.println(schedule.getScheduleContent());
//		System.out.println(schedule.getSchedulePlace());
		System.out.println(schedule.getAttendee());
//		System.out.println(schedule.getScheduleStartDate());
//		System.out.println(schedule.getScheduleStartTime());
//		System.out.println(schedule.getScheduleEndDate());
//		System.out.println(schedule.getScheduleEndTime());
		
		Employee emp = (Employee) session.getAttribute("employee");

		schedule.setEmployeeNumber(emp.getEmployeeNumber());
		
		String result = Integer.toString(ss.insertSchedule(schedule));
		
		System.out.println("결과값 확인 : "+ result);
		
		mv.setViewName("redirect:/schedule");
		
		return mv;
	}
	
	// Schedule 상세페이지
	@RequestMapping(value="schedule/detail", method=RequestMethod.GET)
	public ModelAndView scheduleDetail(@RequestParam(value="id", required=false) String scheduleNum) 
			throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(scheduleNum);
		
		Schedule sc = ss.selectSchedule(scheduleNum);
		System.out.println(sc.getAttendee());
		
		if(sc.getAttendee() != null) {
			String[] array = sc.getAttendee().split(",");
			
			for(int i=0; i<array.length; i++) {
				System.out.println(array[i]);
			}
			
			int size = array.length;
			
			mv.addObject("size", size);
			mv.addObject("attendee", array);
		}
		
		
//		List<String> attendee = new ArrayList<>(); 
		
		
		
		mv.addObject("schedule", sc);
		mv.setViewName("schedule.scheduleDetail");
		return mv;
	}
	
	// Schedule 수정
	@RequestMapping(value="schedule/update", method=RequestMethod.POST)
	public ModelAndView scheduleUpdate(Schedule schedule) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(schedule.getScheduleTitle());
		System.out.println(schedule.getScheduleContent());
		System.out.println(schedule.getScheduleStartDate());
		System.out.println(schedule.getScheduleStartTime());
		System.out.println(schedule.getScheduleNumber());
		
		String result = Integer.toString(ss.updateSchedule(schedule));
		
		mv.setViewName("redirect:/schedule");
		
		return mv;
	}
	
	// Schedule 삭제
	@RequestMapping(value="schedule/delete", method=RequestMethod.GET)
	public ModelAndView scheduleDelete(String scheduleNum) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		
		System.out.println(scheduleNum);
		
		String result = Integer.toString(ss.deleteSchedule(scheduleNum));
		
		mv.setViewName("redirect:/schedule");
		
		return mv;
	}
}