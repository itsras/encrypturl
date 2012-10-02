package com.sras.api.groupurl;

import com.sras.api.common.APIFactory;
import com.sras.api.common.UserData;
import com.sras.api.groupurl.impl.GUManagerImpl;

public class GUFactory extends APIFactory {
	public GUFactory(UserData userData) {
		super(userData);
	}

	public GUManager getManager() {
		return new GUManagerImpl(userData);
	}
}
