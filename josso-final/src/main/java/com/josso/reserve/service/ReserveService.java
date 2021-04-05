package com.josso.reserve.service;

import java.util.List;
import java.util.Map;

import com.josso.reserve.vo.Reserve;


public interface ReserveService{
	
	public List<Reserve> selectReserveItem(int itemNumber) throws Exception;
	
	public List<Reserve> selectReserveUser() throws Exception;
	
	public List<Reserve> selectReserveUserRoom() throws Exception;
	
	public List<Reserve> selectReserveUserCar() throws Exception;
	
	public List<Reserve> selectReserveMyUser(String employeeNumber) throws Exception;
	
	public int deleteReserve(Reserve reserve) throws Exception;
	
	public int insertReserve(Reserve reserve) throws Exception;
}
