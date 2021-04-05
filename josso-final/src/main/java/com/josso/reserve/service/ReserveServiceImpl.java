package com.josso.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.josso.reserve.dao.ReserveDao;
import com.josso.reserve.vo.Reserve;


@Service
public class ReserveServiceImpl implements ReserveService {
	
	@Autowired
	ReserveDao reserveDao;
	
	@Override	//아이템 넘버를 이용한 예약 리스트 조회
	public List<Reserve> selectReserveItem(int itemNumber) throws Exception{
		List<Reserve> reserveItem = reserveDao.selectReserveItem(itemNumber);
		return reserveItem;
	}
	
	@Override
	public List<Reserve> selectReserveUser() throws Exception{
		List<Reserve> reserveUser = reserveDao.selectReserveUser();
		return reserveUser;
	}
	
	@Override
	public List<Reserve> selectReserveUserRoom() throws Exception{
		List<Reserve> reserveUser = reserveDao.selectReserveUserRoom();
		return reserveUser;
	}
	
	@Override
	public List<Reserve> selectReserveUserCar() throws Exception{
		List<Reserve> reserveUser = reserveDao.selectReserveUserCar();
		return reserveUser;
	}
	
	@Override
	public List<Reserve> selectReserveMyUser(String employeeNumber) throws Exception{
		List<Reserve> reserveUser = reserveDao.selectReserveMyUser(employeeNumber);
		return reserveUser;
	}
	
	@Override	//예약 값 delete
	public int deleteReserve(Reserve reserve) throws Exception{
		int success = reserveDao.deleteReserve(reserve);
		return success;
	}
	
	@Override	//예약 값 insert
	public int insertReserve(Reserve reserve) throws Exception{
		int success = reserveDao.insertReserve(reserve);
		return success;
	}
	
}
