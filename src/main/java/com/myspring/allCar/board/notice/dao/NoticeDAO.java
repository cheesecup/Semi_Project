package com.myspring.allCar.board.notice.dao;

import java.util.List;

import com.myspring.allCar.board.notice.vo.NoticeVO;
import com.myspring.allCar.board.notice.vo.SearchCriteria;


public interface NoticeDAO {

	//게시글 작성
	public void write(NoticeVO noticeVO) throws Exception;
	
	//게시물 목록 조회
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
	
	//게시물 총 갯수
	public int listCount(SearchCriteria scri) throws Exception;
	
	//게시물 조회
	public NoticeVO read(int bno) throws Exception;
	
	//게시물 수정
	public void update(NoticeVO noticeVO) throws Exception;
	
	//게시물 삭제
	public void delete(int bno) throws Exception;
}
