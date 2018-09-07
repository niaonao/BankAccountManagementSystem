<%@ page pageEncoding="UTF-8" %>
<%
	cn.hpu.edu.common.util.Page p = (cn.hpu.edu.common.util.Page)session.getAttribute("SESSION_PAGE"); 
if(p!=null)p.getList().clear();
%> 