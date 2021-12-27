package com.example.shopping.controller;



import java.io.File;
import java.io.IOException;
import java.util.Hashtable;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.shopping.paging.PageCreator;
import com.example.shopping.paging.PageVO;
import com.example.shopping.service.CategoryService;
import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;
import com.example.shopping.vo.SearchVO;



@Controller
public class CategoryController {

	@Autowired
	CategoryService service;
	
	//관리자 페이지 이동
	@GetMapping("/")
	public String home() {
		
		return "Home/home";
		
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
	public String product3(CategoryVO vo) {
		System.out.println(vo);
		service.insert(vo);
		return "ProductManagement/goodsManage";
		
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
	public String product6(CategoryVO vo) {
		service.update(vo);
		System.out.println(vo);
		return "redirect:/category_list";
	}
	
	//카테고리 삭제
	@GetMapping("/category_delete")
	public String product7(int cnum) {
		service.delete(cnum);
		return "redirect:/category_list";
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
		//File target = new File("c:\\Temp\\upload",file.getOriginalFilename());
		File target2 = new File("C:\\Users\\김동윤\\git\\repository2\\shopping\\src\\main\\resources\\static\\images",file.getOriginalFilename());
		if (file.getSize()>0) {
			try {
				//file.transferTo(target);
				file.transferTo(target2);
			}catch(IOException e) {}
		vo.setPimage(file.getOriginalFilename());
		}
		vo.setPcode(req.getParameter("category_fk") + vo.getPcode());
		service.insertGoods(vo);
		return "ProductManagement/goodsManage";
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
		File target = new File("C:\\Users\\김동윤\\git\\repository2\\shopping\\src\\main\\resources\\static\\images", file.getOriginalFilename());
		
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
		return "redirect:/goodsList";
	}
	
	//상품 삭제
	@GetMapping("/goodsDelete")
	public String product13(int pnum,String pimage) {
		service.deleteGoods(pnum);
		File file = new File("C:\\Users\\김동윤\\git\\repository2\\shopping\\src\\main\\resources\\static\\images",pimage);
		file.delete();
		return "redirect:/goodsList";
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
	
	@GetMapping("/mall")
	public String product15(HttpServletRequest req) {
		
		List<CategoryVO> clist = service.allList();
		
		if (clist == null && clist.size() == 0) {
			req.setAttribute("msg", "아직 쇼핑몰이 준비되지 못했습니다. main페이지로 이동합니다");
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
		return"display/mall_goodsView"; 
	}
	
	@GetMapping("/goods_input")
	public String product18(HttpServletRequest req , int pnum) {
		GoodsVO vo = service.selectGoods(pnum);
		req.setAttribute("getProduct", vo);
		return "ProductManagement/goods_input";
	}
	
	@PostMapping("/goods_input2")
	public String product19(HttpServletRequest req, GoodsVO vo) {
		vo.setPqty(vo.getPqty() + Integer.parseInt(req.getParameter("input")));
		service.inOutput(vo);
		return "redirect:/goodsList";
	}
	
	@GetMapping("/goods_output")
	public String product20(int pnum) {
		return "";
	}
	
	@PostMapping("/goods_output2")
	public String product21(int pnum) {
		return "";
	}
}
