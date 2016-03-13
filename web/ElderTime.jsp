<%-- 
    Document   : ElderTime
    Created on : Mar 13, 2016, 2:31:32 PM
    Author     : TC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ElderController"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            String active_lvl = "X:/daasinactivitylevels20150918195753.csv";
            String inactive_lvl = "X:/daasinactivitylevels20150918195753.csv";
            String sleep_timing = "X:/daassleepingtiming20150918192704.csv";
            String wake_timing = "X:/daaswakeuptiming20150918192359.csv";
            //String filePath = new File("").getAbsolutePath();
            //System.out.println("HERE HERE HERE " + filePath);
            //System.out.println("HERE HERE HERE " + System.getProperty("user.dir"));
            ArrayList<ArrayList<String>> printList = new ArrayList<ArrayList<String>>();
            ArrayList<ArrayList<String>> activeList = ElderController.processActive();
            ArrayList<ArrayList<String>> inactiveList = ElderController.processInactive();
            printList = activeList;
            //ArrayList<String> activeList = new ArrayList<String>();
            //<a href="https://raw.githubusercontent.com/wagatsubasa/cloudassign_02/master/daasactivitylevels20150918195538.csv">aaa</a>
        %>

    </head>
    <body>

        <%
            for (int i = 0; i < printList.size(); i++) {
                ArrayList<String> tempList = printList.get(i);
                %>
                <div><h2>Time recorded</h2><%=tempList.get(tempList.size()-1)%></div>
                <div><h4>Active timings</h1> <%
                for (int j = 0; j < tempList.size()-1; j++) {
                    
        %>
        <%=tempList.get(j)%>

        <%
                }
                %> 
                </div>
                
                <%
            }
        %>
    </body>
</html>
