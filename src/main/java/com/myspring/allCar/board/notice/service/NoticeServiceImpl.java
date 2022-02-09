package com.myspring.allCar.board.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myspring.allCar.board.notice.dao.NoticeDAO;
import com.myspring.allCar.board.notice.vo.NoticeVO;
import com.myspring.allCar.board.notice.vo.SearchCriteria;




@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeDAO dao;
	
	//게시글 작성
	@Override
	public void write(NoticeVO noticeVO) throws Exception {

		dao.write(noticeVO);
		
	}
	
	//게시물 목록 조회
	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}
	
	//게시물 총 갯수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}

	//게시물 조회
	@Override
	public NoticeVO read(int bno) throws Exception {
		
		return dao.read(bno);	
		
	}
	
	//게시물 수정
	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		
		dao.update(noticeVO);
	}
	
	//게시물 삭제
	@Override
	public void delete(int bno) throws Exception {
		
		dao.delete(bno);
	}
	
	
}
