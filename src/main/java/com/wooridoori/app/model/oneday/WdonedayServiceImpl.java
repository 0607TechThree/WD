package com.wooridoori.app.model.oneday;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("wdonedayService")
public class WdonedayServiceImpl implements WdonedayService{
	
	@Autowired
	private WdonedayDAO wdonedayDAO;

	 
	public void insertWdoneday(WdonedayVO vo) {
		//wdonedayDAO.insertWdoneday(vo);		
	}

	 
	public WdonedayVO selectOneWdoneday(WdonedayVO vo) {
		return wdonedayDAO.selectOneWdoneday(vo);
	}

	 
	public List<WdonedayVO> selectAllWdoneday(WdonedayVO vo) {
		return wdonedayDAO.selectAllWdoneday(vo);
	}


	public List<WdonedayVO> selectAWdoneday(WdonedayVO vo) {
		return wdonedayDAO.selectAWdoneday(vo);
	}


	public int total(WdonedayVO vo) {
		return wdonedayDAO.total(vo);
	}


	public List<WdonedayVO> selectPGWdoneday(WdonedayVO vo, int pageNum, int amount) {
		return wdonedayDAO.selectPGWdoneday(vo,pageNum,amount);
	}
	
}
