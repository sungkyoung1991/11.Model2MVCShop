package com.model2.mvc.service.domain;

import java.util.List;

public class Reply{
	
	private List<String> reply;
	
	private int prodNo;
	
	private String userId;


		public List<String> getReply() {
			// TODO Auto-generated method stub
			return reply;
		}
		public void setReply(List<String> reply) {
			this.reply = reply;
		}
		
		public int getProdNo() {
			return prodNo;
		}
		public void setProdNo(int prodNo) {
			this.prodNo = prodNo;
		}
		
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		@Override
		public String toString() {
			return "Reply [reply=" + reply + ", prodNo=" + prodNo + ", userId=" + userId + "]";
		}
		
		
	
		
}	

		
		
		
		
		
		
