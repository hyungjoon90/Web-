package com.day08.dao;

import com.day08.bean.BbsBean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDao {
	//DAO(Date Access Object)��ü
	private final String DRIVER ="oracle.jdbc.driver.OracleDriver";
	private final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER="scott";
	private final String PASSWORD="tiger";
	
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	
	public ArrayList<BbsBean> getBbsList(){
		ArrayList<BbsBean> list =new ArrayList<BbsBean>();
		String sql="SELECT NUM,SABUN,SUB,NALJA FROM BBS ORDER BY NUM DESC";
		
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				
				BbsBean bean=new BbsBean();
				
				bean.setNalja(rs.getDate("nalja"));
				bean.setNum(rs.getInt("num"));
				bean.setSabun(rs.getInt("sabun"));
				bean.setSub(rs.getString("sub"));
				
				list.add(bean);
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
				try {
					if(rs!=null){rs.close();}
					if(pstmt!=null){pstmt.close();}
					if(conn!=null){conn.close();}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		
		return list;	
	}
	
	public int getTot(){
		int cnt=0;
		String sql="SELECT COUNT(*) FROM BBS";
		try {
			Class.forName(DRIVER);
			
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				cnt=rs.getInt("COUNT(*)");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return cnt;
	}
	
	public void insert(int sabun, String sub, String content){
		String sql="insert into bbs values(bbs_seq.nextval,?,sysdate,?,?,0)";
			try {
				Class.forName(DRIVER);
				conn=DriverManager.getConnection(URL, USER, PASSWORD);
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, sabun);
				pstmt.setString(2, sub);
				pstmt.setString(3, content);
				pstmt.executeUpdate();
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				try {
					if(pstmt!=null){pstmt.close();}
					if(conn!=null){conn.close();}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	}
	
	public BbsBean listOne(int num){
		BbsBean bean =new BbsBean();
		String sql="select * from bbs where num=?";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()){
				bean.setNalja(rs.getDate("nalja"));
				bean.setSabun(rs.getInt("sabun"));
				bean.setNum(rs.getInt("num"));
				bean.setSub(rs.getString("sub"));
				bean.setContent(rs.getString("content"));
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null){rs.close();}
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return bean;
	}
	
	public int update(int num,String sub,String content){
		int result =0;
		String sql="UPDATE BBS SET SUB=?,CONTENT=? WHERE NUM=?";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, sub);
			pstmt.setString(2, content);
			pstmt.setInt(3, num);
			result=pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	public void delete(int num){
		String sql="delete from bbs where num=?";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	public void plusCnt(int num){
		String sql="update bbs set cnt=cnt+1 where num=?";
		try {
			Class.forName(DRIVER);
			conn=DriverManager.getConnection(URL,USER,PASSWORD);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
