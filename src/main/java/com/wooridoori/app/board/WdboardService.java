package com.wooridoori.app.board;

import java.util.List;

public interface WdboardService {
	void insertWdboard(WdboardVO vo);
	void deleteWdboard(WdboardVO vo);
	void updateWdboard(WdboardVO vo);
	void updateWdboardlikeU(WdboardVO vo);
	void updateWdboardlikeD(WdboardVO vo);
	WdboardVO selectOneWdboard(WdboardVO vo);
	List<WdboardVO> selectAllWdboard(WdboardVO vo);
	List<WdboardVO> selectAWdboard(WdboardVO vo);
	List<WdboardVO> selectBWdboard(WdboardVO vo);
}
