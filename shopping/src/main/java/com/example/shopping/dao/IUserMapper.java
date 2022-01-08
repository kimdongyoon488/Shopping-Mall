package com.example.shopping.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.shopping.vo.UserVO;

@Mapper
public interface IUserMapper {

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
	 
	 //전화번호 중복확인
	 public int checkTel(String tel);
	 
	 //회원 전체조회
	 public List<UserVO> getAllUser();
	 
	 //아이디 찾기
	 public UserVO searchId(UserVO vo);
	 
	 //비밀번호 변경
	 public void changePw(UserVO vo);
}
