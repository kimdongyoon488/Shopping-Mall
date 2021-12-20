package com.example.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.shopping.dao.ICategoryMapper;
import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;
import com.example.shopping.vo.SearchVO;


@Service
public class CategoryService implements ICategoryService{

	@Autowired
	ICategoryMapper mapper;

	@Override
	public void insert(CategoryVO vo) {
		mapper.insert(vo);		
	}

	
	@Override
	public List<CategoryVO> list() {
		
		return mapper.list();
	}


	@Override
	public CategoryVO select(int num) {
		
		return mapper.select(num);
	}


	@Override
	public void delete(int num) {
		mapper.delete(num);
		
	}


	@Override
	public void update(CategoryVO vo) {
		mapper.update(vo);
		
	}


	@Override
	public void insertGoods(GoodsVO vo) {
		mapper.insertGoods(vo);
		
	}


	@Override
	public List<GoodsVO> goodsList() {
		return mapper.goodsList();
	}


	@Override
	public GoodsVO selectGoods(int num) {
		
		return mapper.selectGoods(num);
	}


	@Override
	public void updateGoods(GoodsVO vo) {
		mapper.updateGoods(vo);
		
	}


	@Override
	public void deleteGoods(int num) {
		
		mapper.deleteGoods(num);
	}


	@Override
	public List<GoodsVO> findCategoryGoods(SearchVO vo) {
		
		return mapper.findCategoryGoods(vo);
	}


	@Override
	public List<GoodsVO> findNameGoods(SearchVO vo) {
		
		return mapper.findNameGoods(vo);
	}
	
	
}
