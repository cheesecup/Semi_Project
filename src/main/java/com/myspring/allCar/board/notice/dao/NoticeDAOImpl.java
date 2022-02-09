package com.myspring.allCar.board.notice.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myspring.allCar.board.notice.vo.NoticeVO;
import com.myspring.allCar.board.notice.vo.SearchCriteria;


@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	private SqlSession sqlSession;
	
	//게시글 작성
	@Override
	public void write(NoticeVO noticeVO) throws Exception {

		sqlSession.insert("noticeMapper.insert", noticeVO);
		
	}
	
	//게시물 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("noticeMapper.listPage", scri);
	}

	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectOne("noticeMapper.listCount", scri);
	}
	
	//게시물 조회
	@Override
	public NoticeVO read(int bno) throws Exception {
		
		return sqlSession.selectOne("noticeMapper.read", bno);
	}
	
	//게시물 수정
	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		
		sqlSession.update("noticeMapper.update", noticeVO);
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		sqlSession.delete("noticeMapper.delete", bno);
	}
	
}
