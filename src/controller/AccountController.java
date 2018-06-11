package controller;


import util.DBUtil;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class AccountController {
    public static boolean register (String username,String gender, String password){
        Connection conn = DBUtil.getConnection();
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet resultSet = stmt.executeQuery("select userid,username FROM users");
            while(resultSet.next()){
                String _username  = resultSet.getString("username");
                if(username.equals(_username)){
                    return false;
                }
            }
            int result = stmt.executeUpdate("INSERT users(username,usergender,password) VALUES('"+username+"','"+gender+"','"+password+"');");
            return result != 0;
        }
        catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static boolean exist(String username, String password){
        Connection _conn =DBUtil.getConnection();
        Statement _stmt;
        try{
            _stmt = _conn.createStatement();
            ResultSet resultSet=_stmt.executeQuery("SELECT username,password FROM users WHERE username='"+username+"' AND password='"+password+"'");
            if(resultSet.next()){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
