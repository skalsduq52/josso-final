package com.josso.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.josso.schedule.service.ScheduleService;
import com.josso.schedule.vo.Schedule;

@Controller
public class ScheduleController {
	
	@Autowired
	ScheduleService ss;
	
//	@ResponseBody
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
	
	@ResponseBody
	@RequestMapping(value="scheduleListAll", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	public String scheduleListAll() throws Exception{
		
		List<Schedule> scheduleList = ss.selectScheduleAll();
		ArrayList<Schedule> scheduleListArr = new ArrayList<Schedule>();
		
		for(int i = 0; i<scheduleList.size(); i++) {
			Schedule sd = scheduleList.get(i);
			scheduleListArr.add(sd);
			System.out.println(sd);
		}
		
		JSONArray jArr = new JSONArray();
		for(Schedule sd : scheduleListArr) {
			JSONObject jObj = new JSONObject();
			jObj.put("title", sd.getScheduleTitle());
			jObj.put("start", sd.getScheduleStartDate());
			jObj.put("end", sd.getScheduleEndDate());
			jArr.add(jObj);
			System.out.println(jObj);
		}
		System.out.println(jArr);
		return jArr.toJSONString();
	}
	
	@RequestMapping(value="schedule/write", method=RequestMethod.GET)
	public ModelAndView scheduleWrite() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("schedule.scheduleWrite");
		return mv;
	}
	
	@RequestMapping(value="schedule/register", method=RequestMethod.POST)
	public ModelAndView insertSchedule(Schedule schedule, ModelAndView mv) throws Exception {
		
		System.out.println(schedule.getScheduleTitle());
		System.out.println(schedule.getScheduleContent());
		System.out.println(schedule.getSchedulePlace());
		System.out.println(schedule.getScheduleStartDate());
		System.out.println(schedule.getScheduleStartTime());
		System.out.println(schedule.getScheduleEndDate());
		System.out.println(schedule.getScheduleEndTime());
		
		String result = Integer.toString(ss.insertSchedule(schedule));
		
		System.out.println("결과값 확인 : "+ result);
		
		mv.setViewName("schedule.scheduleList");
		
		return mv;
	}
}
