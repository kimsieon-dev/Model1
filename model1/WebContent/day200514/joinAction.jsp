<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.model1.dao.UserDAO" %>
<%@ page import="javax.naming.*" %> 
  
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="com.test.model1.vo.User" scope="page" />
<jsp:setProperty property="*" name="user"/>

<%
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(user);
	if(result == 0) {
		session.setAttribute("userId", user.getUserId());
		out.println("<script>");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('중복된 아이디 입니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	userDAO.udClose();
%>