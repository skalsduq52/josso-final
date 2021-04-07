package com.josso.email.dao;

import java.util.List;
import java.util.Date;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.email.vo.EmailPaging;
import com.josso.email.vo.Email;
import com.josso.employee.vo.Employee;

@Repository
public class EmailDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	public EmailDao() {
	}
	
	// 받은(메인)메일함 메일목록
	public List<Email> AcceptList(EmailPaging page) throws Exception{
		return sqlSession.selectList("Email.AcceptList", page);
	}
	
	// 받은메일함 - 자세히보기
	public Email AcceptDetail(int num) throws Exception{
		return sqlSession.selectOne("Email.AcceptDetail", num);
	}
	
	// 휴지통 - 자세히보기
	public Email WastebasketDetail(int num) throws Exception{
		return sqlSession.selectOne("Email.AcceptDetail", num);
	}
	
	// 휴지통 - 자세히보기 - 복구버튼
	public int WastebasketRestoration(int num) throws Exception{
		return sqlSession.update("Email.AcceptWastebasket", num);
	}
	
	// 휴지통 - 자세히보기 - 삭제버튼
	public int WastebasketDelete(int num) throws Exception{
		return sqlSession.update("Email.WastebasketDelete", num);
	}
	
	// 받은메일함 - 자세히보기 - 답장버튼 클릭
	public Email AcceptReply(int num) throws Exception{
		return sqlSession.selectOne("Email.AcceptDetail", num);
	}
	
	// 참조자 정보 뽑아오기
	public Email Er(int num) throws Exception{
		return sqlSession.selectOne("Email.Er",num);
	}
	
	// 보낸사람 정보뽑아오기
	public Email Es(int num) throws Exception{
		return sqlSession.selectOne("Email.Es",num);
	}
	
	// 받는사람 정보뽑아오기
	public Email Ea(int num) throws Exception{
		return sqlSession.selectOne("Email.Ea",num);
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 클릭
	public Email AcceptDelivery(int num) throws Exception{
		return sqlSession.selectOne("Email.AcceptDetail", num);
	}
	
	// 받은메일함 - 자세히보기 - 전달버튼 - 보내기버튼 클릭
	public int SendDeliverySend(Email email) throws Exception{
		return sqlSession.insert("Email.WriteSend", email);
	}
	
	// 받은메일함 - 자세히보기 - 휴지통버튼 클릭
	public Email AcceptWastebasket(int num) throws Exception{
		return sqlSession.selectOne("Email.AcceptWastebasket", num);
	}
	
	// 보낸메일함 메일목록
	public List<Email> SendList(EmailPaging page) throws Exception{ 	// , String field, String query
		return sqlSession.selectList("Email.SendList", page);
	}
	
	// 보낸메일함 - 자세히보기 - 휴지통
	public int SendWastebasket(int num) throws Exception{
		return sqlSession.update("Email.SendWastebasket", num);
	}
	
	// 휴지통 메일목록
	public List<Email> WastebasketList(EmailPaging page) throws Exception{
		return sqlSession.selectList("Email.WastebasketList", page);
	}
	
	// 답장버튼 누를시
	public List<Email> EmailReply(int num) throws Exception{
		return sqlSession.selectList("Email.EmailReply", num);
	}
	
	// 메일쓰기에서 보내기 버튼 클릭
	public int emailWriteAction(Email email) throws Exception{
		return sqlSession.insert("Email.emailWriteAction", email);
	}
	
	// 자세히보기 읽음처리(받은메일함)
	public int AcceptRead(int num) throws Exception{
		return sqlSession.update("Email.AcceptRead", num);
	}
	
	// 리스트 체크박스 읽음처리(받은메일함)
	public int ListRead(int num) throws Exception{
		return sqlSession.update("Email.ListRead", num);
	}
	
	// 리스트 체크박스 읽음처리(받은메일함)
	public int ListClose(int num) throws Exception{
		return sqlSession.update("Email.ListClose", num);
	}
	
	// 새메일쓰기 보내기 버튼
	public int WriteSend(Email email) throws Exception{
		return sqlSession.insert("Email.WriteSend", email);
	}
	
	// 게시물 총 갯수
	public int listCount() throws Exception{
		return sqlSession.selectOne("Email.ListCount");
	}
	
	// 검색 기능
	public List<Email> EmailSearch(String word) throws Exception{
		return sqlSession.selectList("Email.EmailSearch", word);
	}
	
	// 리스트 - 제목클릭 - 자동읽음 처리
	public int AutoRead(int num) throws Exception{
		return sqlSession.update("Email.autoRead", num);
	}
	
	// 이메일 이름 검색 기능
	public List<Employee> selectEmpAll(Employee employee) throws Exception{
		return sqlSession.selectList("Employee.serachEmpName", employee);
	}
	
	// 받음메일함 안읽은 메일 수
	public int emailCount(String id) throws Exception{
		return sqlSession.selectOne("Email.emailCount", id);
	}
	
	// 받음메일함 메일 수
	public int acceptCount(String id) throws Exception{
		return sqlSession.selectOne("Email.acceptCount", id);
	}
	
	// 보낸메일함 메일 수
	public int sendCount(String id) throws Exception{
		return sqlSession.selectOne("Email.sendCount", id);
	}
	
	// 휴지통 메일 개수
	public int wastebasketCount(String id) throws Exception{
		return sqlSession.selectOne("Email.wastebasketCount", id);
	}
}
