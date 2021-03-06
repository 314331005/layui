package com.ws.service;

import java.util.List;

import com.ws.common.Page;
import com.ws.model.User;


public interface UserService {
	void save(User user);
	boolean update(User user);
	boolean delete(int id);
	User findById(int id);
	List<User> findAll();
	int findCount();
	Page<User> findPage(Page<User> page);
}
