package com.universities.model;

public class Subscription 
{
	String email="";
	String twitterHandle="";
	String msg="";
	boolean isError=false;
	
	public Subscription(String email,String twitterHandle){
		this.email=email;
		this.twitterHandle=twitterHandle;
	}
	
	

	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public boolean isError() {
		return isError;
	}



	public void setError(boolean isError) {
		this.isError = isError;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTwitterHandle() {
		return twitterHandle;
	}

	public void setTwitterHandle(String twitterHandle) {
		this.twitterHandle = twitterHandle;
	}
	
	
}