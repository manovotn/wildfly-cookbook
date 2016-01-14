<%@ page language="java" contentType="text/html; charset=UTF-8"     pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
    <head>
        <meta charset="UTF-8">
        <title>PoC of Weld Rolling Updates</title>
    </head>

        <h2>WildFly::Cookbook::Rolling Test</h2>

        <h3 style="color:#ccff00;">I'm running version 1.1</h3>

        <h4>Who is serving your request? <%=System.getProperty("jboss.node.name")%></h4>
        <p>Message from session bean: ${bean.hello} </p>
        <p>Random generated number (from SessionScoped bean) is: ${bean.random} </p>
        

        <%
            Object sessAttr = session.getAttribute("visitors");
            int visitors = sessAttr == null ? 0 : Integer.valueOf(sessAttr+"");
            System.out.println("********************************+");
            System.out.println("I'm running version 1.1");
            System.out.println("I'm serving your request and I'm " + System.getProperty("jboss.node.name"));
            System.out.println("Visitor(s): " + visitors);
            System.out.println("********************************+");
        %>

        <h4>Visitor(s): <%=visitors%></h4>

        <%
            session.setAttribute("visitors", ++visitors);
        %>

    </body>
</html>
