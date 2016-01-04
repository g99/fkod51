package com.hnb.global;

public class DatabaseFactory {
	public static Database getDatabase(Vendor vendor, String id,String pass ){
		String driver = null, url = null;
		
		switch (vendor) {
		case ORACLE:
			driver = Constants.ORACLE_DRIVER;
			url = Constants.ORACLE_URL;
			break;
		default:
			break;
		}
		
		
		return new DatabaseImpl(driver, url, id, pass);
	}
}
