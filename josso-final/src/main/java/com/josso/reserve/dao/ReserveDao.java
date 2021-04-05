package com.josso.reserve.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.josso.reserve.vo.Reserve;



@Repository
public class ReserveDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ReserveDao() {
	}
	
	//itemNumber에 따른 예약현황
	public List<Reserve> selectReserveItem(int itemNumber) throws Exception{
		List<Reserve> reserveItem = sqlSession.selectList("Reserve.selectReserveItem", itemNumber);
		return reserveItem;
	}
	//모든 유저의 room, benz, avante 조회
	public List<Reserve> selectReserveUser() throws Exception{
		List<Reserve> reserveUser = sqlSession.selectList("Reserve.selectReserveUser");
		return reserveUser;
	}
	//모든 유저의 room 조회
	public List<Reserve> selectReserveUserRoom() throws Exception{
		List<Reserve> reserveUser = sqlSession.selectList("Reserve.selectReserveUser");
		return reserveUser;
	}
	//모든 유저의 benz, avante 조회
	public List<Reserve> selectReserveUserCar() throws Exception{
		List<Reserve> reserveUser = sqlSession.selectList("Reserve.selectReserveUser");
		return reserveUser;
	}
	
	public List<Reserve> selectReserveMyUser(String employeeNumber) throws Exception{
		List<Reserve> reserveUser = sqlSession.selectList("Reserve.selectReserveMyUser", employeeNumber);
		return reserveUser;
	}
	//delete
	public int deleteReserve(Reserve reserve) throws Exception{
		int success = sqlSession.delete("Reserve.deleteReserve", reserve);
		return success;
	}
	//insert
	public int insertReserve(Reserve reserve) throws Exception{
		int success = sqlSession.insert("Reserve.insertReserve", reserve);
		return success;
	}
}
