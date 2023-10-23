package com.example.shopping.service;

import java.util.List;

import com.example.shopping.paging.PageVO;
import com.example.shopping.vo.*;

public interface IMainService {

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

		//카테고리 중복체크
		public CategoryVO codeCheck(String code);

		//상품 등록
		public void insertGoods(GoodsVO vo);
		
		//전체 상품 조회
		public List<GoodsVO> allGoodsList();
		
		//전체 상품 수 조회
		public int countAllGoods();
		
		//페이징 상품 조회
		public List<GoodsVO> goodsList(PageVO vo);
		
		//특정 상품 조회
		public GoodsVO selectGoods(int num);
		
		//상품 수정
		public void updateGoods(GoodsVO vo);
		
		//상품 삭제
		public void deleteGoods(int num);
		
		//카테고리 이름으로 상품 검색
		public List<GoodsVO> findCategoryGoods(SearchVO vo);
		
		//상품 이름으로 상품 검색
		public List<GoodsVO> findNameGoods(SearchVO vo);
		
		//스펙별 상품 조회
		public List<GoodsVO> listPspec(String pspec);
		
		//카테고리별 상품 조회
		public List<GoodsVO> listPcode(String pcode);
		
		//상품 입출고
		public void inOutput(GoodsVO vo); 
		
		//특정 상품의 상품수량 조회
		public GoodsVO countGoods(int pnum);
		
		//상품 주문 수량만큼 재고 차감
		public void qtySub(int pnum, int qty);
		
		//상품 주문하기
		public void order(OrderVO vo);
		
		//회원별 주문 리스트 전체조회
		public List<OrderVO> orderAllList(String member_id);

		// 주문 취소
		public void orderDelete(int num);

		// 상품 좋아요 클릭 여부 체크
		public int countLike(LikeVO likeVo);

		// 상품 좋아요 클릭
		public int likeUp(LikeVO likeVo);

		// 상품 좋아요 취소
		public int likeDown(LikeVO likeVo);

		// 상품 좋아요 수 조회
		public int countGoodsLike(int pnum);
		
		
}
