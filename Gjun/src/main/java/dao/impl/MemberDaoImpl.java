package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.MemberDao;
import model.Member;
import util.DbConnection;

public class MemberDaoImpl implements MemberDao{

	public static void main(String[] args) {
		System.out.println(new MemberDaoImpl().findByUsername("123"));
	}
	
	private static Connection conn=DbConnection.getDB();
	@Override
	public void addMember(Member m) {
		/*
		 * 1.SQL語法
		 * 2.交給PreparedStatement
		 * 3.executeUpdate
		 */
		String SQL="insert into member(name,username,password,address,phone,mobile) values(?,?,?,?,?,?)";
		
		try {
			PreparedStatement PreparedStatement=conn.prepareStatement(SQL);
			PreparedStatement.setString(1, m.getName());
			PreparedStatement.setString(2, m.getUsername());
			PreparedStatement.setString(3, m.getPassword());
			PreparedStatement.setString(4, m.getAddress());
			PreparedStatement.setString(5, m.getPhone());
			PreparedStatement.setString(6, m.getMobile());
			
			PreparedStatement.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Member findUsernameAndPassword(String username, String password) {
		/*
		 * 1.SQL語法
		 * 2.Preparedstatement-->executeQuery()
		 * 3.ResultSet-->Member
		 * 
		 */
		String SQL="select * from member where username=? and password=?";
		Member member=null;
		try {
			PreparedStatement PreparedStatement=conn.prepareStatement(SQL);
			PreparedStatement.setString(1, username);
			PreparedStatement.setString(2, password);
			ResultSet resultSet=PreparedStatement.executeQuery();
			
			if(resultSet.next())
			{
				member=new Member();
				member.setId(resultSet.getInt("id"));
				member.setName(resultSet.getString("name"));
				member.setUsername(resultSet.getString("username"));
				member.setPassword(resultSet.getString("password"));
				member.setAddress(resultSet.getString("address"));
				member.setPhone(resultSet.getString("phone"));
				member.setMobile(resultSet.getString("mobile"));
			}
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return member;
	}

	@Override
	public boolean findByUsername(String username) {
		String SQL="select * from member where username=?";
		boolean isUsernameBeenUse=false;
		try {
			PreparedStatement preparedStatement=conn.prepareStatement(SQL);
			preparedStatement.setString(1,username);
			ResultSet resultSet=preparedStatement.executeQuery();
			
			if(resultSet.next()) isUsernameBeenUse=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return isUsernameBeenUse;
	}

}
