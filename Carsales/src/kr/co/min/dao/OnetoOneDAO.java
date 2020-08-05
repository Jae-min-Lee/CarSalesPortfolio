package kr.co.min.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	import java.util.ArrayList;

	import javax.naming.Context;
	import javax.naming.InitialContext;
	import javax.sql.DataSource;

	import kr.co.min.beans.OnetoOneBean;
	
	public class OnetoOneDAO {
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

		// 하나의 새로운 게시글이 넘어와서 저장되는 메소드 호출
		public void insertOnetoOne(OnetoOneBean bean) throws ClassNotFoundException, SQLException {
			getConnection();
			try {

				String sql = "insert into OnetoOne values(OnetoOne_seq.nextval,?,?,?,sysdate,?)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, bean.getSubject());
				pstmt.setString(2, bean.getEamil());
				pstmt.setString(3, bean.getPhone());
				pstmt.setString(4, bean.getContent());

				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 모든 게시글을 리턴해주는 메소드
		public ArrayList<OnetoOneBean> getAllOnetoOne() throws ClassNotFoundException, SQLException {

			ArrayList<OnetoOneBean> al = new ArrayList<OnetoOneBean>();

			getConnection();

			try {
				String sql = "select * from OnetoOne order by num";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					OnetoOneBean bean = new OnetoOneBean();
					
					bean.setNum(rs.getInt(1));// sequence OnetoOne_number
					bean.setSubject(rs.getString(2));
					bean.setEamil(rs.getString(3));
					bean.setPhone(rs.getString(4));
					bean.setReg_date(rs.getString(5));
					bean.setContent(rs.getString(6));
					

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
				String sql = "select count(*) from OnetoOne";
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
		public ArrayList<OnetoOneBean> getAllOnetoOne(int start, int end) {

			ArrayList<OnetoOneBean> al = new ArrayList<OnetoOneBean>();

			getConnection();

			try {

				String sql = "select * from (select A.*, Rownum Rnum from(select * from OnetoOne order by num desc)A)where Rnum >= ? and Rnum <=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					OnetoOneBean bean = new OnetoOneBean();
					
					bean.setNum(rs.getInt(1));// sequence OnetoOne_number
					bean.setSubject(rs.getString(2));
					bean.setEamil(rs.getString(3));
					bean.setPhone(rs.getString(4));
					bean.setReg_date(rs.getString(5));
					bean.setContent(rs.getString(6));

					al.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}
		
		//개인문의사항을 확인 할 때 필요한 전화번호값을 반환해 주는 메소드
		public String getPhone(String phone) {
			getConnection();
			
			String email = "";
			
			try {
				String sql = "select email from OnetoOne where phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				rs = pstmt.executeQuery();
			
				if(rs.next()) {
					email = rs.getString(1);			
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}		
			return email;
		}
		
		public OnetoOneBean getMyInfo(String phone) {
			
			OnetoOneBean bean = new OnetoOneBean();
			getConnection();

			try {
				String sql = "select * from OnetoOne where phone=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, phone);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					
					bean.setNum(rs.getInt(1));// sequence OnetoOne_number
					bean.setSubject(rs.getString(2));
					bean.setEamil(rs.getString(3));
					bean.setPhone(rs.getString(4));
					bean.setReg_date(rs.getString(5));
					bean.setContent(rs.getString(6));
					
				}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}

		// 하나의 게시글을 읽어오는 메소드
		public OnetoOneBean getOneOnetoOne(int num) {

			OnetoOneBean bean = new OnetoOneBean();
			getConnection();

			try {
				String sql = "select * from OnetoOne where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					
					bean.setNum(rs.getInt(1));// sequence OnetoOne_number
					bean.setSubject(rs.getString(2));
					bean.setEamil(rs.getString(3));
					bean.setPhone(rs.getString(4));
					bean.setReg_date(rs.getString(5));
					bean.setContent(rs.getString(6));
					
				}
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return bean;
		}

		// 하나의 게시글을 수정하는 메소드
		public void updateOnetoOne(OnetoOneBean bean) {
			getConnection();

			try {
				String sql = "update OnetoOne set Subject=?, Eamil=?, Phone=?, Content=? where num=?";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, bean.getSubject());
				pstmt.setString(2, bean.getEamil());
				pstmt.setString(3, bean.getPhone());
				pstmt.setString(4, bean.getContent());
				pstmt.setInt(5, bean.getNum());
				
				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 한개의 게시글을 삭제하는 메소드
		public void deleteOnetoOne(int num) {
			getConnection();
			
			try {
				String sql = "delete from OnetoOne where num=?";
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, num);
				pstmt.executeUpdate();

				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}