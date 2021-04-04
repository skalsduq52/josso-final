package com.josso.businessReport.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.businessReport.vo.MonthlyReport;

@Repository
public class MonthlyReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 기본생성자
	public MonthlyReportDAO() {}
	
	// 전체 게시물 조회
	public List<MonthlyReport> selectList() throws Exception  {
		List<MonthlyReport> monthlyList = sqlSession.selectList("monthlyReport.selectList");
		return monthlyList;
	}
	
	// 디테일페이지
	public MonthlyReport selectDetailPage(String num) throws Exception {
		MonthlyReport MonthlyReport = sqlSession.selectOne("monthlyReport.selectDetailPage",num);
		return MonthlyReport;
	}
	
	// 검색기능
	public List<MonthlyReport> searchBy(MonthlyReport mr) throws Exception {
		List<MonthlyReport> MonthlyReport = sqlSession.selectList("monthlyReport.selectEmployeeAll");
		return MonthlyReport;
	}
	
	// 작성
	public int reportWrite(MonthlyReport mr) throws Exception {
		int result = sqlSession.insert("monthlyReport.reportWrite", mr);
		return result;
	}
	
	// 수정
	public int reportUpdate(MonthlyReport mr) throws Exception {
		int result = sqlSession.update("monthlyReport.reportUpdate", mr);
		return result;
	}
	
	// 삭제
	public int reportDelete(String num) throws Exception {
		int result = sqlSession.delete("monthlyReport.reportDelete", num);
		return result;
	}
	
	
}
