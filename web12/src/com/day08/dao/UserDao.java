package com.day08.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	
	private final String DRIVER ="oracle.jdbc.driver.OracleDriver";
	private final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER="scott";
	private final String PASSWORD="tiger";
	
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;

	public boolean login(int sabun, String name){
		int result=0;
		String sql="select count(*) as cn from BBS_USER where sabun=? and name=?";
		
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, sabun);
			pstmt.setString(2, name);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt("cn");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(result>0){
			return true;
		} else {
			return false;
		}
	}
}




















