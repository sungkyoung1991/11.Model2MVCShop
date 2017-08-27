package com.model2.mvc.service.domain;

import java.sql.Date;
import java.util.List;


public class Product {
	
	
	private Reply reply;
	
//	private List<Reply> reply;
	
	

	private String fileName;
	private String manuDate;
	private int price;
	private String prodDetail;
	private String prodName;
	private int prodNo;
	private Date regDate;
	private String proTranCode;
	
	public Product(){
	}
	
	
	
	public Product(String fileName, int price, String prodDetail, String prodName,
			 String proTranCode) {
		super();
		this.fileName = fileName;
		this.price = price;
		this.prodDetail = prodDetail;
		this.prodName = prodName;
		this.proTranCode = proTranCode;
		
	}
	
	public Reply getReply() {
		return reply;
	}



	public void setReply(Reply reply) {
		this.reply = reply;
	}
	
//	public List<Reply> getReply(){
//		return reply;
//	}
//	
//	public void setReply(List<Reply> reply) {
//		this.reply = reply;
//	}

	
		
	
	



	public String getProTranCode() {
		return proTranCode;
	}
	public void setProTranCode(String proTranCode) {
		this.proTranCode = proTranCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getManuDate() {
		return manuDate;
	}
	public void setManuDate(String manuDate) {
		this.manuDate = manuDate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProdDetail() {
		return prodDetail;
	}
	public void setProdDetail(String prodDetail) {
		this.prodDetail = prodDetail;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	// Override
	public String toString() {
		return "ProductVO : [fileName]" + fileName
				+ "[manuDate]" + manuDate+ "[price]" + price + "[prodDetail]" + prodDetail
				+ "[prodName]" + prodName + "[prodNo]" + prodNo + "[proTranCode]" + proTranCode + "[reply]" + reply;
	}	
}