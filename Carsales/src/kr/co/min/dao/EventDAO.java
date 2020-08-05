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

import kr.co.min.beans.EventBean;

public class EventDAO {
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
	public void insertEventBoard(EventBean bean) throws ClassNotFoundException, SQLException {
		getConnection();
		try {

			String sql = "insert into event values(event_seq.nextval,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getTerm());
			pstmt.setString(4, bean.getImg());
			pstmt.setString(5, bean.getReg_date());

			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 모든 게시글을 리턴해주는 메소드
	public ArrayList<EventBean> getAllBoard() throws ClassNotFoundException, SQLException {

		ArrayList<EventBean> al = new ArrayList<EventBean>();

		getConnection();

		try {
			String sql = "select * from event order by event_num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				EventBean bean = new EventBean();
				
				bean.setNum(rs.getInt(1));// sequence event_number
				bean.setTitle(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setTerm(rs.getString(4));
				bean.setImg(rs.getString(5));
				bean.setReg_date(rs.getString(6));

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
			String sql = "select count(*) from event";
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
	public ArrayList<EventBean> getAllBoard(int start, int end) {

		ArrayList<EventBean> al = new ArrayList<EventBean>();

		getConnection();

		try {

			String sql = "select * from (select A.*, Rownum Rnum from(select * from event order by num desc)A)where Rnum >= ? and Rnum <=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				
				EventBean bean = new EventBean();
				bean.setNum(rs.getInt(1));// sequence event_number
				bean.setTitle(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setTerm(rs.getString(4));
				bean.setImg(rs.getString(5));
				bean.setReg_date(rs.getString(6));

				al.add(bean);
			}

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}

	// 하나의 게시글을 읽어오는 메소드
	public EventBean getOneBoard(int num) {

		EventBean bean = new EventBean();
		getConnection();

		try {
			String sql = "select * from event where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				bean.setNum(rs.getInt(1));// sequence event_number
				bean.setTitle(rs.getString(2));
				bean.setContent(rs.getString(3));
				bean.setTerm(rs.getString(4));
				bean.setImg(rs.getString(5));
				bean.setReg_date(rs.getString(6));
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
		

	// 하나의 게시글을 수정하는 메소드
	public void updateBoard(EventBean bean) {
		getConnection();

		try {
			String sql = "update event set title=?, content=?, term=?, img=? where num=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getTerm());
			pstmt.setString(4, bean.getImg());
			pstmt.setInt(5, bean.getNum());
			
			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 파일을 삭제하는 메소드
	public void filedelete(String img) {
		
		try {
			
			String uploadFileevent_img = "F:/WebWorkspace/CatProject/WebContent/upload"+"/"+ img;
			 
	        File uploadfile = new File (uploadFileevent_img);
	        
	             uploadfile.delete();       // 파일 삭제
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 한개의 게시글을 삭제하는 메소드
	public void deleteBoard(int num) {
		getConnection();
		
		try {
			String sql = "delete from event where num=?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, num);
			pstmt.executeUpdate();

			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}