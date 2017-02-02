<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
<body>
	<center>
		<div id="top">
			<img src="/image/cilom.jpg" style="float:left;width: 200px;height: 140px;"/>
			<div style="width: 690px;padding-top: 100px;float: left;height: 140px;">
				<s:if test="%{#session.loginManager != null}">
					<font style="color: green;font-weight: bold;"><s:property value="#session.loginManager.managerName"/>您好</font>
				</s:if>
				<s:elseif test="%{#session.loginUser != null}">
					<font style="color: green;font-weight: bold;"><s:property value="#session.loginUser.userNickname"/>您好</font>
				</s:elseif>
				<s:else>
					<font style="color: red;font-weight: bold;"><b>游客您好</b></font>
				</s:else>
				欢迎光临个人在线BBS
				<s:if test="%{#session.loginManager != null}">
					<a class="blue" href="managerExitAction.action">安全退出</a>总用户数:<s:property value="personNum"></s:property>
					<s:form action = "checkAction.action" method = "post"  theme="simple">
						请输入查询用户姓名: <s:textfield label="请输入查询用户姓名:"  name = "name" theme="simple"></s:textfield>
						<s:submit value="查询"></s:submit>
					</s:form>

				</s:if>
				<s:elseif test="%{#session.loginUser != null}">
					<a class="blue" href="newPost.jsp">发表新帖</a>
					<a class="blue" href="personalInformationAction.action">个人信息</a>
					<a class="blue" href="personalPostAction.action">管理帖子</a>
					<a class="blue" href="userExitAction.action">安全退出</a>
				</s:elseif>
				<s:else>
					<a class="blue" href="enroll.jsp">用户注册</a>
					<a class="blue" href="login.jsp">用户登录</a>
					<a class="blue" href="managerLogin.jsp">管理员登录</a>
				</s:else>
			</div>
			<hr style="width: 900px;"/>
		</div>
	</center>
</body>
</html>
