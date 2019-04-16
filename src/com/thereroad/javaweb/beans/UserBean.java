package com.thereroad.javaweb.beans;

public class UserBean {

	/**
	 * 用户名密码配对检验函数
	 * @param username
	 * @param password
	 * @return flag 用于判断匹配结果是否合法，true为合法
	 */
	public boolean isvalid(String username,String password){
		boolean flag = false;
		DatabaseBean db = new DatabaseBean();
		if(db.creatConn()){
			// 匹配的查询配对SQL语句
			String sql = "select * from user where username ='"+username+"' and password = '"+password+"' ";
			// 调用DatabaseBean对象中的SQL语句查询方法
			db.query(sql);
			// 调用DatabaseBean对象中的结果集操作语句
			// 如果其返回结果不为空，则表示数据库查询成功，即用户名和密码相匹配
			if(db.next()){
				flag = true;
			}
			// 关闭数据库
			db.close();
		}
		return flag;
//		return true;
	}


	/**
	 * 注册检验函数
	 * 用于判断用户名是否已经存在
	 * @param username
	 * @return flag 返回TRUE则用户名不重复
	 */
	public boolean isExist(String username){
		boolean flag = false;
		// 连接数据库
		DatabaseBean db = new DatabaseBean();
		if(db.creatConn()){
			// SQL语句
			String sql = "select * from user where username = '"+username+"'";
			db.query(sql);
			if(db.next()){
				flag = true;
			}
			db.close();
		}
		
		return flag;
	}


	/**
	 * 用户注册方法
	 * 向用户数据库中新增一个用户
 	 * @param username
	 * @param password
	 * @return
	 */
	public boolean add(String username,String password){
		boolean flag = false;
		// 连接数据库
		DatabaseBean db = new DatabaseBean();
		if(db.creatConn()){
			// SQL语句
			String sql = "insert into user(username,password) values('"+username+"','"+password+"')";
			if(db.update(sql)){
				flag = true;
			}
			db.close();
		}
		
		return flag;
	}
}