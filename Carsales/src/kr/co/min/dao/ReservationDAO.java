package kr.co.min.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.min.beans.ReservationBean;

public class ReservationDAO {

	Connection conn; // DB연결 (id, pass, url)
	PreparedStatement pstmt; // SQL실행
	ResultSet rs; // 실행된 SQL결과를 저장하고, 출력합니다.

	// 데이터 베이스에 연결해주는 메소드 호출
	public void getConnection() {

		try {

			InitialContext initctx = new InitialContext();
			// 개발환경상의 가상의 경로
			Context envctx = (Context) initctx.lookup("java:comp/env");
			// 데이터베이스에 접근
			DataSource ds = (DataSource) envctx.lookup("jdbc/oracle");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 하나의 예약 구매 정보가 넘어와서 저장되는 메소드 호출
			public void getReservationInfo(ReservationBean bean) throws ClassNotFoundException, SQLException {
								
				getConnection();
				
			        Random rand = new Random();
			        
			        int numStr = 0; //난수가 저장될 변수
			        
			        for(int i=0;i<9999999;i++) {
			            
			            //0~9 까지 난수 생성
			            int ran = rand.nextInt(10);
			            
			                if(numStr != ran) {
			                    //중복된 값이 없으면 numStr에 append
			                    numStr += ran;
			                }else {
			                    //생성된 난수가 중복되면 루틴을 다시 실행한다
			                    i-=1;
			                }
			                bean.setSalenol(numStr);
			            }
			        
				try {

					String sql = "insert into money values(?,?,?,?,?,?,?,?,sysdate)";

					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, bean.getCustno());
					pstmt.setInt(2, bean.getSalenol());
					pstmt.setInt(3, bean.getPcost());
					pstmt.setInt(4, bean.getAmount());
					pstmt.setInt(5, bean.getPrice());
					pstmt.setString(6, bean.getPcode());
					pstmt.setString(7, bean.getCarsale_img());
					pstmt.setString(8, bean.getCarsale_name());
					

					pstmt.executeUpdate();

					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			public ArrayList<ReservationBean> getAllReservationCheck(int custno) {
				
				ArrayList<ReservationBean> al = new ArrayList<ReservationBean>();
				
				getConnection();
				
				try {

					String sql = "select * from money where custno=?";
				
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, custno);
					
					rs = pstmt.executeQuery();

					while (rs.next()) {
						ReservationBean bean = new ReservationBean();
						bean.setCustno(rs.getInt(1));
						bean.setSalenol(rs.getInt(2));
						bean.setPcost(rs.getInt(3));
						bean.setAmount(rs.getInt(4));
						bean.setPrice(rs.getInt(5));
						bean.setPcode(rs.getString(6));
						bean.setCarsale_img(rs.getString(7));
						bean.setCarsale_name(rs.getString(8));
						bean.setSdate(rs.getString(9));

						al.add(bean);
					}
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				return al;
			}

public ReservationBean getReservationCheck(int custno) {
	
	ReservationBean bean1 = new ReservationBean();
	
	getConnection();
	
	try {

		String sql = "select * from money where custno=?";
	
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, custno);
		
		rs = pstmt.executeQuery();

		if (rs.next()) {

			bean1.setCustno(rs.getInt(1));
			bean1.setSalenol(rs.getInt(2));
			bean1.setPcost(rs.getInt(3));
			bean1.setAmount(rs.getInt(4));
			bean1.setPrice(rs.getInt(5));
			bean1.setPcode(rs.getString(6));
			bean1.setSdate(rs.getString(7));
			
		}
		conn.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return bean1;
}
}
