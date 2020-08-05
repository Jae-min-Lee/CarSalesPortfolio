package kr.co.min.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.min.beans.CarSizeBean;

public class CarSizeDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getConnection() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			conn = ds.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public CarSizeBean getReadCarSize(int num) {
		
		getConnection();
		
		CarSizeBean bean = new CarSizeBean();
		
		try {
			
		String sql ="select * from carsize where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean.setNum(rs.getInt(1));
			bean.setName(rs.getString(2));
		}
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return bean;	
	}
}
