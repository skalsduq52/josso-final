package com.josso.email.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.email.vo.Email;


@Repository
public class EmailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EmailDao() {
		
	}
	
	// 받은(메인)메일함 메일목록
	public List<Email> AcceptList(String id) throws Exception{
		List<Email> acceptList = sqlSession.selectList("Email.AcceptList", id);
		return acceptList;
	}
	
	// 받은메일함 - 자세히보기
	public Email AcceptDetail(int num) throws Exception{
		Email acceptDetail = sqlSession.selectOne("Email.AcceptDetail", num);
		return acceptDetail;
	}
	
	// 휴지통 - 자세히보기
	public Email WastebasketDetail(int num) throws Exception{
		Email wastebasketDetail = sqlSession.selectOne("Email.AcceptDetail", num);
		return wastebasketDetail;
	}
	
	// 휴지통 - 자세히보기 - 복구버튼
	public int WastebasketRestoration(int num) throws Exception{
		int wastebasketRestoration = sqlSession.update("Email.AcceptWastebasket", num);
		return wastebasketRestoration;
	}
	
	// 휴지통 - 자세히보기 - 삭제버튼
	public int WastebasketDelete(int num) throws Exception{
		int wastebasketDelete = sqlSession.update("Email.WastebasketDelete", num);
		return wastebasketDelete;
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭
	public Email AcceptReply(int num) throws Exception{
		Email acceptReply = sqlSession.selectOne("Email.AcceptDetail", num);
		return acceptReply;
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 클릭
	public Email AcceptDelivery(int num) throws Exception{
		Email acceptDelivery = sqlSession.selectOne("Email.AcceptDetail", num);
		return acceptDelivery;
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 - 보내기버튼 클릭
	public int SendDeliverySend(Email email) throws Exception{
		int sendDeliverySend = sqlSession.insert("Email.WriteSend", email);
		return sendDeliverySend;
	}
	
	// 받은메일함 - 자세히보기 - 휴지통버튼 클릭
	public Email AcceptWastebasket(int num) throws Exception{
		Email acceptWastebasket = sqlSession.selectOne("Email.AcceptWastebasket", num);
		return acceptWastebasket;
	}
	
	// 보낸메일함 메일목록
	public List<Email> SendList(String id) throws Exception{
		List<Email> sendList = sqlSession.selectList("Email.SendList", id);
		return sendList;
	}
	
	// 보낸메일함 - 자세히보기 - 휴지통
	public int SendWastebasket(int num) throws Exception{
		int sendWastebasket = sqlSession.update("Email.SendWastebasket", num);
		return sendWastebasket;
	}
	
	// 휴지통 메일목록
	public List<Email> WastebasketList(String id) throws Exception{
		List<Email> wastebasketList = sqlSession.selectList("Email.WastebasketList", id);
		return wastebasketList;
	}
	
	// 답장버튼 누를시
	public List<Email> EmailReply(int number) throws Exception{
		List<Email> emailReply = sqlSession.selectList("Email.EmailReply", number);
		return emailReply;
	}
	
	// 메일쓰기에서 보내기 버튼 클릭
	public int emailWriteAction(Email email) throws Exception{
		int cnt = sqlSession.insert("Email.emailWriteAction", email);
		return cnt;
	}
	
	// 자세히보기 읽음처리(받은메일함)
	public int AcceptRead(int num) throws Exception{
		int cnt = sqlSession.update("Email.AcceptRead", num);
		return cnt;
	}
	
	// 자세히보기(제목클릭) 할 경우 자동 읽음처리
//	public int AutoRead(int num)throws Exception{
//		int cnt = sqlSession.update("Email.AutoRead", num);
//		return cnt;
//	}
	
	// 새메일쓰기 보내기 버튼
	public int WriteSend(Email email) throws Exception{
		int writeSend = sqlSession.insert("Email.WriteSend", email);
		return writeSend;
	}
	
//	// 이메일 *페이징* 목록 조회
//	public List<Email> list(Criteria cri) throws Exception{
//		return sqlSession.selectList("Email.ListPage", cri);
//	}
	// 게시물 총 갯수
	public int listCount() throws Exception{
		return sqlSession.selectOne("Email.ListCount");
	}
	
	// 검색 기능
	public List<Email> EmailSearch(String word) throws Exception{
		System.out.println("다오"+word);
		List<Email> emailSearch = sqlSession.selectList("Email.EmailSearch", word);
		return emailSearch;
		
	}
}
