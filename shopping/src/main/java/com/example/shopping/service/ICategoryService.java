package com.example.shopping.service;

import java.util.List;

import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;

public interface ICategoryService {

	public void insert(CategoryVO vo);

	public List<CategoryVO> list();
	
	public CategoryVO select(int cnum);
	
	public void delete(int cnum);
	
	public void update(CategoryVO vo);
	
	public void insertGoods(GoodsVO vo);
	
	public List<GoodsVO> goodsList();
	
	public GoodsVO selectGoods(int num);
	
	public void updateGoods(GoodsVO vo);
	
	public void deleteGoods(int num);
}
