package com.josso.businessReport.controller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.businessReport.controller.model.dao.WeeklyReportDAO;
import com.josso.businessReport.vo.ReportPaging;
import com.josso.businessReport.vo.WeeklyReport;

@Service
public class WeeklyServiceImpl implements WeeklyService {
	
	@Autowired
	WeeklyReportDAO weeklyreportDao;

	// 전체 게시물 조회
	@Override
	public List<WeeklyReport> selectList(ReportPaging page) throws Exception  {
		List<WeeklyReport> weeklyList = weeklyreportDao.selectList(page);
		return weeklyList;
	}
	
	@Override
	// 게시물 갯수
	public int weeklyReporCount(ReportPaging page) throws Exception {
		int count = weeklyreportDao.weeklyReporCount(page);
		return count;
	}
	
	// 디테일페이지
	@Override
	public WeeklyReport selectDetailPage(String num) throws Exception {
		WeeklyReport WeeklyReport = weeklyreportDao.selectDetailPage(num);
		return WeeklyReport;
	}
	
	// 검색기능
	@Override
	public List<WeeklyReport> searchBy(WeeklyReport wr) throws Exception {
		List<WeeklyReport> WeeklyReport = weeklyreportDao.searchBy(wr);
		return WeeklyReport;
	}
	
	// 작성
	@Override
	public int reportWrite(WeeklyReport wr) throws Exception {
		int result = weeklyreportDao.reportWrite(wr);
		return result;
	}
	
	// 수정
	@Override
	public int reportUpdate(WeeklyReport wr) throws Exception {
		int result = weeklyreportDao.reportUpdate(wr);
		return result;
	}
	
	// 삭제
	@Override
	public int reportDelete(String num) throws Exception {
		int result = weeklyreportDao.reportDelete(num);
		return result; 
	}
	
	
}
