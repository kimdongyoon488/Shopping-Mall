package com.example.shopping.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.shopping.paging.PageCreator;
import com.example.shopping.paging.PageVO;
import com.example.shopping.service.UserService;
import com.example.shopping.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {
	
		@Autowired
		UserService service;
		
		//로그인 페이지 이동
		@GetMapping("/login")
		public String user1() {
			return "display/mall_login";
		}
		
		
		//로그인
		@PostMapping("/login")
		public String login(UserVO input , HttpSession session , HttpServletRequest req, 
					HttpServletResponse response, String saveId) {
			System.out.println(saveId);
			UserVO vo = service.getUser(input.getId());
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			if(vo != null) {
				if(encoder.matches(input.getPassword(),vo.getPassword())) {
					
					//로그인 한사람이 일반유저 일때
					if(vo.getPermission().equals("user")) {
						Cookie cookie = new Cookie("saveId",vo.getId());
						if(saveId != null) {
							//아이디 기억 일주일간 유지
							cookie.setMaxAge(60 * 60 * 24 * 7);
						}else {
							cookie.setMaxAge(0);
						}
						response.addCookie(cookie);
						session.setAttribute("login", vo);
						req.setAttribute("msg", "로그인 성공");
						req.setAttribute("url", "/shopping/");
						return "message"; 
					} 
					//로그인 한사람이 관리자 일때
					else {
						session.setAttribute("loginAdmin", vo);
						req.setAttribute("msg", "관리자 로그인 성공");
						req.setAttribute("url","/shopping/admin");
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

		//회원가입 페이지 이동
		@GetMapping("/loginSign")
		public String user2() {
			return "display/mall_login_sign";
		}
		
		
		//회원가입
		@PostMapping("/loginSign")
		public String user3(UserVO vo , HttpServletRequest req) {
			int id = service.checkId(vo.getId());
			int tel = service.checkTel(vo.getTel());
			if(id == 0 && tel == 0) {
				service.insert(vo);
				req.setAttribute("msg", "회원가입 완료");
				req.setAttribute("url", "/shopping/user/login");
			} else if(id > 0) {
				req.setAttribute("msg", "중복된 아이디가 존재합니다 다시 입력해주세요");
				req.setAttribute("url", "/shopping/user/loginSign");
			} else {
				req.setAttribute("msg", "같은 전화번호의 계정이 존재합니다");
				req.setAttribute("url", "/shopping/user/loginSign");
			}
			return "message";
		}
		
		
		//회원탈퇴
		@GetMapping("/delete")
		public String delete(String id , HttpServletRequest req) {
			service.delete(id);
			req.setAttribute("msg","삭제가 완료되었습니다");
			req.setAttribute("url","/shopping/user/list");
			return "message";
		}
		
		//회원 관리 페이지에서 아이디로 회원찾기
		@PostMapping("/search")
		public String search(String id , HttpServletRequest req){
			List<UserVO> list = service.searchUser(id);
			req.setAttribute("listUser", list);
			return "ProductManagement/user_list";
		}
		
		//회원관리 페이지 리스트 조회
		@GetMapping("/list")
		public String list(PageVO vo , HttpServletRequest req) {
			List<UserVO> list = service.getAllUser(vo);
			System.out.println("========================");
			PageCreator pc = new PageCreator();
			pc.setPaging(vo);
			pc.setTotalCount(service.userCnt());
			req.setAttribute("listUser", list);
			req.setAttribute("pc", pc);
			return "ProductManagement/user_list";
		}
		
		
		//로그아웃
		@GetMapping("/logout")
		public String logout(HttpSession session , HttpServletRequest req) {
			UserVO vo = (UserVO)session.getAttribute("login");
			if(vo!=null) {
				session.removeAttribute("login");
				session.invalidate();
				req.setAttribute("msg", "로그아웃 완료");
				req.setAttribute("url", "/shopping/");
				return "message";
			}
			else {
				req.setAttribute("msg", "로그아웃 실패");
				req.setAttribute("url", "/shopping/");
				return "message";
			}
		}

		//아이디 찾기 페이지 이동
		@GetMapping("/searchId")
		public String searchId() {
			return "display/mall_login_searchId";
		}
		
		//아이디 찾기
		@PostMapping("/searchId")
		public String searchId2(UserVO vo , HttpServletRequest req) {
			
			String msg = null, url = null;
			System.out.println(vo);
			UserVO user = service.searchId(vo);
			System.out.println(user);
			if(user != null) {
				msg = "아이디 : " + user.getId();
				url = "/shopping/user/login";
			} else {
				msg = "존재하지 않는 회원입니다 다시 입력해주세요";
				url = "/shopping/user/login";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		//비밀번호 찾기 페이지 이동
		@GetMapping("/searchPw")
		public String searchPw() {
			return "display/mall_login_searchPw";
		}
		
		//비밀번호 찾기
		@PostMapping("/searchPw")
		public String searchPw2(UserVO vo, HttpServletRequest req) {
			String msg = null, url = null;
			System.out.println(vo);
			UserVO user = service.searchId(vo);
			if(user != null) {
				service.changePw(vo);
				msg = "비밀번호가 변경되었습니다";
				url = "/shopping/user/login";
			} else {
				msg = "존재하지 않는 회원입니다 다시 입력해주세요";
				url = "/shopping/user/login";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		}
		
		//회원 수정 페이지 이동
		@GetMapping("/update")
		public String updateUser() {
			return "display/mall_user_update";
		}
		
		//회원 수정
		@PostMapping("/update")
		public String updateUser2(UserVO vo ,  HttpServletRequest req) {
			service.update(vo);
			HttpSession session = req.getSession();
			UserVO login = (UserVO)session.getAttribute("login");
			login.setAge(vo.getAge());
			login.setName(vo.getName());
			session.setAttribute("login",login);
			req.setAttribute("msg","회원 정보 수정이 완료되었습니다");
			req.setAttribute("url", "/shopping/myPage");
			return "message";
		}
		
	
}
