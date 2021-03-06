package com.josso.employee.controller.model.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.josso.employee.controller.model.dao.EmployeeDao;
import com.josso.employee.email.MailHandler;
import com.josso.employee.email.TempKey;
import com.josso.employee.vo.Employee;


@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired
	EmployeeDao employeeDao;
	@Autowired
    private JavaMailSender mailSender;



	
	@Override
	public List<Employee> selectEmployeeAll() throws Exception{
		List<Employee> employeeList = employeeDao.selectEmployeeAll();
		return employeeList;
	}
	@Override
	public Employee selectEmployee(String employeeNumber) throws Exception{
		Employee employee = employeeDao.selectEmployee(employeeNumber);
		return employee;
	}
	
	@Override
	public void checkEmployeeNumber(String employeeNumber, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(employeeDao.checkEmployeeNumber(employeeNumber));
		out.close();
	}
	
	@Override
	public void checkEmployeeEmail(String employeeEmail, HttpServletResponse response) throws Exception{
		PrintWriter out = response.getWriter();
		out.println(employeeDao.checkEmployeeEmail(employeeEmail));
		out.close();
		
	}
	
	@Override
	public int insertEmployee(Employee employee, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		
		if(employeeDao.checkEmployeeNumber(employee.getEmployeeNumber())==1) {
			out.println("<script>");
			out.println("alert('????????? ??????????????? ???????????????.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else if(employeeDao.checkEmployeeEmail(employee.getEmployeeEmail())==1) {
			out.println("<script>");
			out.println("alert('????????? ???????????? ???????????????.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return 0;
		}else {
			int cnt = employeeDao.insertEmployee(employee);
			System.out.println("Service"+cnt);
				if(cnt == 1) {
					out.println("<script>");
					out.println("alert('("+employee.getEmployeeName()+")??? ?????????????????????.'); location.href='/josso/employee/employeeList'; ");
					out.println("</script>");
					out.close();
			}else {
				out.println("<script>");
				out.println("alert('?????? ????????? ?????? ????????????.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
			
				}
			return cnt;
			}
		
		}
		
	
	
	// ???????????? ??????
	@Override
	public int updateEmployee(Employee employee) throws Exception{
		int cnt = employeeDao.updateEmployee(employee);
		return cnt;
	}
	
	// ????????????
	@Override
	public int deleteEmployee(Employee employee, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int cnt = employeeDao.deleteEmployee(employee);
		if(cnt == 1) {
			out.println("<script>");
			out.println("alert('("+employee.getEmployeeName()+")????????? ????????? ?????????????????????.'); location.href='/josso/employee/employeeList'; ");
			out.println("</script>");
			out.close();
	}else {
		out.println("<script>");
		out.println("alert('????????? ??????????????????. ?????? ????????? ?????????');");
		out.println("history.go(-1);");
		out.println("</script>");
		out.close();
	
		}
	
		return cnt;
	}
	
	//?????????
	@Override
	public Employee login(String employeePassword, String employeeNumber, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Employee employee = employeeDao.selectEmployee(employeeNumber);
//		Employee employee = (Employee) session.getAttribute("employee");
		System.out.println("service : "+employee);
		//????????? ???????????? ????????????
		if( employeeDao.checkEmployeeNumber(employeeNumber) == 0) {
			out.println("<script>");
			out.println("alert('????????? ??????????????? ????????????.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			String loginEmployeePassword = employeePassword;
			System.out.println(employee.getEmployeePassword());
			// ??????????????? ?????? ??????
			if(!employee.getEmployeePassword().equals(loginEmployeePassword)) {
				out.println("<script>");
				out.println("alert('??????????????? ????????????.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				employeeDao.updateLogDate(employee.getEmployeeNumber());
				return employee;
			}
		}
	}
	// ????????????
	@Override
	public void logout(HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("location.href=document.referrer;");
		out.println("</script>");
		out.close();
	}
	
	// ???????????? ??????
	@Override
	public String findEmployeeNumber(HttpServletResponse response, String employeeEmail) throws Exception{
				
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String employeeNumber = employeeDao.findEmployeeNumber(employeeEmail);
				
		if(employeeNumber == null) {
			out.println("<script>");
			out.println("alert('????????? ??????????????? ????????????.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}else {
			out.println("<script>");
			out.println("alert('??????????????? ("+employeeNumber+") ?????????.'); location.href='/josso/employee/login/index'; ");
			
			out.println("</script>");
			out.close();
			return employeeNumber;
		}
	} 
	
	// ?????? ?????? ??????
	@Override
	public String findEmployeePassword(HttpServletResponse response, String employeeNumber) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Employee employee = new Employee();
		employee.setEmployeeNumber(employeeNumber);
			if(employeeDao.checkEmployeeNumber(employeeNumber)==0) {
        	
	        	out.println("<script>");
				out.println("alert('??????????????? ????????????,?????? ????????? ?????????.');");
				out.println("history.go(-1);");
				out.println("</script>");
				out.close();
				return null;
			}else {
				String key = new TempKey().generateKey(10);  // ????????? ??????
				// EmployeeVO??? ????????? ??????
				
		        employee.setEmailAuthKey(key);
		        System.out.println(employee);
		        
		        employeeDao.updatePassword(employee);
		        System.out.println("key : " + key);
		        String employeeEmail = employeeDao.findEmployeePassword(employee.getEmployeeNumber());
		
		        
		        //?????? ??????
		        MailHandler sendMail = new MailHandler(mailSender);
		        sendMail.setSubject("?????? ???????????? ?????????.");
		        sendMail.setText(
		                new StringBuffer()
		                .append("<h1>?????? ???????????????</h1>")
		                .append("???????????? "+ employeeNumber+ "?????? ?????? ???????????????")
		                .append(key)
		                .append("?????????")
		                .append("<p><a href='http://localhost:8181/josso/employee/login/index'>??????????????? ??????</a></p>")
		                .toString());
		        
		        sendMail.setFrom("wanaciel@naver.com", "josoo ?????? ??????");
		        sendMail.setTo(employeeEmail);
		        sendMail.send();
				return key;
			}
    }
 
    //????????? ?????? ??? ??????
    public Employee userAuthKey(String authkey) throws Exception {
    	Employee employee = new Employee();
        employee = employeeDao.checkAuthKey(authkey);
   
        if(employee!=null){
            try{
            	employeeDao.successAuthkey(employee);
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
        return employee;
    }

	

}
