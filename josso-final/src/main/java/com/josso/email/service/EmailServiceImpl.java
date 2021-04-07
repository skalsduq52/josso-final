package com.josso.email.service;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.email.dao.EmailDao;
import com.josso.email.vo.Email;
import com.josso.email.vo.EmailPaging;
import com.josso.employee.vo.Employee;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	EmailDao emailDao;
	
	// 받은메일함 - 리스트
	public List<Email> AcceptList(EmailPaging page) throws Exception{
		return emailDao.AcceptList(page);
	}
	
	// 보낸메일함 - 리스트
	public List<Email> SendList(EmailPaging page) throws Exception{ // , String field, String query
		return emailDao.SendList(page); 
	}
	
	// 휴지통 - 리스트
	public List<Email> WastebasketList(EmailPaging page) throws Exception{
		return emailDao.WastebasketList(page);
	}
	
	// 답장버튼 누를시
	public List<Email> EmailReply(int number) throws Exception{
		return emailDao.EmailReply(number);
	}
	
	// 참조자 정보 가져오기
	public Email Er(int num) throws Exception{
		return emailDao.Er(num);
	}
	
	// 보낸사람 정보 가져오기
	public Email Es(int num) throws Exception{
		return emailDao.Es(num);
	}
	
	// 받는사람 정보 가져오기
	public Email Ea(int num) throws Exception{
		return emailDao.Ea(num);
	}
	
	// 메일보내기
	public int emailWriteAction(Email email) throws Exception{
		return emailDao.emailWriteAction(email);
	}
	
	// 자세히보기(받은 메일함)
	public Email AcceptDetail(int num) throws Exception{
		return emailDao.AcceptDetail(num);
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭
	public Email AcceptReply(int num) throws Exception{
		return emailDao.AcceptReply(num);
	}
	
	// 받은메일함 - 자세히보기 - 읽음/안읽음
	public int AcceptRead(int num) throws Exception{
		return emailDao.AcceptRead(num);
	}
	
	// 받은메일함 - 리스트 체크항목 - 읽음
	public int ListRead(int num) throws Exception{
		return emailDao.ListRead(num);
	}
	
	// 받은메일함 - 리스트 체크항목 - 읽음
	public int ListClose(int num) throws Exception{
		return emailDao.ListClose(num);
	}
	
	
	
	// 받은메일함 - 자세히보기 - 휴지통버튼 클릭
	public Email AcceptWastebasket(int num) throws Exception{
		return emailDao.AcceptWastebasket(num);
	}
	
	// 보낸메일함 - 자세히보기 - 휴지통버튼 클릭
	public int SendWastebasket(int num) throws Exception{
		return emailDao.SendWastebasket(num);
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 클릭
	public Email AcceptDelivery(int num) throws Exception{
		return emailDao.AcceptDelivery(num);
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 - 보내기버튼 클릭
	public int SendDeliverySend(Email email) throws Exception{
		return emailDao.SendDeliverySend(email);
	}
	
	// 휴지통 - 자세히보기 
	public Email WastebasketDetail(int num) throws Exception{
		return emailDao.WastebasketDetail(num);
		
	}
	
	// 휴지통 - 자세히보기 - 복구버튼 클릭
	public int WastebasketRestoration(int num) throws Exception{
		return emailDao.WastebasketRestoration(num);
	}
	
	// 휴지통 - 자세히보기 - 삭제버튼 클릭
	public int WastebasketDelete(int num) throws Exception{
		return emailDao.WastebasketDelete(num);
	}
	
	// 새메일 쓰기 - 보내기 버튼
	public int WriteSend(Email email) throws Exception{
		return emailDao.WriteSend(email);
	}
	
	// 개시물 총 갯수
	public int listCount() throws Exception{
		return emailDao.listCount();
	}

	// 리스트 - 제목클릭 - 자동읽음 처리
	public int AutoRead(int num) throws Exception{
		return emailDao.AutoRead(num);
	}
	
	// 이메일 이름 검색 기능
	public  List<Employee> selectEmpAll(Employee employee) throws Exception{
		return emailDao.selectEmpAll(employee);
	}
	
	// 받은메일함 안읽은 메일 수
	public int emailCount(String id) throws Exception{
		return emailDao.emailCount(id);
	}
	
	// 받은메일함 총 메일 수
	public int acceptCount(String id) throws Exception{
		return emailDao.acceptCount(id);
	}
	
	// 받은메일함 총 메일 수
	public int sendCount(String id) throws Exception{
		return emailDao.sendCount(id);
	}
	
	// 휴지통 메일 개수
	public int wastebasketCount(String id) throws Exception{
		return emailDao.wastebasketCount(id);
	}
	
}
