package com.wooridoori.app.board;

import org.springframework.web.multipart.MultipartFile;

public class WdboardVO {
	private int wdbpk;
	private int wdbwriter;
	private String wdbtitle;
	private String wdbcontent;
	private MultipartFile fileData;
	private String fileName;
	private int wdblike;
	private int wdbopen;
	public int getWdbpk() {
		return wdbpk;
	}
	public void setWdbpk(int wdbpk) {
		this.wdbpk = wdbpk;
	}
	public int getWdbwriter() {
		return wdbwriter;
	}
	public void setWdbwriter(int wdbwriter) {
		this.wdbwriter = wdbwriter;
	}
	public String getWdbtitle() {
		return wdbtitle;
	}
	public void setWdbtitle(String wdbtitle) {
		this.wdbtitle = wdbtitle;
	}
	public String getWdbcontent() {
		return wdbcontent;
	}
	public void setWdbcontent(String wdbcontent) {
		this.wdbcontent = wdbcontent;
	}
	public int getWdblike() {
		return wdblike;
	}
	public void setWdblike(int wdblike) {
		this.wdblike = wdblike;
	}
	public int getWdbopen() {
		return wdbopen;
	}
	public void setWdbopen(int wdbopen) {
		this.wdbopen = wdbopen;
	}
	public MultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(MultipartFile uploadFile) {
		this.fileData = uploadFile;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "WdboardVO [wdbpk=" + wdbpk + ", wdbwriter=" + wdbwriter + ", wdbtitle=" + wdbtitle + ", wdbcontent="
				+ wdbcontent + ", fileData=" + fileData + ", fileName=" + fileName + ", wdblike=" + wdblike
				+ ", wdbopen=" + wdbopen + "]";
	}

	
	
}
