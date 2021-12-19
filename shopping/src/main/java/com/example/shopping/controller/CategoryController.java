package com.example.shopping.controller;



import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.shopping.service.CategoryService;
import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;



@Controller
public class CategoryController {

	@Autowired
	CategoryService service;
	
	@GetMapping("/")
	public String home() {
		
		return "Home/home";
		
	}
	
	@GetMapping("/goodsManage")
	public String product1() {
		return "ProductManagement/goodsManage";
		
	}
	
	@GetMapping("/categoryAdd")
	public String product2() {
		return "ProductManagement/categoryAdd";
		
	}
	
	
	@PostMapping("/categoryAdd2")
	public String product3(CategoryVO vo) {
		System.out.println(vo);
		service.insert(vo);
		return "ProductManagement/goodsManage";
		
	}
	
	
	@GetMapping("/category_list")
	public String product4(Model model) {
		List<CategoryVO> list = service.list();
		System.out.println(list);
		System.out.println("==============");
		model.addAttribute("listCategory",list);
		return "ProductManagement/category_list";
	}
	
	@GetMapping("/category_edit")
	public String product5(int cnum,Model model) {
		CategoryVO vo = service.select(cnum);
		model.addAttribute("getCategory",vo);
		return "ProductManagement/category_edit";
	}
	
	@PostMapping("/category_edit2")
	public String product6(CategoryVO vo) {
		service.update(vo);
		System.out.println(vo);
		return "redirect:/category_list";
	}
	
	@GetMapping("/category_delete")
	public String product7(int cnum) {
		service.delete(cnum);
		return "redirect:/category_list";
	}
	
	@GetMapping("/goodsInput")
	public String product8(Model model) {
		List<CategoryVO> list = service.list();
		if (list == null && list.size() == 0) {
			return "redirect:/";
		}
		model.addAttribute("listCategory",list);
		return "ProductManagement/goodsInput";
	}
	
	@PostMapping("/goodsInput2")
	public String product9(HttpServletRequest req,GoodsVO vo, 
					BindingResult result) {
		if (result.hasErrors()) {
			vo.setPimage("");
		}
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("pimage");
		File target = new File("c:\\Temp\\upload",file.getOriginalFilename());
		if (file.getSize()>0) {
			try {
				file.transferTo(target);
			}catch(IOException e) {}
		vo.setPimage(file.getOriginalFilename());
		}
		vo.setPcode(req.getParameter("category_fk") + vo.getPcode());
		service.insertGoods(vo);
		return "ProductManagement/goodsManage";
	}
}
