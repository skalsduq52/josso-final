package com.josso.businessReport.controller.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.businessReport.vo.WeeklyReport;

@Repository
public class WeeklyReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 기본생성자
	public WeeklyReportDAO() {}
	
	// 전체 게시물 조회
	public List<WeeklyReport> selectList() throws Exception  {
		List<WeeklyReport> weeklyList = sqlSession.selectList("weeklyReport.selectList");
		return weeklyList;
	}
	
	// 디테일페이지
	public WeeklyReport selectDetailPage(String num) throws Exception {
		WeeklyReport WeeklyReport = sqlSession.selectOne("weeklyReport.selectDetailPage",num);
		return WeeklyReport;
	}
	
	// 검색기능
	public List<WeeklyReport> searchBy(WeeklyReport wr) throws Exception {
		List<WeeklyReport> WeeklyReport = sqlSession.selectList("weeklyReport.selectEmployeeAll");
		return WeeklyReport;
	}
	
	// 작성
	public int reportWrite(WeeklyReport wr) throws Exception {
		int result = sqlSession.insert("weeklyReport.reportWrite", wr);
		return result;
	}
	
	// 수정
	public int reportUpdate(int num) throws Exception {
		int result = sqlSession.update("weeklyReport.reportUpdate", num);
		return result;
	}
	
	// 삭제
	public int reportDelete(String num) throws Exception {
		int result = sqlSession.delete("weeklyReport.reportDelete", num);
		return result;
	}
	
}
