package com.josso.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		
//		List<Schedule> scheduleList = ss.selectScheduleAll();
//		ArrayList<Schedule> scheduleListArr = new ArrayList<Schedule>();
//		JSONObject jObj = new JSONObject();
//		JSONArray jArr = new JSONArray();
		ModelAndView mv = new ModelAndView();
//		
//		for(Schedule sd : scheduleList) {
//			JSONObject jObj_ = new JSONObject();
//			jObj_.put("title", sd.getScheduleTitle());
//			jObj_.put("start", sd.getScheduleStartDate());
//			jObj_.put("end", sd.getScheduleEndDate());
//			jArr.add(jObj_);
//			System.out.println(jObj_);
//		}
//		System.out.println("array : "+jArr);
//		jObj.put("data", jArr);
//		System.out.println("array2 : "+jObj);
//		
//		mv.addObject("data", jArr);
		mv.setViewName("schedule.scheduleList");
		return mv;
	}
	
	// ajax를 이용한 schedule 목록 출력
	@ResponseBody
	@RequestMapping(value="scheduleListAll", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String scheduleListAll() throws Exception{
		
		List<Schedule> scheduleList = ss.selectScheduleAll();
		ArrayList<Schedule> scheduleListArr = new ArrayList<Schedule>();
		
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
//			System.out.println(jObj);
		}
//		System.out.println(jArr);
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
		System.out.println(schedule.getScheduleContent());
		System.out.println(schedule.getSchedulePlace());
		System.out.println(schedule.getScheduleStartDate());
		System.out.println(schedule.getScheduleStartTime());
		System.out.println(schedule.getScheduleEndDate());
		System.out.println(schedule.getScheduleEndTime());
		
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
