package com.myspring.allCar.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.allCar.member.vo.MemberVO;

public interface MemberDAO {
		public List selectAllMemberList() throws DataAccessException;
		public int insertMember(MemberVO memberVO) throws DataAccessException;
		public int deleteMember(MemberVO memberVO) throws DataAccessException;
		public int updateMember(MemberVO memberVO) throws DataAccessException;
		public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
		public String checkID(String id) throws DataAccessException;
}
