package com.josso.businessReport.controller.model.service;

import java.util.List;

import com.josso.businessReport.vo.WeeklyReport;

public interface WeeklyService {
	
	// 전체 게시물 조회
	public List<WeeklyReport> selectList() throws Exception;
	
	// 디테일페이지
	public WeeklyReport selectDetailPage(String num) throws Exception;
	
	// 검색기능
	public List<WeeklyReport> searchBy(WeeklyReport wr) throws Exception;
	
	// 작성
	public int reportWrite(WeeklyReport wr) throws Exception;
	
	// 수정
	public int reportUpdate(WeeklyReport wr, int num) throws Exception;
	
	// 삭제
	public int reportDelete(String num) throws Exception;
	
}
