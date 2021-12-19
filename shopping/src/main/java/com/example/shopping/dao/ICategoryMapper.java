package com.example.shopping.dao;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;


@Mapper
public interface ICategoryMapper {
	

	public void insert(CategoryVO vo);
	
	public List<CategoryVO> list();
	
	public void delete(int num);
	
	public void update(CategoryVO vo);
	
	public CategoryVO select(int num);

	public void insertGoods(GoodsVO vo);
	
	public List<GoodsVO> goodsList();
	
	public GoodsVO selectGoods();
	
}
