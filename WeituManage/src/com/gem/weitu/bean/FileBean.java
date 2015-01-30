package com.gem.weitu.bean;


public class FileBean {
	private int 	id;
	private String 	filePath;				
	private String 	saveName;				
	private String 	fileName;				
	private String 	fileType;				
	private int 	fileSize;			
	private String 	fileInfo;				
	private String 	uptime;					
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}	
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getSaveName() {
		return saveName;
	}
	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	public String getFileInfo() {
		return fileInfo;
	}
	public String getFileInfoForShow() {
		return StringHandler.changehtml(fileInfo);
	}
	public void setFileInfo(String fileInfo) {
		this.fileInfo = fileInfo;
	}
	public String getUptime() {
		return uptime;
	}
	public void setUptime(String uptime) {
		this.uptime = uptime;
	}
}
