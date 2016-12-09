package com.ws.mapper;

import java.util.List;

import com.ws.common.Page;
import com.ws.model.User;

public interface UserMapper {

	void save(User user);
	boolean update(User user);
	boolean delete(int id);
	User findById(int id);
	List<User> findAll();
	int findCount();
	List<User> findPage(Page<User> page);
}
