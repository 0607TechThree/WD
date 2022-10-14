package com.wooridoori.app.couple;

public class WdcoupleVO {
	private int wdcpk;
	private String wdcwoori;
	private String wdcdoori;
	private String wdcdate;
	public int getWdcpk() {
		return wdcpk;
	}
	public void setWdcpk(int wdcpk) {
		this.wdcpk = wdcpk;
	}
	public String getWdcwoori() {
		return wdcwoori;
	}
	public void setWdcwoori(String wdcwoori) {
		this.wdcwoori = wdcwoori;
	}
	public String getWdcdoori() {
		return wdcdoori;
	}
	public void setWdcdoori(String wdcdoori) {
		this.wdcdoori = wdcdoori;
	}
	public String getWdcdate() {
		return wdcdate;
	}
	public void setWdcdate(String wdcdate) {
		this.wdcdate = wdcdate;
	}
	@Override
	public String toString() {
		return "WdcoupleVO [wdcpk=" + wdcpk + ", wdcwoori=" + wdcwoori + ", wdcdoori=" + wdcdoori + ", wdcdate="
				+ wdcdate + "]";
	}
	
}
