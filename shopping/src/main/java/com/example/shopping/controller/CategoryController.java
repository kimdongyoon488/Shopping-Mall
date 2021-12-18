package com.example.shopping.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.shopping.service.CategoryService;
import com.example.shopping.vo.CategoryVO;



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
	

}
