package com.myspring.allCar.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.allCar.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("member") MemberVO member, 
									HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity idcheck(@RequestParam("id") String id,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(MemberVO member, RedirectAttributes rAttr, HttpServletRequest request,
								HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView deleteMember(@ModelAttribute("member") MemberVO member,
								HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView updateMember(@ModelAttribute("member") MemberVO member,
			HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView main(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mypage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
