package com.wooridoori.app.couple;

public interface WdcoupleService {
	void insertWdcouple(WdcoupleVO vo);
	void deleteWdcouple(WdcoupleVO vo);
	WdcoupleVO selectOneW(WdcoupleVO vo);
	WdcoupleVO selectOneD(WdcoupleVO vo);
}
