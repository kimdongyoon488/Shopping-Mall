package com.example.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.shopping.paging.PageCreator;
import com.example.shopping.paging.PageVO;
import com.example.shopping.service.BoardService;
import com.example.shopping.vo.BoardVO;
import com.example.shopping.vo.CommentVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService service;

	//페이징 처리한 후 게시글 리스트 조회
	@GetMapping("/list")
	public String board1(HttpServletRequest req , PageVO vo) {
		List<BoardVO> list = service.listBoard(vo);
		System.out.println(list);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setTotalCount(service.allList());
		req.setAttribute("listBoard", list);
		req.setAttribute("pc", pc);
		return "board/list";
	}
	
	//게시글 작성 페이지 이동
	@GetMapping("/write")
	public String board2() {
	
		return "board/write";
	}
	
	//게시글 작성
	@PostMapping("/write")
	public ModelAndView board3(HttpServletRequest req , BoardVO vo) {
		
		service.insert(vo);
		String url="/shopping/board/list";
		String msg="게시글 등록 성공";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("url", url);
		mav.setViewName("message");
		return mav;
	}
	
	//게시글 보기
	@GetMapping("/content")
	public String board4(int num , HttpServletRequest req , Model model) {
		System.out.println(num);
		System.out.println("==============");
		service.plusReadcount(num);
		List<CommentVO> list = service.getComment(num);
		System.out.println(list);
		BoardVO vo = service.getBoard(num);
		System.out.println(vo);
		req.setAttribute("getBoard", vo);
		model.addAttribute("getComment", list);
		return "board/content";
	}
	
	//게시글 수정페이지 이동
	@GetMapping("/update")
	public String board5(int num , HttpServletRequest req) {
		BoardVO vo = service.getBoard(num);
		req.setAttribute("getBoard", vo);
		return "board/update";
	}
	
	//게시글 수정
	@PostMapping("/update")
	public String board6(BoardVO vo , HttpServletRequest req) {
		service.update(vo);
		req.setAttribute("msg", "게시글 수정 성공!! 게시글 목록페이지로 이동합니다.");
		req.setAttribute("url", "/shopping/board/list");
		return "message";
	}
	
	//게시글 삭제
	@GetMapping("/delete")
	public String board7(int num ,  HttpServletRequest req) {
		service.delete(num);
		req.setAttribute("msg", "게시글 삭제 성공!! 게시글 목록페이지로 이동합니다.");
		req.setAttribute("url", "/shopping/board/list");
		return "message";
	}
	
	//댓글 작성
	@PostMapping("/writeComment")
	public String board8(CommentVO vo , HttpServletRequest req) {
		service.insertComment(vo);
		String referer = req.getHeader("Referer"); 
		return "redirect:"+ referer;
	}
	
	//댓글 삭제
	@GetMapping("/deleteComment")
	public String board9(int cno , HttpServletRequest req) {
		service.deleteComment(cno); 
		String referer = req.getHeader("Referer"); 
		return "redirect:"+ referer;
	}
}
