package com.example.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.shopping.vo.BoardVO;

@Mapper
public interface IBoardMapper {
	
	List<BoardVO> listBoard();
	
	void plusReadcount(int num);
	
	void insert(BoardVO vo);
	
	BoardVO getBoard(int num);
	
	void delete(int num); 
	
	void update(BoardVO vo);
	
	int allList();
}
