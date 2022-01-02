package com.example.shopping.service;

import java.util.List;

import com.example.shopping.vo.BoardVO;

public interface IBoardService {

	List<BoardVO> listBoard();

	void plusReadcount(int num);
	
	void insert(BoardVO vo);
	
	BoardVO getBoard(int num);
	
	void delete(int num); 
	
	void update(BoardVO vo);
	
	int allList();
}
