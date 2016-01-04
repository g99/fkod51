package com.hnb.global;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcTest {
	public static void main(String[] args) {
		Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
          /*  Class.forName(Constants.HSQL_DRIVER);
            conn = DriverManager.getConnection(
					Constants.HSQL_URL,
					Constants.HSQL_ID,
					Constants.HSQL_PASSWORD);*/
        /*	Class.forName(Constants.ORACLE_DRIVER);
            conn = DriverManager.getConnection(
					Constants.ORACLE_URL,
					Constants.ORACLE_ID,
					Constants.ORACLE_PASSWORD);*/
        	Class.forName(Constants.MYSQL_DRIVER);
            conn = DriverManager.getConnection(
					Constants.MYSQL_URL,
					Constants.MYSQL_ID,
					Constants.MYSQL_PASSWORD);
				stmt = conn.createStatement();
				
				rs = stmt.executeQuery("SELECT NAME FROM TEST WHERE ID = 'IU' ");
				String id = null;
				while (rs.next()) {
					id = rs.getString("name");
				}
				System.out.println("ID : "+id);
        } catch (Exception e ) {
            System.out.println("HSQLDB 에러발생 !!");
            e.printStackTrace();
            return;
        } 
	}
}
