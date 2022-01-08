package com.example.shopping.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.shopping.dao.IUserMapper;
import com.example.shopping.vo.UserVO;

@Service
public class UserService implements IUserService{

	@Autowired
	IUserMapper mapper;
	
	
	@Override
	public void insert(UserVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setPassword(encoder.encode(vo.getPassword()));
		mapper.insert(vo);
		
	}

	@Override
	public void delete(String id) {
		mapper.delete(id);
		
	}

	@Override
	public void update(UserVO vo) {
		mapper.update(vo);
		
	}

	@Override
	public UserVO getUser(String id) {
	
		return mapper.getUser(id);
	}

	@Override
	public int checkId(String id) {
		
		return mapper.checkId(id);
	}
	
	@Override
	public int checkTel(String tel) {
		
		return mapper.checkTel(tel);
	}

	@Override
	public List<UserVO> getAllUser() {
		
		return mapper.getAllUser();
	}

	@Override
	public UserVO searchId(UserVO vo) {
		
		return mapper.searchId(vo);
	}

	@Override
	public void changePw(UserVO vo) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setPassword(encoder.encode(vo.getPassword()));
		mapper.changePw(vo);
	}

	

}
