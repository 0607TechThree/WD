package com.wooridoori.app.couple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("WdcoupleService")
public class WdcoupleServiceImpl implements WdcoupleService{
	@Autowired
	private WdcoupleDAO wdcoupleDAO;

	 
	public void insertWdcouple(WdcoupleVO vo) {
		wdcoupleDAO.insertWdcouple(vo);
	}

	 
	public void deleteWdcouple(WdcoupleVO vo) {
		wdcoupleDAO.deleteWdcouple(vo);
	}

	 
	public WdcoupleVO selectOneWdcouple(WdcoupleVO vo) {
		return wdcoupleDAO.selectOne(vo);
	}
}
