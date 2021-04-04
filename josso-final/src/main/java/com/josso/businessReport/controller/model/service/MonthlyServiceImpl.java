package com.josso.businessReport.controller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.businessReport.controller.model.dao.MonthlyReportDAO;
import com.josso.businessReport.vo.MonthlyReport;
import com.josso.businessReport.vo.WeeklyReport;

@Service
public class MonthlyServiceImpl implements MonthlyService {
	
	@Autowired
	MonthlyReportDAO monthlyreportDao;

	// 전체 게시물 조회
	@Override
	public List<MonthlyReport> selectList() throws Exception  {
		List<MonthlyReport> monthlyList = monthlyreportDao.selectList();
		return monthlyList;
	}
	
	// 디테일페이지
	@Override
	public MonthlyReport selectDetailPage(String num) throws Exception {
		MonthlyReport MonthlyReport = monthlyreportDao.selectDetailPage(num);
		return MonthlyReport;
	}
	
	// 검색기능
	@Override
	public List<MonthlyReport> searchBy(MonthlyReport mr) throws Exception {
		List<MonthlyReport> MonthlyReport = monthlyreportDao.searchBy(mr);
		return MonthlyReport;
	}
	
	// 작성
	@Override
	public int reportWrite(MonthlyReport mr) throws Exception {
		int result = monthlyreportDao.reportWrite(mr);
		return result;
	}
	
	// 수정
	@Override
	public int reportUpdate(MonthlyReport mr) throws Exception {
		int result = monthlyreportDao.reportUpdate(mr);
		return result;
	}
	
	// 삭제
	@Override
	public int reportDelete(String num) throws Exception {
		int result = monthlyreportDao.reportDelete(num);
		return result; 
	}
	
	
}
