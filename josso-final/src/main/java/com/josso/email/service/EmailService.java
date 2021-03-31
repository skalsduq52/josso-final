package com.josso.email.service;

import java.util.List;

import com.josso.email.vo.Email;

public interface EmailService {

	// 받은메일함 - 리스트
	public List<com.josso.email.vo.Email> AcceptList(String id) throws Exception;

	// 보낸메일함 - 리스트
	public List<Email> SendList(String id) throws Exception;

	// 휴지통 - 리스트
	public List<Email> WastebasketList(String id) throws Exception;

	// 답장버튼 누를시(?)
	public List<Email> EmailReply(int number) throws Exception;

	// 받은메일함 - 자세히보기
	public Email AcceptDetail(int num) throws Exception;

	// 받은메일함 - 자세히보기 - 답장 버튼 클릭
	public Email AcceptReply(int num) throws Exception;

	// 받은메일함 - 자세히보기 - 읽음/안읽음
	public int AcceptRead(int num) throws Exception;

	// 받은메일함 - 자세히보기 - 휴지통버튼
	public Email AcceptWastebasket(int num) throws Exception;

	// 휴지통 - 자세히보기
	public Email WastebasketDetail(int num) throws Exception;
	
	// 휴지통 - 자세히보기 - 복구버튼
	public int WastebasketRestoration(int num) throws Exception;
	
	// 받은메일함 - 자세히보기 - 전달버튼
	public Email AcceptDelivery(int num) throws Exception;
	
	// 보낸메일함 - 자세히보기 - 휴지통버튼
	public int SendWastebasket(int num) throws Exception;
	
	// 새메일쓰기 - 보내기 버튼
	public int WriteSend(Email email) throws Exception;
	
	// 휴지통 - 자세히보기 - 삭제버튼 클릭
	public int WastebasketDelete(int num) throws Exception;
	
	// 이메일 *페이징* 목록 조회
//	public List<Email> list(Criteria cri) throws Exception;
	
	// 게시물 총 갯수
	public int listCount() throws Exception;
	
	// 검색기능
	public List<Email> EmailSearch(String word) throws Exception;
	
	
	
}