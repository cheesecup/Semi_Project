package com.myspring.allCar.board.notice.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.allCar.board.notice.service.NoticeService;
import com.myspring.allCar.board.notice.vo.NoticeVO;
import com.myspring.allCar.board.notice.vo.PageMaker;
import com.myspring.allCar.board.notice.vo.SearchCriteria;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Inject
	NoticeService service;
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/notice/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception {
		
		logger.info("writeView");
		
	}
	
	//게시판 글 작성
	@RequestMapping(value = "/notice/write", method = RequestMethod.POST)
	public String write(NoticeVO noticeVO) throws Exception {
		
		logger.info("write");
		
		service.write(noticeVO);
		
		return "redirect:/notice/list";
		
	}
	
	//게시판 목록 조회
	@RequestMapping(value = "/notice/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		
		logger.info("list");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/board";
	}
	
	//게시판 조회
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		
		logger.info("read");
		
		model.addAttribute("read", service.read(noticeVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "notice/readView";
		
	}
	
	// 게시판 수정뷰
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("updateView");
			
		model.addAttribute("update", service.read(noticeVO.getBno()));
		model.addAttribute("scri", scri);
			
		return "notice/updateView";
		}
	
	//게시판 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		logger.info("update");
		
		service.update(noticeVO);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}
	
	//게시판 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(NoticeVO noticeVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		logger.info("delete");
		
		service.delete(noticeVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}
	
}
