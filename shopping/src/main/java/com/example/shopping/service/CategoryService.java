package com.example.shopping.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.shopping.dao.ICategoryMapper;
import com.example.shopping.paging.PageVO;
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
	public List<CategoryVO> list(PageVO vo) {
		
		return mapper.list(vo);
	}

	@Override
	public List<CategoryVO> allList() {
		
		return mapper.allList();
	}

	@Override
	public int countAllList() {
		
		return mapper.countAllList();
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
	public CategoryVO select(int num) {
		
		return mapper.select(num);
	}


	@Override
	public void insertGoods(GoodsVO vo) {
		mapper.insertGoods(vo);
		
	}


	@Override
	public List<GoodsVO> allGoodsList() {
		return mapper.allGoodsList();
	}

	@Override
	public int countAllGoods() {
		
		return mapper.countAllGoods();
	}

	@Override
	public List<GoodsVO> goodsList(PageVO vo) {
		
		return mapper.goodsList(vo);
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


	@Override
	public List<GoodsVO> listPspec(String pspec) {
		
		return mapper.listPspec(pspec);
	}


	@Override
	public List<GoodsVO> listPcode(String pcode) {
		
		return mapper.listPcode(pcode);
	}


	@Override
	public void inOutput(GoodsVO vo) {
		mapper.inOutput(vo);
		
	}




	


	

	
	
	
}
