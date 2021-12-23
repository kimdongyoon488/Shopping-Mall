package com.example.shopping.dao;



import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.shopping.paging.PageVO;
import com.example.shopping.vo.CategoryVO;
import com.example.shopping.vo.GoodsVO;
import com.example.shopping.vo.SearchVO;


@Mapper
public interface ICategoryMapper {
	
	//카테고리 등록
	public void insert(CategoryVO vo);
	
	//페이징 카테고리 조회
	public List<CategoryVO> list(PageVO vo);
	
	//전체 카테고리 조회
	public List<CategoryVO> allList();
	
	//전체 카테고리 수 조회
	public int countAllList();
	
	//카테고리 삭제
	public void delete(int num);
	
	//카테고리 수정
	public void update(CategoryVO vo);
	
	//특정 카테고리 조회
	public CategoryVO select(int num);

	//상품 등록
	public void insertGoods(GoodsVO vo);
	
	//전체 상품 조회
	public List<GoodsVO> goodsList();
	
	//특정 상품 조회
	public GoodsVO selectGoods(int num);
	
	//상품 수정
	public void updateGoods(GoodsVO vo);
	
	//상품 삭제
	public void deleteGoods(int num);
	
	//카테고리별 상품 조회
	public List<GoodsVO> findCategoryGoods(SearchVO vo);
	
	//이름별 상품 조회
	public List<GoodsVO> findNameGoods(SearchVO vo);
	
	
}
