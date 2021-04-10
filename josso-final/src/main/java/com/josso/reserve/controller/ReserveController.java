package com.josso.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.josso.employee.vo.Employee;
import com.josso.reserve.service.ReserveService;
import com.josso.reserve.vo.Reserve;

@Controller
public class ReserveController {

	@Autowired
	ReserveService reserveService;

	// reserve main 페이지
	@RequestMapping(value = "reserve", method = RequestMethod.GET)
	public String reserveMain(Model model, HttpServletResponse response,HttpSession session) throws Exception {
		// 현재일 보내기
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String dayOfWeek2 = dayFormat.format(cal.getTime());
		model.addAttribute("dayOfWeek2", dayOfWeek2);

		// 내가 예약한 회의실 or 차 보기
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		employee.setEmployeeNumber(employeeNumber);
		List<Reserve> myUser = reserveService.selectReserveMyUser(employeeNumber);
		model.addAttribute("myUser", myUser);
		return "/reserve/reserveMain";
	}

	// reserve 하루용 현재일부터 6개월 데이터 넘겨주기
	@RequestMapping(value = "dateJSON", method = RequestMethod.GET)
	@ResponseBody
	public String mainJSON(HttpServletResponse response) throws IOException {
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String[] dayOfWeek = new String[174];
		int k = 1;
		for (int i = 0; i < dayOfWeek.length; i++) {
			dayOfWeek[i] = dayFormat.format(cal.getTime());
			cal.add(Calendar.DATE, k);
		}
		// json 배열 생성해서 jsp페이지에 보내기
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 174; i++) {
			list.add(dayOfWeek[i]);
		}
		JSONArray jArr = new JSONArray();
		jArr.addAll(list);

