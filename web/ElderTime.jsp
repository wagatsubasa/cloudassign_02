<%-- 
    Document   : ElderTime
    Created on : Mar 13, 2016, 2:31:32 PM
    Author     : TC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ElderController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            String active_lvl = "daasactivitylevels20150918195538.csv";
            String inactive_lvl = "daasinactivitylevels20150918195753.csv";
            String sleep_timing = "daassleepingtiming20150918192704.csv";
            String wake_timing = "daaswakeuptiming20150918192359.csv";

            ArrayList<String> activeList = ElderController.readFile(active_lvl);
        %>

    </head>
    <body>
        <%
            for (String s : activeList) {
        %>
        <div><%=s%></div>

        <%
            }
        %>
    </body>
</html>
