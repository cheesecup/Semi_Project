package com.myspring.allCar.qna.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myspring.allCar.qna.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired 
	BoardService boardService;
	
	//게시글 리스트 조회
	@RequestMapping(value = "/board/list")
	public String boardList(@RequestParam Map<String, Object> paramMap, Model model) {
		
		//조회하려는 페이지
		int startPage = (paramMap.get("startPage") != null?Integer.parseInt(paramMap.get("startPage").toString()):1);
		//한 페이지에 보여줄 리스트 수
		int visiblePages = (paramMap.get("visiblePage") != null?Integer.parseInt(paramMap.get("visiblePages").toString()):10);
		//일단 전체 건수를 가져온다.
		int totalCnt = boardService.getContentCnt(paramMap);
		
		BigDecimal decimal1 = new BigDecimal(totalCnt);
		BigDecimal decimal2 = new BigDecimal(visiblePages);
		BigDecimal totalPage = decimal1.divide(decimal2, 0, BigDecimal.ROUND_UP);
		
		int startLimitPage = 0;
		
		if(startPage == 1) {
			startLimitPage = 0;
		}else {
			startLimitPage = (startPage-1)*visiblePages;
		}
		
		paramMap.put("start", startLimitPage);
		
		paramMap.put("end", startLimitPage+visiblePages);
		
		//jsp에서 보여줄 정보 추출
		model.addAttribute("startPage", startPage+""); //현재 페이지
		model.addAttribute("totalCnt", totalCnt); //전체 게시물 수 
		model.addAttribute("totalPage", totalPage); //페이지 네비게이션에 보여줄 리스트 수
		model.addAttribute("boardList", boardService.getContentList(paramMap)); //검색
		
		return "/allBoard/qna/boardList";
	}
	
	//게시글 상세 보기
    @RequestMapping(value = "/board/view")
    public String boardView(@RequestParam Map<String, Object> paramMap, Model model) {
 
        model.addAttribute("replyList", boardService.getReplyList(paramMap));
        model.addAttribute("boardView", boardService.getContentView(paramMap));
 
        return "/allBoard/qna/boardView";
 
    }
	
	//게시글 등록 및 수정
	@RequestMapping(value = "/board/edit")
	public String boardEdit(HttpServletRequest request, @RequestParam Map<String, Object> paramMap, Model model) {
		
		String Referer = request.getHeader("referer");
		
		if(Referer != null) {
			if(paramMap.get("id") != null) {
				if(Referer.indexOf("/board/view")>-1) {
					model.addAttribute("boardView", boardService.getContentView(paramMap));
					return "/allBoard/qna/boardEdit";
				}else {
					return "redirect:/board/list";
				}
			}else {
				if(Referer.indexOf("/board/list")>-1) {
					return "/allBoard/qna/boardEdit";
				}else {
					return "redirect:/board/list";
				}
			}
		}else {
			return "redirect:/board/list";
		}
	}
	
	//Ajax 호풀 (게시글 등록, 수정)
	@RequestMapping(value = "/board/save", method=RequestMethod.POST)
	@ResponseBody
	public Object boardSave(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);
		
		//정보 입력
		int result = boardService.regContent(paramMap);
		
		if(result>0) {
			retVal.put("code", "OK");
			retVal.put("message", "등록에 성공 하셨습니다.");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}
		return retVal;
	}
	
	//Ajax 호풀 (게시글 삭제)
	@RequestMapping(value="/board/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardDel(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);
		
		//정보입력
		int result = boardService.delBoard(paramMap);
		
		if(result>0) {
			retVal.put("code", "OK");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "패스워드를 확인해주세요.");
		}
		return retVal;
	}
	
	//Ajax 호풀 (게시글 패스워드 확인)
	@RequestMapping(value = "/board/check", method=RequestMethod.POST)
	@ResponseBody
	public Object boardCheck(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("password").toString(), null);
		paramMap.put("password", password);
		
		//정보입력
	    int result = boardService.getBoardCheck(paramMap);
	    
	    if(result>0) {
	    	retVal.put("code", "OK");
	    }else {
	    	retVal.put("code", "FAIL");
	    	retVal.put("message", "패스워드를 확인해주세요.");
	    }
	    return retVal;		
	}
	
	//Ajax 호풀 (댓글 등록)
	@RequestMapping(value = "/board/reply/save", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);
		
		//정보입력
		int result = boardService.regReply(paramMap);
		
		if(result>0) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("parent_id", paramMap.get("parent_id"));
			retVal.put("message", "등록에 성공 하였습니다.");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "등록에 실패 하였습니다.");
		}
		return retVal;
	}
	
	//Ajax 호출 (댓글 삭제)
	@RequestMapping(value = "/board/reply/del", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyDel(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);
		
		//정보입력
		int result = boardService.delReply(paramMap);
		
		if(result>0) {
			retVal.put("code", "OK");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "삭제에 실패했습니다. 패스워드를 확인해주세요.");
		}
		return retVal;
	}
	
	//Ajax 호풀 (댓글 패스워드 확인)
	@RequestMapping(value = "/board/reply/check", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyCheck(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);
		
		//정보입력
		boolean check = boardService.checkReply(paramMap);
		
		if(check) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "패스워드를 확인해 주세요.");
		}
		return retVal;
	}
	
	//Ajax 호출 (댓글 수정)
	@RequestMapping(value = "/board/reply/update", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplyUpdate(@RequestParam Map<String, Object> paramMap) {
		
		//리턴값
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//패스워드 암호화
		ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
		String password = encoder.encodePassword(paramMap.get("reply_password").toString(), null);
		paramMap.put("reply_password", password);
		
		//정보입력
		boolean check = boardService.updateReply(paramMap);
		
		if(check) {
			retVal.put("code", "OK");
			retVal.put("reply_id", paramMap.get("reply_id"));
			retVal.put("message", "수정에 성공 하였습니다.");
		}else {
			retVal.put("code", "FAIL");
			retVal.put("message", "수정에 실패 하였습니다.");
		}
		return retVal;
	}

} 