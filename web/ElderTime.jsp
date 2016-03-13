<%-- 
    Document   : ElderTime
    Created on : Mar 13, 2016, 2:31:32 PM
    Author     : TC
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ElderController"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <%
            //String active_lvl = "X:/daasinactivitylevels20150918195753.csv";
            //String inactive_lvl = "X:/daasinactivitylevels20150918195753.csv";
            //String sleep_timing = "X:/daassleepingtiming20150918192704.csv";
            //String wake_timing = "X:/daaswakeuptiming20150918192359.csv";
            //String filePath = new File("").getAbsolutePath();
            //System.out.println("HERE HERE HERE " + filePath);
            //System.out.println("HERE HERE HERE " + System.getProperty("user.dir"));
            //ArrayList<ArrayList<String>> printList = new ArrayList<ArrayList<String>>();
            ArrayList<ArrayList<String>> activeList = ElderController.processActive();
            ArrayList<ArrayList<String>> inactiveList = ElderController.processInactive();
            ArrayList<ArrayList<String>> sleepList = ElderController.processSleeping();
            ArrayList<ArrayList<String>> wakeList = ElderController.processWakeup();
            //printList = sleepList;

            ArrayList<String> activityDateList = new ArrayList<String>();

            HashMap<String, ArrayList<String>> activeMap = new HashMap<String, ArrayList<String>>();
            for (ArrayList<String> arr : activeList) {
                String key = arr.get(arr.size() - 1);
                activityDateList.add(key);
                arr.remove(arr.size() - 1);
                activeMap.put(key, arr);

            }

            HashMap<String, ArrayList<String>> inactiveMap = new HashMap<String, ArrayList<String>>();
            for (ArrayList<String> arr : inactiveList) {
                String key = arr.get(arr.size() - 1);
                arr.remove(arr.size() - 1);
                inactiveMap.put(key, arr);

            }
            
            
            //ArrayList<String> activeList = new ArrayList<String>();
            //<a href="https://raw.githubusercontent.com/wagatsubasa/cloudassign_02/master/daasactivitylevels20150918195538.csv">aaa</a>
            //ElderController.mashData();
        %>

    </head>
    <body>
        <h1>ACTIVE TIMES</h1>
        <%
            for (int i = 0; i < activeList.size(); i++) {
                ArrayList<String> tempList = activeList.get(i);
        %>
        <div><h2>Time recorded</h2><%=tempList.get(tempList.size() - 1)%></div>
        <div><h4>Active timings</h1> <%
            for (int j = 0; j < tempList.size() - 1; j++) {

                %>
                <%=tempList.get(j)%>

                <%
                    }
                %> 
        </div>

        <%
            }
        %>

        <h1>INACTIVE TIME</h1>
        <%
            for (int i = 0; i < activeList.size(); i++) {
                ArrayList<String> tempList = inactiveList.get(i);
        %>
        <div><h2>Time recorded</h2><%=tempList.get(tempList.size() - 1)%></div>
        <div><h4>Inactive timings</h1> <%
            for (int j = 0; j < tempList.size() - 1; j++) {

                %>
                <%=tempList.get(j)%>

                <%
                    }
                %> 
        </div>

        <%
            }
        %>

        <h1>Sleeping Timings</h1>

        <%
            for (ArrayList<String> arS : sleepList) {
        %>
        <div>
            <%

            %>
            <%=arS.get(0)%>
            <%


            %>
        </div>
        <%            }
        %>

    </body>
</html>
