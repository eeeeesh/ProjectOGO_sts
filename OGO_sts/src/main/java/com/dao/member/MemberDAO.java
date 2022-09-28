package com.dao.member;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.member.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	SqlSessionTemplate template;

	public MemberDTO login(Map<String, String> map) {
		MemberDTO dto = template.selectOne("MemberMapper.login", map);
		return dto;
	}

	public String idCheck(String userId) {
		String n = template.selectOne("MemberMapper.idCheck", userId);
		return n;
	}

	public String nicknameCheck(String nickname) {
		String n = template.selectOne("MemberMapper.nicknameCheck", nickname);
		return n;
	}

	public int memberAdd(MemberDTO dto) {
		int n = template.insert("MemberMapper.memberAdd", dto);
		return n;
	}
}
