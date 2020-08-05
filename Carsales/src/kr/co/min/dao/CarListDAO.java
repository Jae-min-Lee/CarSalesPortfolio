package kr.co.min.dao;

import java.io.File;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.min.beans.CarListBean;

public class CarListDAO {

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

		// 하나의 새로운 이미지 게시글이 넘어와서 저장되는 메소드 호출
		public void insertCarsale_imgBoard(CarListBean bean) throws ClassNotFoundException, SQLException {
			getConnection();
			try {

				String sql = "insert into carsale values(carsale_seq.nextval,?,?,?,?,?,?)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bean.getCarsale_name());
				pstmt.setInt(2, bean.getCarsale_Category());
				pstmt.setInt(3, bean.getCarsale_Price());
				pstmt.setInt(4, bean.getCarsale_company());
				pstmt.setString(5, bean.getCarsale_img());
				pstmt.setString(6, bean.getCarsale_info());

				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 모든 게시글을 리턴해주는 메소드
		public ArrayList<CarListBean> getAllBoard() throws ClassNotFoundException, SQLException {

			ArrayList<CarListBean> al = new ArrayList<CarListBean>();

			getConnection();

			try {
				String sql = "select * from carsale order by carsale_num";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					CarListBean bean = new CarListBean();
					
					bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
					bean.setCarsale_name(rs.getString(2));
					bean.setCarsale_Category(rs.getInt(3));
					bean.setCarsale_Price(rs.getInt(4));
					bean.setCarsale_company(rs.getInt(5));
					bean.setCarsale_img(rs.getString(6));
					bean.setCarsale_info(rs.getString(7));

					al.add(bean);// 패키징한 데이터를 ArrayList에 저장
				}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}

		// 전체글의 갯수를 반환하는 메소드
		public int getAllcount() {
			getConnection();

			int count = 0;

			try {
				String sql = "select count(*) from carsale";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					count = rs.getInt(1); // 전체 게시글 수
				}

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return count;
		}

		// 최신글 역순으로 입력되는 숫자 범위만큼 가져오기
		public ArrayList<CarListBean> getAllBoard(int start, int end) {

			ArrayList<CarListBean> al = new ArrayList<CarListBean>();

			getConnection();

			try {

				String sql = "select * from (select A.*, Rownum Rcarsale_num from(select * from carsale order by carsale_num desc)A)where Rcarsale_num >= ? and Rcarsale_num <=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					CarListBean bean = new CarListBean();
					bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
					bean.setCarsale_name(rs.getString(2));
					bean.setCarsale_Category(rs.getInt(3));
					bean.setCarsale_Price(rs.getInt(4));
					bean.setCarsale_company(rs.getInt(5));
					bean.setCarsale_img(rs.getString(6));
					bean.setCarsale_info(rs.getString(7));

					al.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}

		// 하나의 게시글을 읽어오는 메소드
		public CarListBean getOneBoard(int carsale_num) {

			CarListBean bean = new CarListBean();
			getConnection();

			try {
				String sql = "select * from carsale where Carsale_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, carsale_num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
					bean.setCarsale_name(rs.getString(2));
					bean.setCarsale_Category(rs.getInt(3));
					bean.setCarsale_Price(rs.getInt(4));
					bean.setCarsale_company(rs.getInt(5));
					bean.setCarsale_img(rs.getString(6));
					bean.setCarsale_info(rs.getString(7));
				}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}
			
		
		// 하나의 게시글을 수정하는 메소드
		public void updateBoard(CarListBean bean) {
			getConnection();

			try {
				String sql = "update carsale set Carsale_name=?, Carsale_Category=?, Carsale_Price=?, Carsale_company=?, Carsale_img=?, Carsale_info=? where Carsale_num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getCarsale_name());
				pstmt.setInt(2, bean.getCarsale_Category());
				pstmt.setInt(3, bean.getCarsale_Price());
				pstmt.setInt(4, bean.getCarsale_company());
				pstmt.setString(5, bean.getCarsale_img());
				pstmt.setString(6, bean.getCarsale_info());

				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 파일을 삭제하는 메소드
		public void filedelete(String carsale_img) {
			
			try {
				
				String uploadFileCarsale_img = "F:/WebWorkspace/CatProject/WebContent/upload"+"/"+ carsale_img;
				 
		        File uploadfile = new File (uploadFileCarsale_img);
		        
		             uploadfile.delete();       // 파일 삭제
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 한개의 게시글을 삭제하는 메소드
		public void deleteBoard(int carsale_num) {
			getConnection();
			
			try {
				String sql = "delete from carsale where Carsale_num=?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, carsale_num);
				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public ArrayList<CarListBean> getCompanyCarList(int carsale_company) {

			ArrayList<CarListBean> al = new ArrayList<CarListBean>();

			getConnection();

			try {

				String sql = "select * from carsale where carsale_company=?";
		
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, carsale_company);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					CarListBean bean = new CarListBean();
					bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
					bean.setCarsale_name(rs.getString(2));
					bean.setCarsale_Category(rs.getInt(3));
					bean.setCarsale_Price(rs.getInt(4));
					bean.setCarsale_company(rs.getInt(5));
					bean.setCarsale_img(rs.getString(6));
					bean.setCarsale_info(rs.getString(7));

					al.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}
		
		public ArrayList<CarListBean> getCategoryCarList(int  carsale_category) {

			ArrayList<CarListBean> al = new ArrayList<CarListBean>();

			getConnection();

			try {

				String sql = "select * from carsale where carsale_category=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, carsale_category);
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					CarListBean bean = new CarListBean();
					bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
					bean.setCarsale_name(rs.getString(2));
					bean.setCarsale_Category(rs.getInt(3));
					bean.setCarsale_Price(rs.getInt(4));
					bean.setCarsale_company(rs.getInt(5));
					bean.setCarsale_img(rs.getString(6));
					bean.setCarsale_info(rs.getString(7));

					al.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}
		
		// 최신글 역순으로 입력되는 숫자 범위만큼 가져오기
				public ArrayList<CarListBean> getAllBoardHyundai(int num) {

					ArrayList<CarListBean> al = new ArrayList<CarListBean>();

					getConnection();

					try {

						String sql = "select * from carsale where carsale_company = ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setInt(1, num);

						rs = pstmt.executeQuery();

						while (rs.next()) {
							
							CarListBean bean = new CarListBean();
							bean.setCarsale_num(rs.getInt(1));// sequence Carsale_number
							bean.setCarsale_name(rs.getString(2));
							bean.setCarsale_Category(rs.getInt(3));
							bean.setCarsale_Price(rs.getInt(4));
							bean.setCarsale_company(rs.getInt(5));
							bean.setCarsale_img(rs.getString(6));
							bean.setCarsale_info(rs.getString(7));

							al.add(bean);
						}

						conn.close();

					} catch (Exception e) {
						e.printStackTrace();
					}
					return al;
				}
}