package com.example.shopping.service;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.shopping.dao.IBoardMapper;
import com.example.shopping.vo.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	IBoardMapper mapper;
	
	@Override
	public List<BoardVO> listBoard() {
		
		return mapper.listBoard();
	}


	@Override
	public void plusReadcount(int num) {
		mapper.plusReadcount(num);
		
	}

	@Override
	public void insert(BoardVO vo) {
		mapper.insert(vo);
		
	}

	@Override
	public BoardVO getBoard(int num) {
		
		return mapper.getBoard(num);
	}

	@Override
	public void delete(int num) {
		mapper.delete(num);
		
	}

	@Override
	public void update(BoardVO vo) {
		mapper.update(vo);
		
	}


	@Override
	public int allList() {
	
		return mapper.allList();
	}

}
