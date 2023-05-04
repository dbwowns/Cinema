package cafe.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import cafe.dto.CafeDTO;
import config.DB;


public class CafeDAO {
	

	public void insert(CafeDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt =null;
		//ResultSet은 select할때만 필요한 객체
		try {
			conn = DB.getConn();
			StringBuilder sql = new StringBuilder();
			sql.append("insert into cafe ");
			sql.append(" (userid,passwd,name,tel,email) values ");
			sql.append(" (?,?,?,?,?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getUserid());//1번은 첫번째 ?를 의미
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.executeUpdate();//insert,update,delete일 때 사용하는 메소드
			System.out.println("여기도 완료");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
			try {
				if(conn != null) conn.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
	}



	public String loginCheck(CafeDTO dto) {
		String result ="";
		Connection conn= null;
		PreparedStatement pstmt= null;
		ResultSet rs =null;
		try {
			conn=DB.getConn();
			String sql ="select name from cafe where userid=? and passwd=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//로그인 성공
				result =rs.getString("name")+"님 환영합니다.";
			}else {
				//로그인 실패
				result="로그인 실패";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}try {
				if(pstmt!=null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
			try {
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}

}
