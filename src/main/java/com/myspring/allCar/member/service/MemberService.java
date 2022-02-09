package com.myspring.allCar.member.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.allCar.member.vo.MemberVO;

public interface MemberService {
	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO member) throws DataAccessException;
	public int deleteMember(MemberVO member) throws DataAccessException;
	public int updateMember(MemberVO member) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	public String idcheck(String id) throws Exception;
}
