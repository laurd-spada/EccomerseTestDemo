package com.ecommercetest.project;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getCon(){
        try {
            Class.forName("com.mysql.jdbc.Driver"); // this is the path for the jdbc based on the current version i am running on
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshopingtest", "root", "Ultraman57"); // accessing mysql by passing the url, usernam, and password
            return connection; // returning back the connection object whenever the Connection.getCon method is called
        } catch (Exception e){
            e.printStackTrace();
            return null; // return nothing because error
        }
    }
}
