package com.wooridoori.app.model.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository("wdmemberDAO")
public class WdmemberDAO2 {
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertWdmember(WdmemberVO vo) {
		mybatis.insert("MemberDAO.insertWdmember",vo);
	}
	public void updateWdmember(WdmemberVO vo) {
		mybatis.update("MemberDAO.updateWdmember",vo);
	}
	public void deleteWdmember(WdmemberVO vo) {
		mybatis.delete("MemberDAO.deleteWdmember",vo);
	}
	public WdmemberVO selectOne(WdmemberVO vo) {
		return mybatis.selectOne("MemberDAO.selectOne",vo);
	}
	public WdmemberVO checkId(WdmemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkId",vo);
	}


}
