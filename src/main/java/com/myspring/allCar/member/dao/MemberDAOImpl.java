package com.myspring.allCar.member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.allCar.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	// member.xml의 쿼리문을 이용해 db에 저장된 회원정보 불러오기
	@Override
	public List selectAllMemberList() throws DataAccessException {
		List<MemberVO> membersList = null;
		membersList = sqlSession.selectList("mapper.member.selectAllMemberList");
		return membersList;
	}
	
	// 회원정보 insert
	@Override
	public int insertMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.insert("mapper.member.insertMember", memberVO);
		return result;
	}
	
	// 회원탈퇴 delete
	@Override
	public int deleteMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.delete("mapper.member.deleteMember", memberVO);
		return result;
	}
	
	// 회원정보 수정
	@Override
	public int updateMember(MemberVO memberVO) throws DataAccessException {
		int result = sqlSession.update("mapper.member.updateMember", memberVO);
		return result;
	}
	
	// 로그인한 ID,PW로 회원정보 조회
	@Override
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}
	
	// 화원가입 폼의 아이디 중복체크 "true" / "falser" 문자열로 리턴
	@Override
	public String checkID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.checkID",id);
		return result;
	}
}
