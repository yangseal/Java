<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>在线论坛BBS</title>
    <link rel="stylesheet" type="text/css" href="/css/styles.css">

</head>

<body>
<center>
    <%@ include file="top.jsp" %>
    <div id="wholePage">
        <div id="currentPoint">
            当前位置:&nbsp;&nbsp;<a class="green" href="allPostAction.action">首页</a>
        </div>
        <ul class="singlePost">
            <li class="sequence">序列</li>
            <li class="topic" style="text-align: center;">用户名</li>
            <li class="author">别名</li>
            <li class="date">日期</li>
            <li class="delete">积分</li>
        </ul>
        <br/>
        <s:iterator value="allPost" status="st">
            <ul class="singlePost">
                <li class="sequence">
                    <s:property value="#st.getIndex()+1+(pageNumber-1)*pageSize"/>
                </li>
                <li class="topic">
                   <s:property value="userName"></s:property>
                </li>
                <li class="author">
                    <a class="green" href="userInformationAction.action?userId=<s:property value="userId"/>"><s:property value="userNickname"/></a>
                </li>
                <li class="date">
                    <s:date name="userBirthday" format="yyyy-MM-dd HH:mm:ss"/>
                </li>
                <li class="delete">
                   <s:property value="userPoints"></s:property>
                </li>
            </ul>
        </s:iterator>
        <ul class="singlePost">
            <li class="postPaging">
                <s:property value="pageNumber"/>/<s:property value="totalPage"/>
                <a class="maroon" href="checkAction.action?pageNumber=1">首页</a>
                <a class="maroon" href="checkAction.action?pageNumber=<s:property value="pageNumber-1"/>">上一页</a>
                <a class="maroon" href="checkAction.action?pageNumber=<s:property value="pageNumber+1"/>">下一页</a>
                <a class="maroon" href="checkAction.action?pageNumber=<s:property value="totalPage"/>">末页</a>
            </li>
        </ul>
    </div>
    <%@ include file="bottom.html" %>
</center>
</body>
</html>
