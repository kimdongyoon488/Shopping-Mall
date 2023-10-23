package com.example.shopping.service;

import java.util.List;

import com.example.shopping.vo.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.shopping.dao.IMainMapper;
import com.example.shopping.paging.PageVO;


@Service
public class MainService implements IMainService{

	@Autowired
	IMainMapper mapper;

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
	public CategoryVO codeCheck(String code) {

		return mapper.codeCheck(code);
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


	@Override
	public GoodsVO countGoods(int pnum) {
		
		return mapper.countGoods(pnum);
	}



	@Override
	public void qtySub(int pnum, int qty) {
		mapper.qtySub(pnum, qty);
		
	}


	@Override
	public void order(OrderVO vo) {
		mapper.order(vo);
		
	}


	@Override
	public List<OrderVO> orderAllList(String member_id) {
		
		return mapper.orderAllList(member_id);
	}


	@Override
	public void orderDelete(int num){
		mapper.orderDelete(num);
	}


	@Override
	public int countLike(LikeVO likeVo) {
		return mapper.countLike(likeVo);
	}

	@Override
	public int likeUp(LikeVO likeVo) {
		return mapper.likeUp(likeVo);
	}

	@Override
	public int likeDown(LikeVO likeVo) {
		return mapper.likeDown(likeVo);
	}

	@Override
	public int countGoodsLike(int pnum) {
		return mapper.countGoodsLike(pnum);
	}


}
