<%-- 
    Document   : ElderTime
    Created on : Mar 13, 2016, 2:31:32 PM
    Author     : TC
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.ElderController"%>
<%@page import="java.io.File"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>

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

            String targetDate = "2015-01-16T16:00:00.000Z";
            String formatDate = targetDate.replaceAll("T", "/").replaceAll("Z", "");
            //activityDateList.get(activityDateList.size()-1);

            ArrayList<String> trgActiveList = activeMap.get(targetDate);
            ArrayList<String> trgInactiveList = inactiveMap.get(targetDate);
            //ArrayList<String> activeList = new ArrayList<String>();
            //<a href="https://raw.githubusercontent.com/wagatsubasa/cloudassign_02/master/daasactivitylevels20150918195538.csv">aaa</a>
            //ElderController.mashData();
            //String s = "03/24/2013 21:54";
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss.SSS");
            Date date = simpleDateFormat.parse(formatDate);

            Calendar cal = Calendar.getInstance();
            cal.setTime(date);

            SimpleDateFormat displayFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
            SimpleDateFormat displayFormat2 = new SimpleDateFormat("dd-MM-yyyy");
            String newTime = displayFormat2.format(cal.getTime());

            String sleep = "2015-02-16T16:50:02.000Z".replaceAll("T", "/").replaceAll("Z", "");
            String wake = "2015-02-17T01:26:42.000Z".replaceAll("T", "/").replaceAll("Z", "");

            Date sleepDate = simpleDateFormat.parse(sleep);
            Date wakeDate = simpleDateFormat.parse(wake);

            Calendar calSleep = Calendar.getInstance();
            Calendar calWake = Calendar.getInstance();

            calSleep.setTime(sleepDate);
            calWake.setTime(wakeDate);

            int count = 0;

            if (trgActiveList.size() >= trgInactiveList.size()) {
                count = trgInactiveList.size();
            } else {
                count = trgActiveList.size();
            }
            Calendar cal1 = Calendar.getInstance();
            cal1.setTime(date);
            Calendar cal2 = Calendar.getInstance();
            cal2.setTime(date);
        %>

    </head>
    <body>
        <div><h1>
                <%=newTime%>
            </h1></div>
        <h4>Active timings</h1>
            <%
                Calendar AstartTime = cal1;
                Calendar AendTime = cal2;
                for (int i = 0; i < count; i++) {
                    //ArrayList<String> tempList = activeList.get(i);

            %>
        <div>
            <div> <%            //for (int j = 0; j < tempList.size() - 1; j++) {
                int x = Integer.parseInt(trgActiveList.get(i));
                AendTime.add(Calendar.SECOND, x);
                //String s = AendTime.getTime();
                %>
                Active from: <font color="green"><%=displayFormat.format(AstartTime.getTime())%></font> to <font color="green"><%=displayFormat.format(AendTime.getTime())%></font>
            </div>
            <%
                AstartTime.setTime(AendTime.getTime());
                x = Integer.parseInt(trgInactiveList.get(i));
                AendTime.add(Calendar.SECOND, x);

            %>
            <div>
                Inactive: <font color="red"><%=displayFormat.format(AstartTime.getTime())%></font> to <font color="red"><%=displayFormat.format(AendTime.getTime())%></font>
            </div>
            <br>
            <%
                    AstartTime.setTime(AendTime.getTime());
                }
            %> 

        </div>



</body>
</html>
