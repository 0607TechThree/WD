package com.wooridoori.app.like;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("WdblikeService")
public class WdblikeServiceImpl implements WdblikeService{
	@Autowired
	private WdblikeDAO wdblikeDAO;
	
	 
	public void insertWdlike(WdblikeVO vo) {
		wdblikeDAO.insertWdlike(vo);
	}

	 
	public void updateWdlike(WdblikeVO vo) {
		wdblikeDAO.updateWdlike(vo);
	}

	public WdblikeVO selectOneWdlike(WdblikeVO vo) {
		return wdblikeDAO.selectOne(vo);
	}

}
