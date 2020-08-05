package kr.co.min.dao;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.min.beans.MemberBean;

public class MemberDAO {

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

	// 회원가입
	public void signupMember(MemberBean bean) {
		getConnection();
		try {

			String sql = "insert into member values(member_seq.nextval,?,?,?,?,sysdate,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getCustname());
			pstmt.setString(2, bean.getCustpw());
			pstmt.setString(3, bean.getPhone());
			pstmt.setString(4, bean.getAdress());
			pstmt.setString(5, bean.getGrade());
			pstmt.setString(6, bean.getCity());

			pstmt.executeUpdate();

			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 로그인 처리
	public int getloginMember(String custname, String custpw) {
		int result = 0; // 처음이면 회원이 없음.
		getConnection();

		try {
			String sql = "select count(*) from member where custname=? and custpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);
			pstmt.setString(2, custpw);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				result = rs.getInt(1);// 없으면 0, 있으면 1값
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	// 전체글의 갯수를 반환하는 메소드
		public int getAllcount() {
			getConnection();

			int count = 0;

			try {
				String sql = "select count(*) from FAQ";
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

		// 최신멤버 역순으로 입력되는 숫자 범위만큼 가져오기
		public ArrayList<MemberBean> getAllMember(int start, int end) {

			ArrayList<MemberBean> al = new ArrayList<MemberBean>();

			getConnection();

			try {

				String sql = "select * from (select A.*, Rownum Rcustno from(select * from member order by custno desc)A)where Rcustno >= ? and Rcustno <=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					
					MemberBean bean = new MemberBean();
					bean.setCustno(rs.getInt(1));// sequence member_number
					bean.setCustname(rs.getString(2));
					bean.setCustpw(rs.getString(3));
					bean.setPhone(rs.getString(4));
					bean.setAdress(rs.getString(5));
					bean.setJoindate(rs.getString(6));
					bean.setGrade(rs.getString(7));
					bean.setCity(rs.getString(8));

					al.add(bean);
				}

				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			return al;
		}

	//한명의 회원정보 보기
	public MemberBean oneMemberInfo(String custname) {

		MemberBean bean = new MemberBean();

		try {
			getConnection();

			String sql = "select * from member where custname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custname);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				bean.setCustno(rs.getInt(1));
				bean.setCustname(rs.getString(2));
				bean.setCustpw(rs.getString(3));
				bean.setPhone(rs.getString(4));
				bean.setAdress(rs.getString(5));
				bean.setJoindate(rs.getString(6));
				bean.setCity(rs.getString(7));

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	// 한명의 회원의 패스워드값을 리턴하는 메소드 작성
	public String getPass(int custno) {

		String custpw = "";
		try {
			getConnection();

			String sql = "select Custpw from member where Custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				custpw = rs.getString(1);
			}
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return custpw;

	}

	// 회원정보 수정
	public void updateMemberInfo(MemberBean bean) {

		getConnection();
		try {
			String sql = "update member set Adress=?, City=?, Phone=? where Custno=?";
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, bean.getAdress());// 주소
			pstmt.setString(2, bean.getCity());// 도시
			pstmt.setString(3, bean.getPhone());// 핸드폰번호
			pstmt.setInt(4, bean.getCustno());// 회원번호

			pstmt.executeUpdate();

			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원탈퇴
	public void deleteMemberInfo(int custno) {
		try {
			getConnection();

			String sql = "delete member where Custno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);// id
			pstmt.executeUpdate();

			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}