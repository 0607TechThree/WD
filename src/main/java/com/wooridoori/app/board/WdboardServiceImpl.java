package com.wooridoori.app.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("WdboardService")
public class WdboardServiceImpl implements WdboardService{
	@Autowired
	private WdboardDAO wdboardDAO;

	public void insertWdboard(WdboardVO vo) {
		wdboardDAO.insertWdboard(vo);
	}

	public void deleteWdboard(WdboardVO vo) {
		wdboardDAO.deleteWdboard(vo);
	}

	public WdboardVO selectOneWdboard(WdboardVO vo) {
		return wdboardDAO.selectOne(vo);
	}
	public void updateWdboard(WdboardVO vo) {
		wdboardDAO.updateWdboard(vo);
	}

	public List<WdboardVO> selectAllWdboard(WdboardVO vo) {
		return wdboardDAO.selectAllBoard(vo);
	}

	public void updateWdboardlikeU(WdboardVO vo) {
		wdboardDAO.updateWdblikeU(vo);
	}

	public void updateWdboardlikeD(WdboardVO vo) {
		wdboardDAO.updateWdblikeD(vo);
	}

	public List<WdboardVO> selectAWdboard(WdboardVO vo) {
		return wdboardDAO.selectABoard(vo);
	}

	public List<WdboardVO> selectBWdboard(WdboardVO vo) {
		return wdboardDAO.selectBBoard(vo);
	}

	public Integer selectOnePk(WdboardVO vo) {
		return wdboardDAO.selectOnePk(vo);
	}
}