		return jArr.toJSONString();
	}
	

	// 현재일 기준 주마다용(현재주 일요일 포함해서) 6개월 년,월,일 데이터 json으로 뿌려주기
	@RequestMapping(value = "dateWeekJSON", method = RequestMethod.GET)
	@ResponseBody
	public String reserveRoomJSON(HttpServletResponse response) throws IOException {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek = new String[175];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 175; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 175; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek[i] = dayFormat.format(cal.getTime());
			}
		}
		// json 배열 생성해서 jsp페이지에 보내기
		List<String> list = new ArrayList<String>();
		for (int i = 0; i < 175; i++) {
			list.add(dayOfWeek[i]);
		}
		JSONArray jArr = new JSONArray();
		jArr.addAll(list);

		return jArr.toJSONString();
	}

	// 일별 전체 예약 현황 보기
	@RequestMapping(value = "userJSON", method = RequestMethod.GET)
	@ResponseBody
	public String userMainJSON(HttpServletResponse response) throws Exception {
		List<Reserve> reserveItem_ = reserveService.selectReserveUser();
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("itemNumber", res.getItemNumber());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}
	
	// 일별 Room만 예약 현황 보기
		@RequestMapping(value = "userRoomJSON", method = RequestMethod.GET)
		@ResponseBody
		public String userRoomJSON(HttpServletResponse response) throws Exception {
			List<Reserve> reserveItem_ = reserveService.selectReserveUserRoom();
			ArrayList<Reserve> list = new ArrayList<Reserve>();
			for (int i = 0; i < reserveItem_.size(); i++) {
				Reserve res_ = reserveItem_.get(i);
				list.add(res_);
			}
			// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
			JSONArray jarr = new JSONArray();
			// list 를 jarr 에 저장 처리
			for (Reserve res : list) {
				// user 정보 저장할 json 객체 선언
				JSONObject jres = new JSONObject();
				jres.put("reservationStartDate", res.getReservationStartDate());
				jres.put("startTime", res.getStartTime());
				jres.put("endTime", res.getEndTime());
				jres.put("itemNumber", res.getItemNumber());
				jres.put("reservationPurpose",
						URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
				jres.put("userName",
						URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
				jarr.add(jres);
			}
			// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
			return jarr.toJSONString();
		}
		
		// 일별 Car만 예약 현황 보기
		@RequestMapping(value = "userCarJSON", method = RequestMethod.GET)
		@ResponseBody
		public String userCarJSON(HttpServletResponse response) throws Exception {
			List<Reserve> reserveItem_ = reserveService.selectReserveUserCar();
			ArrayList<Reserve> list = new ArrayList<Reserve>();
			for (int i = 0; i < reserveItem_.size(); i++) {
				Reserve res_ = reserveItem_.get(i);
				list.add(res_);
			}
			// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
			JSONArray jarr = new JSONArray();
			// list 를 jarr 에 저장 처리
			for (Reserve res : list) {
				// user 정보 저장할 json 객체 선언
				JSONObject jres = new JSONObject();
				jres.put("reservationStartDate", res.getReservationStartDate());
				jres.put("startTime", res.getStartTime());
				jres.put("endTime", res.getEndTime());
				jres.put("itemNumber", res.getItemNumber());
				jres.put("reservationPurpose",
						URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
				jres.put("userName",
						URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
				jarr.add(jres);
			}
			// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
			return jarr.toJSONString();
		}

	// reservation-delete
	@RequestMapping(value = "delete/reserve", method = RequestMethod.GET)
	public ModelAndView deleteReserve(ModelAndView modelAndView, Reserve reserve) throws Exception {
		int success = reserveService.deleteReserve(reserve);
		modelAndView.addObject("success", success);
		modelAndView.setViewName("redirect:/reserve");

		return modelAndView;
	}

	@RequestMapping(value = "reserve/room", method = RequestMethod.GET)
	public String reserveRoom(Model model, HttpServletResponse response) {
		// 현재일 보내기
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String dayOfWeek2 = dayFormat.format(cal.getTime());
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		return "/reserve/reserveRoom";
	}

	@RequestMapping(value = "reserve/car", method = RequestMethod.GET)
	public String reserveCar(Model model, HttpServletResponse response) {
		// 현재일 보내기
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		String dayOfWeek2 = dayFormat.format(cal.getTime());
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		return "/reserve/reserveCar";
	}

	// 이번주 일요일 ~ 월요일 dayOfWeek2로 jsp에 데이터 넘기기
	@RequestMapping(value = "reserve/room/first", method = RequestMethod.GET)
	public String reserveRoomFirst(Model model, @RequestParam("itemNumber") int itemNumber,
			HttpServletResponse response, HttpSession session) throws Exception {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek2 = new String[7];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		}
		Calendar cal2 = Calendar.getInstance();
		String dayOfWeek2First = dayFormat.format(cal2.getTime());
		cal.add(Calendar.DATE, 168);
		String dayOfWeek2Last = dayFormat.format(cal.getTime());
		
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeName = employee.getEmployeeName();
		employee.setEmployeeName(employeeName);
		
		model.addAttribute("employeeName", employeeName);
		model.addAttribute("dayOfWeek2First", dayOfWeek2First);
		model.addAttribute("dayOfWeek2Last", dayOfWeek2Last);
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveRoomFirst";
	}

	// 1회의실 예약된 날짜 데이터 json으로 뿌려주기
	@RequestMapping(value = "reserve/room/itemJSON", method = RequestMethod.GET)
	@ResponseBody
	public String reserveItemJSON(HttpServletResponse response) throws Exception {
		int itemNumber = 1;
		List<Reserve> reserveItem_ = reserveService.selectReserveItem(itemNumber);
		ArrayList<Reserve> list = new ArrayList<Reserve>();
		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}

	// reservation-insert
	@RequestMapping(value = "reserve/room/reservation", method = RequestMethod.GET)
	public String reservation(Model model, Reserve reserve, HttpSession session, @RequestParam("itemNumber") int itemNumber) throws Exception {
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		reserve.setEmployeeNumber(employeeNumber);
		String message = "오류";
		if (reserve.getReservationStartDate() == null || reserve.getReservationStartDate() == ""
				|| reserve.getReservationPurpose() == null || reserve.getReservationPurpose() == "") {
			message = "입력 안하신 목록이 있습니다.";
		} else if (reserve.getStartTime().equals(reserve.getEndTime())) {
			message = "같은 시간 때를 입력하셨습니다.";
		} else if (Integer.parseInt(reserve.getStartTime()) >= Integer.parseInt(reserve.getEndTime())) {
			message = "예약시작 시간과 예약종료 시간을 잘못 입력하셨습니다.";
		} else {
			int success = reserveService.insertReserve(reserve);
			message = "예약완료 되었습니다.";
			if(success == 0) {
				message = "이미 예약된 시간입니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveInsert";
	}

	@RequestMapping(value = "reserve/room/second", method = RequestMethod.GET)
	public String reserveRoomSecond(Model model, @RequestParam("itemNumber") int itemNumber,
			HttpServletResponse response, HttpSession session) throws Exception {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek2 = new String[7];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		}
		Calendar cal2 = Calendar.getInstance();
		String dayOfWeek2First = dayFormat.format(cal2.getTime());
		cal.add(Calendar.DATE, 168);
		String dayOfWeek2Last = dayFormat.format(cal.getTime());
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeName = employee.getEmployeeName();
		employee.setEmployeeName(employeeName);
		
		model.addAttribute("employeeName", employeeName);
		model.addAttribute("dayOfWeek2First", dayOfWeek2First);
		model.addAttribute("dayOfWeek2Last", dayOfWeek2Last);
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveRoomSecond";
	}

	// 2회의실 예약된 날짜 데이터 json으로 뿌려주기
	@RequestMapping(value = "reserve/room/itemJSON2", method = RequestMethod.GET)
	@ResponseBody
	public String reserveItemJSON2(HttpServletResponse response) throws Exception {
		int itemNumber = 2;
		List<Reserve> reserveItem_ = reserveService.selectReserveItem(itemNumber);
		ArrayList<Reserve> list = new ArrayList<Reserve>();

		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}

	// 2회의실 예약 insert
	@RequestMapping(value = "reserve/room/reservation2", method = RequestMethod.GET)
	public String reservation2(Model model, Reserve reserve, HttpSession session, @RequestParam("itemNumber") int itemNumber) throws Exception {
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		reserve.setEmployeeNumber(employeeNumber);
		String message = "오류";
		if (reserve.getReservationStartDate() == null || reserve.getReservationStartDate() == ""
				|| reserve.getReservationPurpose() == null || reserve.getReservationPurpose() == "") {
			message = "입력 안하신 목록이 있습니다.";
		} else if (reserve.getStartTime().equals(reserve.getEndTime())) {
			message = "같은 시간 때를 입력하셨습니다.";
		} else if (Integer.parseInt(reserve.getStartTime()) >= Integer.parseInt(reserve.getEndTime())) {
			message = "예약시작 시간과 예약종료 시간을 잘못 입력하셨습니다.";
		} else {
			int success = reserveService.insertReserve(reserve);
			message = "예약완료 되었습니다.";
			if(success == 0) {
				message = "이미 예약된 시간입니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveInsert";
	}

	@RequestMapping(value = "reserve/room/third", method = RequestMethod.GET)
	public String reserveRoomThird(Model model, @RequestParam("itemNumber") int itemNumber,
			HttpServletResponse response, HttpSession session) throws Exception {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek2 = new String[7];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		}
		Calendar cal2 = Calendar.getInstance();
		String dayOfWeek2First = dayFormat.format(cal2.getTime());
		cal.add(Calendar.DATE, 168);
		String dayOfWeek2Last = dayFormat.format(cal.getTime());
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeName = employee.getEmployeeName();
		employee.setEmployeeName(employeeName);
		
		model.addAttribute("employeeName", employeeName);
		model.addAttribute("dayOfWeek2First", dayOfWeek2First);
		model.addAttribute("dayOfWeek2Last", dayOfWeek2Last);
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveRoomThird";
	}

	// 3회의실 예약된 날짜 데이터 json으로 뿌려주기
	@RequestMapping(value = "reserve/room/itemJSON3", method = RequestMethod.GET)
	@ResponseBody
	public String reserveItemJSON3(HttpServletResponse response) throws Exception {
		int itemNumber = 3;
		List<Reserve> reserveItem_ = reserveService.selectReserveItem(itemNumber);
		ArrayList<Reserve> list = new ArrayList<Reserve>();

		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}

	// 3회의실 예약 insert
	@RequestMapping(value = "reserve/room/reservation3", method = RequestMethod.GET)
	public String reservation3(Model model, Reserve reserve, HttpSession session, @RequestParam("itemNumber") int itemNumber) throws Exception {
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		reserve.setEmployeeNumber(employeeNumber);
		String message = "오류";
		if (reserve.getReservationStartDate() == null || reserve.getReservationStartDate() == ""
				|| reserve.getReservationPurpose() == null || reserve.getReservationPurpose() == "") {
			message = "입력 안하신 목록이 있습니다.";
		} else if (reserve.getStartTime().equals(reserve.getEndTime())) {
			message = "같은 시간 때를 입력하셨습니다.";
		} else if (Integer.parseInt(reserve.getStartTime()) >= Integer.parseInt(reserve.getEndTime())) {
			message = "예약시작 시간과 예약종료 시간을 잘못 입력하셨습니다.";
		} else {
			int success = reserveService.insertReserve(reserve);
			message = "예약완료 되었습니다.";
			if(success == 0) {
				message = "이미 예약된 시간입니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveInsert";
	}

	@RequestMapping(value = "reserve/car/avante", method = RequestMethod.GET)
	public String reserveCarAvante(Model model, @RequestParam("itemNumber") int itemNumber,
			HttpServletResponse response, HttpSession session) throws Exception {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek2 = new String[7];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		}
		Calendar cal2 = Calendar.getInstance();
		String dayOfWeek2First = dayFormat.format(cal2.getTime());
		cal.add(Calendar.DATE, 168);
		String dayOfWeek2Last = dayFormat.format(cal.getTime());
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeName = employee.getEmployeeName();
		employee.setEmployeeName(employeeName);
		
		model.addAttribute("employeeName", employeeName);
		model.addAttribute("dayOfWeek2First", dayOfWeek2First);
		model.addAttribute("dayOfWeek2Last", dayOfWeek2Last);
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveCarAvante";
	}

	// Avante 예약된 날짜 데이터 json으로 뿌려주기
	@RequestMapping(value = "reserve/car/itemJSON4", method = RequestMethod.GET)
	@ResponseBody
	public String reserveItemJSON4(HttpServletResponse response) throws Exception {
		int itemNumber = 4;
		List<Reserve> reserveItem_ = reserveService.selectReserveItem(itemNumber);
		ArrayList<Reserve> list = new ArrayList<Reserve>();

		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}

	// Avante 예약 insert
	@RequestMapping(value = "reserve/car/reservation4", method = RequestMethod.GET)
	public String reservation4(Model model, Reserve reserve, HttpSession session, @RequestParam("itemNumber") int itemNumber) throws Exception {
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		reserve.setEmployeeNumber(employeeNumber);
		String message = "오류";
		if (reserve.getReservationStartDate() == null || reserve.getReservationStartDate() == ""
				|| reserve.getReservationPurpose() == null || reserve.getReservationPurpose() == "") {
			message = "입력 안하신 목록이 있습니다.";
		} else if (reserve.getStartTime().equals(reserve.getEndTime())) {
			message = "같은 시간 때를 입력하셨습니다.";
		} else if (Integer.parseInt(reserve.getStartTime()) >= Integer.parseInt(reserve.getEndTime())) {
			message = "예약시작 시간과 예약종료 시간을 잘못 입력하셨습니다.";
		} else {
			int success = reserveService.insertReserve(reserve);
			message = "예약완료 되었습니다.";
			if(success == 0) {
				message = "이미 예약된 시간입니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveInsert";
	}

	@RequestMapping(value = "reserve/car/benz", method = RequestMethod.GET)
	public String reserveCarBenz(Model model, @RequestParam("itemNumber") int itemNumber, HttpServletResponse response, HttpSession session)
			throws Exception {
		// 이번주 일요일 날짜 구하기 int dayOfWeek 1=일요일, 2=월요일 ....... 7=토요일
		SimpleDateFormat dayFormat = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		int dayOfWeek_ = cal.get(Calendar.DAY_OF_WEEK);
		String[] dayOfWeek2 = new String[7];
		int k = 1;
		int m = -1;
		if (dayOfWeek_ == 1) {
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = 0; i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		} else if (dayOfWeek_ > 1 || dayOfWeek_ < 8) {
			for (int i = (dayOfWeek_ - 2); i >= 0; i--) {
				cal.add(Calendar.DATE, m);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
			cal.add(Calendar.DATE, (dayOfWeek_ - 2));
			for (int i = (dayOfWeek_ - 1); i < 7; i++) {
				cal.add(Calendar.DATE, k);
				dayOfWeek2[i] = dayFormat.format(cal.getTime());
			}
		}
		Calendar cal2 = Calendar.getInstance();
		String dayOfWeek2First = dayFormat.format(cal2.getTime());
		cal.add(Calendar.DATE, 168);
		String dayOfWeek2Last = dayFormat.format(cal.getTime());
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeName = employee.getEmployeeName();
		employee.setEmployeeName(employeeName);
		
		model.addAttribute("employeeName", employeeName);
		model.addAttribute("dayOfWeek2First", dayOfWeek2First);
		model.addAttribute("dayOfWeek2Last", dayOfWeek2Last);
		model.addAttribute("dayOfWeek2", dayOfWeek2);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveCarBenz";
	}

	// Benz 예약된 날짜 데이터 json으로 뿌려주기
	@RequestMapping(value = "reserve/car/itemJSON5", method = RequestMethod.GET)
	@ResponseBody
	public String reserveItemJSON5(HttpServletResponse response) throws Exception {
		int itemNumber = 5;
		List<Reserve> reserveItem_ = reserveService.selectReserveItem(itemNumber);
		ArrayList<Reserve> list = new ArrayList<Reserve>();

		for (int i = 0; i < reserveItem_.size(); i++) {
			Reserve res_ = reserveItem_.get(i);
			list.add(res_);
		}
		// JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		// list 를 jarr 에 저장 처리
		for (Reserve res : list) {
			// user 정보 저장할 json 객체 선언
			JSONObject jres = new JSONObject();
			jres.put("reservationStartDate", res.getReservationStartDate());
			jres.put("startTime", res.getStartTime());
			jres.put("endTime", res.getEndTime());
			jres.put("reservationPurpose",
					URLEncoder.encode(res.getReservationPurpose(), "utf-8").replaceAll("\\+", "%20"));
			jres.put("userName",
					URLEncoder.encode(res.getEmployee().get(0).getEmployeeName(), "utf-8").replaceAll("\\+", "%20"));
			jarr.add(jres);
		}
		// 전송할 객체 배열을 JSONObject에 담아 한 번에 전달한다
		return jarr.toJSONString();
	}

	// Benz 예약 insert
	@RequestMapping(value = "reserve/car/reservation5", method = RequestMethod.GET)
	public String reservation5(Model model, Reserve reserve, HttpSession session, @RequestParam("itemNumber") int itemNumber) throws Exception {
		Employee employee = (Employee) session.getAttribute("employee");
		String employeeNumber = employee.getEmployeeNumber();
		reserve.setEmployeeNumber(employeeNumber);
		String message = "오류";
		if (reserve.getReservationStartDate() == null || reserve.getReservationStartDate() == ""
				|| reserve.getReservationPurpose() == null || reserve.getReservationPurpose() == "") {
			message = "입력 안하신 목록이 있습니다.";
		} else if (reserve.getStartTime().equals(reserve.getEndTime())) {
			message = "같은 시간 때를 입력하셨습니다.";
		} else if (Integer.parseInt(reserve.getStartTime()) >= Integer.parseInt(reserve.getEndTime())) {
			message = "예약시작 시간과 예약종료 시간을 잘못 입력하셨습니다.";
		} else {
			int success = reserveService.insertReserve(reserve);
			message = "예약완료 되었습니다.";
			if(success == 0) {
				message = "이미 예약된 시간입니다.";
			}
		}
		
		model.addAttribute("message", message);
		model.addAttribute("itemNumber", itemNumber);
		return "/reserve/reserveInsert";
	}
}
