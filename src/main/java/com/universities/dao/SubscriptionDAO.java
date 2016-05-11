package com.universities.dao;

import com.universities.model.Subscription;

public interface SubscriptionDAO 
{
	public void insert(Subscription subs);
	public boolean findByTwitterHandle(String twitterHandle);
	public boolean findByEmail(String email);
	
}