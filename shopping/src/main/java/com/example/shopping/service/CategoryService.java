package com.example.shopping.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.example.shopping.dao.ICategoryMapper;
import com.example.shopping.vo.CategoryVO;


@Service
public class CategoryService implements ICategoryService{

	@Autowired
	ICategoryMapper mapper;

	@Override
	public void insert(CategoryVO vo) {
		mapper.insert(vo);		
	}
	
	
}
