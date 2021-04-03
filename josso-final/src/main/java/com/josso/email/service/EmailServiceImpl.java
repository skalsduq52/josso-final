package com.josso.email.service;

import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.email.dao.EmailDao;
import com.josso.email.vo.Email;

@Service
public class EmailServiceImpl implements EmailService{

	@Autowired
	EmailDao emailDao;
	
	// 받은메일함 - 리스트
	public List<Email> AcceptList(String id) throws Exception{
		
		List<Email> acceptList = emailDao.AcceptList(id);
		return acceptList;
	}
	
	// 보낸메일함 - 리스트
	public List<Email> SendList(String id) throws Exception{
		List<Email> sendList = emailDao.SendList(id);
		return sendList;
	}
	
	// 휴지통 - 리스트
	public List<Email> WastebasketList(String id) throws Exception{
		List<Email> wastebasketList = emailDao.WastebasketList(id);
		return wastebasketList;
	}
	
	// 답장버튼 누를시
	public List<Email> EmailReply(int number) throws Exception{
		List<Email> emailReply = emailDao.EmailReply(number);
		return emailReply;
	}
	
	// 참조자 정보 가져오기
	public Email Er(int num) throws Exception{
		Email er = emailDao.Er(num);
		return er;
	}
	
	// 보낸사람 정보 가져오기
	public Email Es(int num) throws Exception{
		Email es = emailDao.Es(num);
		return es;
	}
	
	// 받는사람 정보 가져오기
	public Email Ea(int num) throws Exception{
		Email ea = emailDao.Ea(num);
		return ea;
	}
	
	// 메일보내기
	public int emailWriteAction(Email email) throws Exception{
		int cnt = emailDao.emailWriteAction(email);
		return cnt;
	}
	
	// 자세히보기(받은 메일함)
	public Email AcceptDetail(int num) throws Exception{
		Email acceptDetail = emailDao.AcceptDetail(num);
		return acceptDetail;
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭
	public Email AcceptReply(int num) throws Exception{
		Email acceptReply = emailDao.AcceptReply(num);
		return acceptReply;
	}
	
	// 받은메일함 - 자세히보기 - 읽음/안읽음
	public int AcceptRead(int num) throws Exception{
		int cnt = emailDao.AcceptRead(num);
		return cnt;
	}
	
	// 자세히보기(제목클릭) 할 경우 자동 읽음처리
//	public int AutoRead(int num) throws Exception{
//		int cnt = emailDao.AutoRead(num);
//		return cnt;
//	}
	
	// 받은메일함 - 자세히보기 - 휴지통버튼 클릭
	public Email AcceptWastebasket(int num) throws Exception{
		Email acceptWastebasket = emailDao.AcceptWastebasket(num);
		return acceptWastebasket;
	}
	
	// 보낸메일함 - 자세히보기 - 휴지통버튼 클릭
	public int SendWastebasket(int num) throws Exception{
		int sendWastebasket = emailDao.SendWastebasket(num);
		return sendWastebasket;
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 클릭
	public Email AcceptDelivery(int num) throws Exception{
		Email acceptDelivery = emailDao.AcceptDelivery(num);
		return acceptDelivery;
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 - 보내기버튼 클릭
	public int SendDeliverySend(Email email) throws Exception{
		int sendDeliverySend = emailDao.SendDeliverySend(email);
		return sendDeliverySend;
	}
	
	// 휴지통 - 자세히보기 
	public Email WastebasketDetail(int num) throws Exception{
		Email wastebasketDetail = emailDao.WastebasketDetail(num);
		return wastebasketDetail;
		
	}
	
	// 휴지통 - 자세히보기 - 복구버튼 클릭
	public int WastebasketRestoration(int num) throws Exception{
		int wastebasketRestoration = emailDao.WastebasketRestoration(num);
		return wastebasketRestoration;
	}
	
	// 휴지통 - 자세히보기 - 삭제버튼 클릭
	public int WastebasketDelete(int num) throws Exception{
		int wastebasketDelete = emailDao.WastebasketDelete(num);
		return wastebasketDelete;
	}
	
	// 새메일 쓰기 - 보내기 버튼
	public int WriteSend(Email email) throws Exception{
		int writeSend = emailDao.WriteSend(email);
		return writeSend;
	}
	
//	// 이메일 *페이징* 목록 조회
//	public List<Email> list(Criteria cri) throws Exception{
//		System.out.println(cri);
//		return emailDao.list(cri);
//		
//	}
	// 개시물 총 갯수
	public int listCount() throws Exception{
		return emailDao.listCount();
	}
	
	// 검색기능
	public List<Email> EmailSearch(String word) throws Exception{
		List<Email> emailSearch = emailDao.EmailSearch(word);
		return emailSearch;
	}
	
	
	// 
}
