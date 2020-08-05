package kr.co.min.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.min.beans.BoardBean;

public class BoardDAO {
	
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
	
	//하나의 새로운 게시글이 넘어와서 저장되는 메소드 호출
	public void insertBoard(BoardBean bean){
		getConnection();
		
		int ref=0;//글 그룹 = 쿼리를 실행하여 가장 큰 ref값을 가쟝ㅎ고 +1을 더해줍니다.
		int re_step=1;//새글일때 = 부모글이기에
		int re_level=1;
		
		try {
			String refsql = "select max(ref) from board";
			pstmt = conn.prepareStatement(refsql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				ref = rs.getInt(1)+1;//최대값에 +1을 더하여 글그룹 설정.
			}
			
			String sql = "insert into board "
					+ "values(board_seq.nextval,?,?,?,?, sysdate, ?,?,?,0,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();		
	}
	
	}
	
	//모든 게시글을 리턴해주는 메소드
	public Vector<BoardBean> getAllBoard(){
		Vector<BoardBean> vec = new Vector<BoardBean>();
		getConnection();
		
		try {
			String sql = "select * from board order by ref desc, re_step asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));//sequence number
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11)); 
				
				vec.add(bean);//패키징한 데이터를 벡터에 저장
			}
			conn.close();
		}catch(Exception e ) {
			e.printStackTrace();
		}
		
		return vec;		
	}
	
	//하나의 게시글을 읽어오는 메소드
	public BoardBean getOneBoard(int num){
		
		BoardBean bean = new BoardBean();
		getConnection();
		
		try {  //count 증가
			String readsql = "update board set readcount = readcount + 1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		String sql ="select * from board where num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean.setNum(rs.getInt(1));//sequence number
			bean.setWriter(rs.getString(2));
			bean.setEmail(rs.getString(3));
			bean.setSubject(rs.getString(4));
			bean.setPassword(rs.getString(5));
			bean.setReg_date(rs.getDate(6).toString());
			bean.setRef(rs.getInt(7));
			bean.setRe_step(rs.getInt(8));
			bean.setRe_level(rs.getInt(9));
			bean.setReadCount(rs.getInt(10));
			bean.setContent(rs.getString(11)); 
		}
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return bean;		
	}
	
	//답변글이 저장되는 메소드
	public void reWriteBoard(BoardBean bean){
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getConnection();
		
		try {
			//부모 글 보다 더 큰 re_level의 값을 모두 1씩 증가시켜줍니다.
			String levelsql= "update board set re_level = re_level + 1 where ref=? and re_level > ?";
			pstmt = conn.prepareStatement(levelsql);
			pstmt.setInt(1, ref); 
			pstmt.setInt(2, re_level); 
			pstmt.executeUpdate();
			
			//답변글 데이터 저장
			String sql = "insert into board values(board_seq.nextval, ?,?,?,?, sysdate, ?,?,?, 0, ?)";   
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref); //부모의 trf값을 넣어줍니다.
			pstmt.setInt(6, re_step + 1); //답글이기에 부모 글 re_step에 1을 넣어줍니다.
			pstmt.setInt(7, re_level + 1);
			pstmt.setString(8, bean.getContent());
			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	//update용 게시글 반환
	public BoardBean getOneUpdateBoard(int num){
		
		BoardBean bean = new BoardBean();
		getConnection();
		
		try {
			String sql = "select * from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				bean.setNum(rs.getInt(1));//sequence number
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11)); 
			}
		conn.close();		
	}catch(Exception e) {
		e.printStackTrace();
	}
		return bean;	
	}
	
	//update, delete 할 때 필요한 패스워드값을 반환해 주는 메소드
	public String getPass(int num) {
		getConnection();
		
		String pass = "";
		
		try {
			String sql = "select password from board where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
		
			if(rs.next()) {
				pass = rs.getString(1);			
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return pass;
	}
	
	
	//하나의 게시글을 수정하는 메소드
	public void updateBoard(BoardBean bean){
		getConnection();
		
		try {
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent()); 
			pstmt.setInt(3, bean.getNum());
			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//한개의 게시글을 삭제하는 메소드
	public void deleteBoard(int num){
		getConnection();
		
		try {
			String sql = "delete from board where num=?";
			pstmt = conn.prepareStatement(sql);
			 
			pstmt.setInt(1, num);			
			pstmt.executeUpdate();
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}		
	}
	
	//전체글의 갯수를 반환하는 메소드 
	public int getAllcount(){
		getConnection();
		
		int count = 0;
		
		try {
			String sql = "select count(*) from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1); //전체 게시글 수 
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//
	public Vector<BoardBean> getAllBoard(int start, int end) {
		
		Vector<BoardBean> v = new Vector<BoardBean>();		
		
		getConnection();
		
		try {
			//가장 최신글의 스텝
			//ref글 그룹을 기준으로 최신글이 가장 위로 올라오고, re_step으로 답변글을 쓴다면, 오름차순하라는 의미이고, 
			//이것을 A라고 지칭합니다.
			//Rownum기준으로 Rnum이라는 별칭을 사용하여 Rnum이 startRow보다 크고, 
			//endRow보다 작은 경우에 해당하는 모든 레코드를 가져와라하는 의미입니다. 
			//즉, 최신글 답변글까지 포함하여 5개씩 가져오라는 의미를 지닙니다.
			String sql = "select * from (select A.*, Rownum Rnum from(select * from board order by ref desc, re_step asc)A)"
					+ "where Rnum >= ? and Rnum <=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));//sequence number
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadCount(rs.getInt(10));
				bean.setContent(rs.getString(11)); 
				v.add(bean);
			}
					
			conn.close();	
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return v;
				
	}
	
	
	
	
	
	
}
