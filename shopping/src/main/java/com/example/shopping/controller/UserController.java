package com.example.shopping.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.shopping.service.UserService;
import com.example.shopping.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
		@Autowired
		UserService service;
		
		@GetMapping("/login")
		public String user1() {
			return "display/mall_login";
		}
		
		
		//로그인
		@PostMapping("/login")
		public String login(UserVO input , HttpSession session , HttpServletRequest req) {
			System.out.println(input);
			UserVO vo = service.getUser(input.getId());
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(vo != null) {
				if(encoder.matches(input.getPassword(),vo.getPassword())) {
					session.setAttribute("login", vo);
					//로그인 한사람이 일반유저 일때
					if(vo.getPermission().equals("user")) {
						req.setAttribute("msg", "로그인 성공");
						req.setAttribute("url", "/shopping/mall");
						return "message"; 
					} 
					//로그인 한사람이 관리자 일때
					else {
						req.setAttribute("msg", "관리자 로그인 성공");
						req.setAttribute("url","/shopping/");
						return "message";
					}
				}else {
					req.setAttribute("msg", "비밀번호가 틀렸습니다");
					req.setAttribute("url", "/shopping/user/login");
					return "message";
				}
			}else {
				req.setAttribute("msg", "아이디가 틀렸습니다");
				req.setAttribute("url", "/shopping/user/login");
				return "message";
			}
		}

		@GetMapping("/loginSign")
		public String user2() {
			return "display/mall_login_sign";
		}
		
		
		@PostMapping("/loginSign")
		public String user3(UserVO vo , HttpServletRequest req) {
			service.insert(vo);
			req.setAttribute("msg", "회원가입 완료");
			req.setAttribute("url", "/shopping/user/login");
			return "message";
		}
		
		/*
		//회원탈퇴
		@GetMapping("")
		public String delete(String id) {
			service.delete(id);
			return "deleteSuccess";
		}*/
		
		/*
		//회원조회
		@GetMapping("")
		public UserVO select(String id) {
			System.out.println("========================");
			System.out.println(id);
			UserVO vo = service.getUser(id);
			System.out.println(vo);
			return vo;
		}
		*/
		
		//로그아웃
		@GetMapping("/logout")
		public String logout(HttpSession session , HttpServletRequest req) {
			UserVO vo = (UserVO)session.getAttribute("login");
			if(vo!=null) {
				session.removeAttribute("login");
				session.invalidate();
				req.setAttribute("msg", "로그아웃 완료");
				req.setAttribute("url", "/shopping/mall");
				return "message";
			}
			else {
				req.setAttribute("msg", "로그아웃 실패");
				req.setAttribute("url", "/shopping/mall");
				return "message";
			}
		}
}
