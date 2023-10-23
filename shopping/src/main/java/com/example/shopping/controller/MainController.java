package com.example.shopping.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.example.shopping.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.shopping.paging.PageCreator;
import com.example.shopping.paging.PageVO;
import com.example.shopping.service.MainService;


@Controller
public class MainController {

	
	@Autowired
	MainService service;
	
	
	//쇼핑몰 페이지 이동
	@GetMapping("/")
	public String main(HttpServletRequest req) {
			
			List<CategoryVO> clist = service.allList();
			
			if (clist == null && clist.size() == 0) {
				req.setAttribute("msg", "아직 쇼핑몰이 준비되지 못했습니다. 관리자 페이지로 이동합니다");
				req.setAttribute("url", "/shopping/");
				return "message";
			}
			System.out.println(clist);
			
			HttpSession session = req.getSession();
			session.setAttribute("listCategory", clist);
			
			Hashtable<String, List<GoodsVO>> ht = (Hashtable)session.getAttribute("viewGoods");
			if (ht == null) ht = new Hashtable<String, List<GoodsVO>>();
			
			String[] str = new String[] {"HIT","NEW","SALE"};
			for(String s : str) {
				List<GoodsVO> list = service.listPspec(s);
				ht.put(s,list);
			}
			
		
			session.setAttribute("viewGoods",ht);
			return "display/mall";
	}
	
	//관리자 페이지 이동
	@GetMapping("/admin")
	public String home(HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO vo = (UserVO)session.getAttribute("loginAdmin");
		if(vo != null) {
			return "Home/home";
		}else {
			req.setAttribute("msg", "관리자 외엔 접근이 불가능합니다");
			req.setAttribute("url","/shopping/");
			return "message";
		}
		
		
	}
	
	//상품관리 페이지 이동
	@GetMapping("/goodsManage")
	public String product1() {
		return "ProductManagement/goodsManage";
		
	}
	
	//카테고리 등록 페이지 이동
	@GetMapping("/categoryAdd")
	public String product2() {
		return "ProductManagement/categoryAdd";
		
	}
	
