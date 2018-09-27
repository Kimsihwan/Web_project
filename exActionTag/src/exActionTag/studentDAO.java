package exActionTag;
import java.sql.*;
import java.util.Vector;

public class studentDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	Vector<studentVO> vlist = new Vector<studentVO>();
	
	 public void insertStudent(studentVO item) throws Exception {
		  String no = item.getNo();
		  String name = item.getName();


		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","201412360","201412360");

		  PreparedStatement pstmt = conn.prepareStatement("insert into student values(?,?)");
		  pstmt.setString(1,no);
		  pstmt.setString(2,name);
		  pstmt.executeUpdate();

		  pstmt.close();

		  conn.close();
		 }
	 
		public Vector<studentVO> selectStudent() {  // DB에 있는 데이터를 찾는 코드
			try {

			    Class.forName("oracle.jdbc.driver.OracleDriver");
				Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","201412360","201412360");
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
