package com.chenxing.userservice.service;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class MyUserDetailsService implements UserDetailsService {

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO 根据用户名，查找到对应的密码，与权限

		// 封装用户信息，并返回。参数分别是：用户名，密码，用户权限
		User user = new User(username, "123456", AuthorityUtils.commaSeparatedStringToAuthorityList("admin"));
		return user;
	}
}