package com.example.shopping.service;

import java.util.List;

import com.example.shopping.vo.CategoryVO;

public interface ICategoryService {

	public void insert(CategoryVO vo);

	public List<CategoryVO> list();
	
	public CategoryVO select(int cnum);
	
	public void delete(int cnum);
	
	public void update(CategoryVO vo);
}
