package com.myspring.allCar.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.allCar.member.dao.MemberDAO;
import com.myspring.allCar.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED) // 
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDAO;
	

	@Override
	public List listMembers() throws DataAccessException {
		List membersList = null;
		membersList = memberDAO.selectAllMemberList();
		return membersList;
	}
	
	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}
	
	@Override
	public int deleteMember(MemberVO member) throws DataAccessException {
		return memberDAO.deleteMember(member);
	}
	
	@Override
	public int updateMember(MemberVO member) throws DataAccessException {
		return memberDAO.updateMember(member);
	}
	
	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	}
	
	@Override
	public String idcheck(String id) throws Exception {
		return memberDAO.checkID(id);
	}
}
