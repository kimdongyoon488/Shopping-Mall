package com.example.shopping.service;

import java.util.List;

import com.example.shopping.vo.UserVO;

public interface IUserService {

	 //회원가입
	 public void insert(UserVO vo);
	 
	 //회원탈퇴
	 public void delete(String id);
	 
	 //회원수정
	 public void update(UserVO vo);
	 
	 //특정 회원 조회
	 public UserVO getUser(String id);
	 
	 //아이디 중복확인
	 public int checkId(String id);
	 
	 //회원 전체조회
	 public List<UserVO> getAllUser();
}
