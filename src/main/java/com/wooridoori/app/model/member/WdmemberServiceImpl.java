package com.wooridoori.app.model.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("WdmemberService")
public class WdmemberServiceImpl implements WdmemberService{

	@Autowired
	private WdmemberDAO2 wdmemberDAO;
	
	 
	public void insertWdmember(WdmemberVO vo) {
		wdmemberDAO.insertWdmember(vo);
	}

	 
	public void updateWdmember(WdmemberVO vo) {
		wdmemberDAO.updateWdmember(vo);
	}

	 
	public void deleteWdmember(WdmemberVO vo) {
		wdmemberDAO.deleteWdmember(vo);
	}

	 
	public WdmemberVO selectOneWdmember(WdmemberVO vo) {
		return wdmemberDAO.selectOne(vo);
	}

	 
	public WdmemberVO checkId(WdmemberVO vo) {
		return wdmemberDAO.checkId(vo);
		
	}


	public WdmemberVO selectOneC(String vo) {
		return wdmemberDAO.selectOneC(vo);
	}


	public void vipupdate(WdmemberVO vo) {
		wdmemberDAO.vipupdate(vo);
	}

}
