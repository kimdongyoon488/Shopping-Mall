package com.example.shopping.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.shopping.paging.PageVO;
import com.example.shopping.vo.BoardVO;
import com.example.shopping.vo.CommentVO;

@Mapper
public interface IBoardMapper {
	
	//페이징된 전체 게시글 리스트
	List<BoardVO> listBoard(PageVO vo);
	
	//조회수 증가
	void plusReadcount(int num);
	
	//게시글 등록
	void insert(BoardVO vo);
	
	//특정 게시글 조회
	BoardVO getBoard(int num);
	
	//게시글 삭제
	void delete(int num); 
	
	//게시글 수정
	void update(BoardVO vo);
	
	//전체 게시물 수
	int allList();
	
	//댓글 작성
	void insertComment(CommentVO vo);
	
	//댓글 삭제
	void deleteComment(int cno);
	
	//특정 게시물의 댓글 조회
	List<CommentVO> getComment(int bno);
	
}
