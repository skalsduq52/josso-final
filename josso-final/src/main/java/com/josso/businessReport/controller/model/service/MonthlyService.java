package com.josso.businessReport.controller.model.service;

import java.util.List;

import com.josso.businessReport.vo.MonthlyReport;
import com.josso.businessReport.vo.WeeklyReport;

public interface MonthlyService {
	
	// 전체 게시물 조회
	public List<MonthlyReport> selectList() throws Exception;
	
	// 디테일페이지
	public MonthlyReport selectDetailPage(String num) throws Exception;
	
	// 검색기능
	public List<MonthlyReport> searchBy(MonthlyReport mr) throws Exception;
	
	// 작성
	public int reportWrite(MonthlyReport mr) throws Exception;
	
	// 수정
	public int reportUpdate(MonthlyReport mr) throws Exception;
	
	// 삭제
	public int reportDelete(String num) throws Exception;
}