	//카테고리 등록
	@PostMapping("/categoryAdd2")
	public String product3(CategoryVO vo , HttpServletRequest req) {

		CategoryVO categoryVO = service.codeCheck(vo.getCode());
		if(categoryVO != null){
			req.setAttribute("msg", "중복된 카테고리 코드가 존재합니다.");
			req.setAttribute("url","/shopping/categoryAdd");
			return "message";
		}

		System.out.println(vo);
		service.insert(vo);
		req.setAttribute("msg", "카테고리 등록이 완료되었습니다");
		req.setAttribute("url","/shopping/goodsManage");
		return "message";
		
	}
	
	
	//카테고리 목록 페이지 이동
	@GetMapping("/category_list")
	public String product4(Model model, PageVO vo) {
		List<CategoryVO> list = service.list(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setTotalCount(service.countAllList());
		System.out.println(list);
		System.out.println("==============");
		model.addAttribute("listCategory",list);
		model.addAttribute("pc", pc);
		return "ProductManagement/category_list";
	}
	
	//카테고리 수정 페이지 이동
	@GetMapping("/category_edit")
	public String product5(int cnum,Model model) {
		CategoryVO vo = service.select(cnum);
		model.addAttribute("getCategory",vo);
		return "ProductManagement/category_edit";
	}
	
	//카테고리 수정
	@PostMapping("/category_edit2")
	public String product6(CategoryVO vo , HttpServletRequest req) {
		service.update(vo);
		System.out.println(vo);
		req.setAttribute("msg", "카테고리 수정이 완료되었습니다");
		req.setAttribute("url","/shopping/category_list");
		return "message";
	}
	
	//카테고리 삭제
	@GetMapping("/category_delete")
	public String product7(int cnum , HttpServletRequest req) {
		service.delete(cnum);
		req.setAttribute("msg", "카테고리 삭제가 완료되었습니다");
		req.setAttribute("url","/shopping/category_list");
		return "message";
	}
	
	//상품 등록 페이지 이동
	@GetMapping("/goodsInput")
	public String product8(Model model) {
		List<CategoryVO> allList = service.allList();
		if (allList == null && allList.size() == 0) {
			return "redirect:/";
		}
		model.addAttribute("listCategory",allList);
		return "ProductManagement/goodsInput";
	}
	
	//상품 등록
	@PostMapping("/goodsInput2")
	public String product9(HttpServletRequest req,GoodsVO vo, 
					BindingResult result) {
		if (result.hasErrors()) {
			vo.setPimage("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("pimage");
		File target2 = new File("C:\\Users\\kdy94\\IdeaProjects\\Shopping-Mall\\shopping\\src\\main\\resources\\static\\images",file.getOriginalFilename());
		if (file.getSize()>0) {
			try {
				file.transferTo(target2);
			}catch(IOException e) {}
		vo.setPimage(file.getOriginalFilename());
		}
		vo.setPcode(req.getParameter("category_fk") + vo.getPcode());
		service.insertGoods(vo);
		req.setAttribute("msg", "상품 등록이 완료되었습니다");
		req.setAttribute("url","/shopping/goodsManage");
		return "message";
	}
	
	//상품 목록 페이지 이동
	@GetMapping("/goodsList")
	public String product10(HttpServletRequest req , PageVO vo) {
		List<GoodsVO> list = service.goodsList(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setTotalCount(service.countAllGoods());
		req.setAttribute("listProduct",list);
		req.setAttribute("pc", pc);
		return "ProductManagement/goods_list";
	}
	
	
	//상품 수정 페이지 이동
	@GetMapping("/goodsUpdate")
	public String product11(int num , Model model) {
		GoodsVO vo = service.selectGoods(num);
		model.addAttribute("getProduct", vo);
		return "ProductManagement/goods_update";
	}
	
	
	//상품 수정
	@PostMapping("/goodsUpdate2")
	public String product12(HttpServletRequest req , GoodsVO vo,
							BindingResult result) {
		if (result.hasErrors()) {
			vo.setPimage("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("pimage");
		File target = new File("C:\\Users\\kdy94\\IdeaProjects\\Shopping-Mall\\shopping\\src\\main\\resources\\static\\images", file.getOriginalFilename());
		
		//이미지를 바꾸고 수정했을때
		if (file.getSize()>0) {
			try {
				file.transferTo(target);
				vo.setPimage(file.getOriginalFilename());
			}catch(IOException e) {
				e.printStackTrace();
			}
		} 
		//이미지를 안바꾸고 수정했을때
		else {
			vo.setPimage(req.getParameter("pimage2")); 
		}
		
		System.out.println(vo.getPimage());	
		service.updateGoods(vo);
		req.setAttribute("msg", "상품 수정이 완료되었습니다");
		req.setAttribute("url","/shopping/goodsList");
		return "message";
	}
	
	//상품 삭제
	@GetMapping("/goodsDelete")
	public String product13(int pnum, String pimage, HttpServletRequest req) {
		service.deleteGoods(pnum);
		File file = new File("C:\\Users\\kdy94\\IdeaProjects\\Shopping-Mall\\shopping\\src\\main\\resources\\static\\images",pimage);
		file.delete();
		req.setAttribute("msg", "상품 삭제가 완료되었습니다");
		req.setAttribute("url","/shopping/goodsList");
		return "message";
	}
	
	//상품 검색
	@PostMapping("/goodsSearch")
	public String product14(HttpServletRequest req, SearchVO vo , PageVO vo2) {
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo2);
		pc.setTotalCount(service.countAllGoods());
		List<GoodsVO> list = null;
		if (vo.getCondition().equals("all")) {
			list = service.goodsList(vo2);
			req.setAttribute("pc", pc);
		}else {
			if (vo.getCondition().equals("cate")) {
				vo.setCondition("pcode");
				list = service.findCategoryGoods(vo);
			}else {
				vo.setCondition("pname");
				list = service.findNameGoods(vo);
			}
		}
		req.setAttribute("listProduct", list);
		return "ProductManagement/goods_list";
	}
	
	
	//카테고리별 상품들 조회
	@PostMapping("/mall_categoryList")
	public String product16(HttpServletRequest req , String code , String cname) {
		List<GoodsVO> list = service.listPcode(code);
		HttpSession session = req.getSession();
		Hashtable<String, List<GoodsVO>> ht = (Hashtable)session.getAttribute("viewGoods");
		ht.put(code, list);
		session.setAttribute("viewGoods", ht);
		req.setAttribute("cateGoods", list);
		return "display/mall_cateGoodsList";
	}
	
	//특정 상품 조회
	@GetMapping("/mall_goodsView")
	public String product17(HttpServletRequest req , String code , int pnum){
		HttpSession session = req.getSession();
		Hashtable<String, List<GoodsVO>> ht = (Hashtable)session.getAttribute("viewGoods");
		List<GoodsVO> list = ht.get(code);
		for(GoodsVO vo : list) {
			if (pnum == vo.getPnum()) {
				req.setAttribute("getProduct", vo);
				break;
			}
		}

		LikeVO likeVo = new LikeVO();
		UserVO userVo = (UserVO)session.getAttribute("login");
		likeVo.setProduct_num(pnum);
		likeVo.setMember_id(userVo.getId());

		req.setAttribute("like", service.countLike(likeVo));
		req.setAttribute("goodsLike",service.countGoodsLike(pnum));

		return"display/mall_goodsView"; 
	}
	
	//상품 입고 페이지 이동
	@GetMapping("/goods_input")
	public String product18(HttpServletRequest req , int pnum) {
		GoodsVO vo = service.selectGoods(pnum);
		req.setAttribute("getProduct", vo);
		return "ProductManagement/goods_input";
	}
	
	//상품 입고
	@PostMapping("/goods_input2")
	public String product19(HttpServletRequest req, GoodsVO vo) {
		vo.setPqty(vo.getPqty() + Integer.parseInt(req.getParameter("input")));
		service.inOutput(vo);
		return "redirect:/goodsList";
	}
	
	//상품 출고 페이지 이동
	@GetMapping("/goods_output")
	public String product20(HttpServletRequest req , int pnum) {
		GoodsVO vo = service.selectGoods(pnum);
		req.setAttribute("getProduct", vo);
		return "ProductManagement/goods_out";
	}
	
	//상품 출고
	@PostMapping("/goods_output2")
	public String product21(HttpServletRequest req, GoodsVO vo) {
		vo.setPqty(vo.getPqty() - Integer.parseInt(req.getParameter("out")));
		if (vo.getPqty() < 0) {
			req.setAttribute("msg", "현재 재고보다 많은 수가 출고되었습니다. 다시 확인해 주세요!!");
			req.setAttribute("url", "/shopping/goods_output?pnum=" + vo.getPnum());
			return "message";
		}
		service.inOutput(vo);
		return "redirect:/goodsList";
	}
	
	//장바구니에 추가
	@PostMapping("/cartAdd")
	public String product22(HttpServletRequest req , String code , String pnum , String qty) {
		HttpSession session = req.getSession();
		List<GoodsVO> cart = (List)session.getAttribute("cart");
		UserVO userVo = (UserVO)session.getAttribute("login");
		if(userVo == null) {
			req.setAttribute("msg", "로그인이 필요한 서비스입니다");
			req.setAttribute("url", "/shopping/user/login");
			return "message";
		}
		if (cart == null) {
			cart = new ArrayList<GoodsVO>();
		}
		Hashtable<String, List<GoodsVO>> ht = (Hashtable)session.getAttribute("viewGoods");
		List<GoodsVO> list = ht.get(code);
		for(GoodsVO vo : list) {
			if (Integer.parseInt(pnum) == vo.getPnum()) {
				vo.setPqty(Integer.parseInt(qty));
				cart.add(vo);
				break;
			}
		}
		session.setAttribute("cart", cart);
		return "display/mall_cartList";
	}
	
	//장바구니에서 구매 수량 수정
	@PostMapping("/cartEdit")
	public String product23(HttpServletRequest req , String index , String pqty) {
		HttpSession session = req.getSession();
		List<GoodsVO> cart = (List)session.getAttribute("cart");
		GoodsVO vo = cart.get(Integer.parseInt(index));
		vo.setPqty(Integer.parseInt(pqty));
		if (vo.getPqty() <= 0) {
			cart.remove(Integer.parseInt(index));
		}
		return "display/mall_cartList";
	}
	
	//장바구니 리스트 보여주기
	@GetMapping("/cartList")
	public String product24(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<GoodsVO> cart = (List)session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<GoodsVO>();
		}
		session.setAttribute("cart", cart);
		return "display/mall_cartList";
	}
	
	//장바구니에있는 상품 삭제
	@GetMapping("/cartDelete")
	public String product25(HttpServletRequest req , String index) {
		HttpSession session = req.getSession();
		List<GoodsVO> cart = (List)session.getAttribute("cart");
		cart.remove(Integer.parseInt(index));
		return "display/mall_cartList";
	}

	
	//즉시 주문
	@PostMapping("/directOrder")
	public String product26(String qty, String pnum, HttpServletRequest req) {
		HttpSession session = req.getSession();
		UserVO userVo = (UserVO)session.getAttribute("login");
		OrderVO orderVo = new OrderVO();
		GoodsVO goodsVo = service.countGoods(Integer.parseInt(pnum));
		GoodsVO selectGoodsVo = service.selectGoods(Integer.parseInt(pnum));
		String msg = null;
		String url = null;
		
		if(userVo == null) {
			msg="로그인이 필요한 서비스입니다";
			url="/shopping/user/login";
		}else if(Integer.parseInt(qty) == 0) {
			msg="구매할 수량이 한개 이상이어야 합니다";
			url="/shopping/";
		}else if(goodsVo.getPqty() == 0) {
			msg="상품이 매진 되었습니다";
			url="/shopping/";
		}else if(goodsVo.getPqty() >= Integer.parseInt(qty)){
			service.qtySub(Integer.parseInt(pnum), Integer.parseInt(qty));
			orderVo.setMember_id(userVo.getId());
			orderVo.setProduct_pnum(Integer.parseInt(pnum));
			orderVo.setQty(Integer.parseInt(qty));
			orderVo.setPname(selectGoodsVo.getPname());
			service.order(orderVo);
			msg="주문이 완료되었습니다";
			url="/shopping/";
		}else {
			msg="상품의 존재 수량이 주문량보다 적습니다 현재 상품 수량:" + goodsVo.getPqty();
			url="/shopping/";
		}
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
	}
	
	//장바구니에서 주문
	@GetMapping("/cartOrder")
	public String product27(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String msg = null;
		String url = null;
		List<GoodsVO> cart = (List)session.getAttribute("cart");
		UserVO userVo = (UserVO)session.getAttribute("login");
		OrderVO orderVo = new OrderVO();
		if(userVo == null) {
			msg="로그인이 필요한 서비스입니다";
			url="/shopping/user/login";
			req.setAttribute("msg", msg);
			req.setAttribute("url", url);
			return "message";
		} else { 
			for(GoodsVO cartVo : cart) {
				
			GoodsVO goodsVo = service.countGoods(cartVo.getPnum());
			System.out.println(goodsVo.getPqty());
			System.out.println(cartVo.getPqty());
			
			if(goodsVo.getPqty() == 0) {
				
				msg="매진된 상품이 존재합니다";
				url="/shopping/";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			
			 }else if(cartVo.getPqty() == 0){
				
				msg="구매할 수량이 한개 이상이어야 합니다";
				url="/shopping/";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			 }  else if(goodsVo.getPqty() < cartVo.getPqty()){
				
				msg= cartVo.getPname() + "의 존재 수량이 주문량보다 적습니다 현재 상품 수량:" + goodsVo.getPqty();
				url="/shopping/";
				req.setAttribute("msg", msg);
				req.setAttribute("url", url);
				return "message";
			 }
			}
			
			for(GoodsVO cartVo : cart) {
				GoodsVO goodsVo = service.countGoods(cartVo.getPnum());
				service.qtySub(goodsVo.getPnum(),cartVo.getPqty());
				orderVo.setMember_id(userVo.getId());
				orderVo.setProduct_pnum(cartVo.getPnum());
				orderVo.setQty(cartVo.getPqty());
				orderVo.setPname(cartVo.getPname());
				service.order(orderVo);	
			}
		}
		
		msg="주문이 완료되었습니다";
		url="/shopping/";
		req.setAttribute("msg", msg);
		req.setAttribute("url", url);
		return "message";
		
	}
	
	//마이페이지 이동
	@GetMapping("/myPage")
	public String product28(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		UserVO userVo = (UserVO)session.getAttribute("login");
		List<OrderVO> list = service.orderAllList(userVo.getId());
		model.addAttribute("orderList", list);
		return "display/mall_myPage";
	}

	// 주문 취소
	@GetMapping("/orderDelete")
	public String product29(HttpServletRequest req, int num) {
		service.orderDelete(num);
		String referer = req.getHeader("Referer");
		return "redirect:"+ referer;
	}

	// 상품 추천
	@PostMapping("/likeUp")
	@ResponseBody
	public int product30(HttpServletRequest req, @RequestBody LikeVO likeVo) {

		int result = service.likeUp(likeVo);

		return result;
	}

	// 상품 추천 취소
	@PostMapping("/likeDown")
	@ResponseBody
	public int product31(HttpServletRequest req, @RequestBody LikeVO likeVo) {

		int result = service.likeDown(likeVo);

		return result;
	}
	
	
}
