package exBean;

import java.sql.*;
import java.util.*;

public class ConnBean {
	private final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER = "201412360";
	private final String PASSWORD = "201412360";
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	Vector<studentVO> vlist = new Vector<studentVO>();
	public ConnBean() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, USER, PASSWORD);
		} catch(Exception e) {
			System.out.println("DB연결 실패:" + e);
			return;
		}
	}
	
	public Vector getData() {
		try {
			String sql = "select * from student";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			 while(rs.next()) {
				 studentVO rbean = new studentVO();
				 rbean.setNo(rs.getString("no"));
				 rbean.setName(rs.getString("name"));
				 vlist.add(rbean);
			 }
		} catch (Exception e) {
			System.out.println("SQL오류: " + e);
		}
		return vlist;
	}

}
