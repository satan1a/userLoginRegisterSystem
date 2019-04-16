//package com.thereroad.javaweb.beans;
//
//public class DatabaseBean {
//}
package com.thereroad.javaweb.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class DatabaseBean {
    // 数据库驱动
    String driver = "com.mysql.jdbc.Driver";
    // 数据库名字
    String dbName = "userRegisterSign";
    // 数据库用户名
    String user   = "root";
    // 数据库密码
    String password = "Sz0329..";
    // 数据库连接地址
    String url = "jdbc:mysql://localhost/" + dbName +
            "?user=" + user + "&password=" + password;
    Connection conn = null;
    Statement  st   = null;
    ResultSet  rs   = null;

    public String getDriver() {
        return driver;
    }
    public void setDriver(String driver) {
        this.driver = driver;
    }
    public String getUrl() {
        return url;
    }
    public void setUrl(String url) {
        this.url = url;
    }
    public String getUser() {
        return user;
    }
    public void setUser(String user) {
        this.user = user;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public Connection getConn() {
        return conn;
    }
    public void setConn(Connection conn) {
        this.conn = conn;
    }
    public Statement getSt() {
        return st;
    }
    public void setSt(Statement st) {
        this.st = st;
    }
    public ResultSet getRs() {
        return rs;
    }
    public void setRs(ResultSet rs) {
        this.rs = rs;
    }

    /*
     * @完成数据库的链接
     * @return boolean
     */
    public boolean creatConn(){
        boolean flag = false;
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url,user,password);
            //也是，只有上一步正确执行之后，程序才能进入下一步
            flag = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    /*
     * @更新数据库函数
     * @return boolean
     */
    public boolean update(String sql){
        boolean flag = false;
        try{
            st = conn.createStatement();

            int res = st.executeUpdate(sql);
            if(0!=res){
                flag = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return  flag;
    }


    /*
     * @完成数据库查询工作
     * @return boolean
     */

    public boolean query(String sql){
        boolean flag = false;
        try{
            st = conn.createStatement();

            rs = st.executeQuery(sql);

            flag = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return  flag;
    }

    /*
     * @结果集操作的next方法
     * @return boolean
     */

    public boolean next(){
        boolean flag = false;
        try{
            if(rs.next()) flag = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }

    /*
     * @当移动到目标行时，要取出某一列的值
     * @param field 是字段
     * @return String
     */

    public String getValue(String field){
        String value = null;
        try{
            if(rs!=null){
                value = rs.getString(field);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return value;
    }

    public void close() {
        try{
            if(rs!=null){
                rs.close();
                rs = null;
            }

            if(st!=null){
                st.close();
                st = null;
            }

            if(conn!=null){
                conn.close();
                conn = null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }

    }

}