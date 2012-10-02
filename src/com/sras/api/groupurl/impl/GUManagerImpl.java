package com.sras.api.groupurl.impl;

import org.apache.log4j.Logger;

import com.sras.api.common.UserData;
import com.sras.api.groupurl.GUManager;
import com.sras.api.shorturl.impl.SUManagerImpl;

public class GUManagerImpl implements GUManager {
	@SuppressWarnings("unused")
	private static Logger logger = Logger.getLogger(SUManagerImpl.class
			.getName());
	@SuppressWarnings("unused")
	private UserData userData;

	public GUManagerImpl(UserData userData) {
		super();
		this.userData = userData;
	}
}
