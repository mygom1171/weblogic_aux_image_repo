<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!doctype html public "-//w3c/dtd HTML 4.0//en">
<html>
<!-- Copyright (c) 1999-2001 by BEA Systems, Inc. All Rights Reserved.-->
<head>
<title>WebLogic Session Failover Test</title>
</head>
<body bgcolor="#FFFFFF">
<p>
<font face="Helvetica">
<h2>
<font color=#DB1260>
WebLogic Session Failover 테스트 소스
</font>
</h2>
<p>
이 JSP는 사용자가 페이지를 열 때마다 세션이 유지되고 있는지 확인하고, 접속 횟수를 증가시키는 테스트 페이지입니다.
<p>
<%!
  private int totalHits = 0;
%>
<%
  session = request.getSession(true);
  Integer ival = (Integer)session.getAttribute("simplesession.counter");
  if (ival == null) 
    ival = new Integer(1);
  else 
    ival = new Integer(ival.intValue() + 1);
  session.setAttribute("simplesession.counter", ival);
  System.out.println("[SessionTest] count = " + ival );
%>
<%
  Integer cnt = (Integer)application.getAttribute("simplesession.hitcount");
  if (cnt == null)
    cnt = new Integer(1);
  else
    cnt = new Integer(cnt.intValue() + 1);
  application.setAttribute("simplesession.hitcount", cnt);
  //System.out.println("[SessionTest] count = " + ival );
%>
<h3>
  ServerName : 
  <%
  String instName=System.getProperty("weblogic.Name");
  %>
<%=instName%>
</h3>
<table border=1 cellpadding=6><tr><td width=50% valign=top>
<font face="Helvetica">
<h3>
현재 세션의 접속 횟수 (초기화 전) : <font color=red> <%= ival %></font><%= (ival.intValue() == 1) ? "" : "회" %> <br>
</h3>
<font color=red><b>빨간색</b></font> 숫자는 HTTP 세션(<font face="Courier New" size=-1>javax.servlet.http.HttpSession</font>)에 저장된 값입니다.
<br>
세션이 초기화되거나 만료되면, 이 값은 <font color=red><b>1</b></font> 부터 다시 시작됩니다.
<br>
Session Failover 시 이 값이 유지되면, Failover가 정상적으로 동작한 것입니다.
<p>
세션 유지 시간(Timeout)은 WebLogic 설정에서 조정할 수 있습니다.
<br>
자세한 내용은 WebLogic 공식 문서를 참고하세요.
</font></td>
<td width=50% valign=top><font face="Helvetica">
<h3>전체 접속 횟수 : <font color=green> <%= cnt%></font><%= (cnt.intValue() == 1) ? "" : "회" %>
</h3> 
<font color=green><b>초록색</b></font> 숫자는 Servlet Context (<font face="Courier New" size=-1>javax.servlet.ServletContext)</font>에 저장되며, 모든 사용자가 공유합니다.
</font>
</td>
</tr></table>
<p>
</font>
</font>
</body>
</html>
