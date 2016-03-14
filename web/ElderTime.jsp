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
        <link rel="stylesheet" href="css/style.css" type="text/css">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.css"/>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.1.8/semantic.min.js"></script>
        <script type="text/javascript">

            google.charts.load('current', {packages: ['corechart', 'bar']});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {

                var data = google.visualization.arrayToDataTable([
                    ['Active', 'Hours per Day'],
                    ['Active', 5.35],
                    ['Inactive', 13.62],
                    ['Sleep', 5.5],
                ]);

                var options = {
                    title: 'Mdm Lim\'s Daily Activities'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                //var chart2 = new google.visualization.PieChart(document.getElementById('piechart2'));

                chart.draw(data, options);
                var data = google.visualization.arrayToDataTable([
                    ['Mon', 16, 16, 18, 18],
                    ['Tue', 15, 15, 19, 19],
                    ['Wed', 16, 16, 20, 20],
                    ['Thu', 14, 14, 19, 19],
                    ['Fri', 16, 16, 18, 18],
                    ['Sat', 20, 20, 23, 23],
                    ['Sun', 16, 16, 18, 18]
                            // Treat the first row as data.
                ], true);

                var options = {
                    legend: 'none',
                    bar: {groupWidth: '100%'}, // Remove space between bars.
                    candlestick: {
                        fallingColor: {strokeWidth: 0, fill: '#a52714'}, // red
                        risingColor: {strokeWidth: 0, fill: '#0f9d58'}   // green
                    }
                };

                var chart2 = new google.visualization.CandlestickChart(document.getElementById('chart_div'));
                chart2.draw(data, options);
            }


            google.charts.setOnLoadCallback(drawMultSeries);

            function drawMultSeries() {
                var data = google.visualization.arrayToDataTable([
                    ['Category', 'This week', 'Avg'],
                    ['Active', 37.45, 38.45],
                    ['Inactive', 95.34, 65.34],
                    ['Sleep', 35, 60]
                ]);

                var options = {
                    title: 'Activity time (this week : average)',
                    chartArea: {width: '50%'},
                    hAxis: {
                        title: 'Hours',
                        minValue: 0
                    },
                    vAxis: {
                        title: 'Category'
                    }
                };

                var chart3 = new google.visualization.BarChart(document.getElementById('chart_div2'));
                chart3.draw(data, options);
            }
        </script>

        <script type="text/javascript">


        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>

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

            if (trgActiveList.size() <= trgInactiveList.size()) {
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
    <body bgcolor="#FFFFFF">
        <div id="header">
            <div>
                <a href="index.jsp" class="logo">
                    <h1>Pioneer Care</h1>
                </a> <span>Emergency Contact<b>8-234-354-210</b></span>
            </div>
            <ul>
                <li class="selected">
                    <a href="index.jsp">Home</a>
                </li>

                <li>
                    <a href="ElderTime.jsp">Dashboard</a>
                </li>
                <li >
                    <a href="direction.jsp">Best Route</a>
                </li>
                <li>
                    <a href="notify_driver.jsp">Traffic Alert</a>
                </li>
            </ul>
        </div>
        <div id="body">
            <div class="ui grid">



                <div class ="ui raised segment five wide column" id="piechart" style="width: 450px; height: 264px;"></div>
                <div class ="ui raised segment five wide column" id="chart_div" style="width: 450px; height: 250px;"></div>
                <div class ="ui raised segment five wide column" id="chart_div2" style="width: 450px; height: 250px;"></div>
                <div class ="ui raised segment ten wide column">
                    <div><h1>
                            <%=newTime%>
                        </h1></div>
                    <h4>Activity/Inactivity Logs</h1>
                        <%
                            Calendar AstartTime = cal1;
                            Calendar AendTime = cal2;
                            for (int i = 0; i < count; i++) {
                                //ArrayList<String> tempList = activeList.get(i);
                                int x = 0;
                                long diff;
                                long diffSeconds;
                                long diffMinutes;
                                long diffHours;
                                if (trgActiveList.size() > i) {
                        %>
                        <div>
                            <div> <%            //for (int j = 0; j < tempList.size() - 1; j++) {
                                x = Integer.parseInt(trgActiveList.get(i));
                                AendTime.add(Calendar.SECOND, x);
                                //String s = AendTime.getTime();
                                %>
                                Active from: <font color="green"><%=displayFormat.format(AstartTime.getTime())%></font> to <font color="green"><%=displayFormat.format(AendTime.getTime())%></font>
                                <%
                                    diff = AendTime.getTime().getTime() - AstartTime.getTime().getTime();
                                    diffSeconds = diff / 1000 % 60;
                                    diffMinutes = diff / (60 * 1000) % 60;
                                    diffHours = diff / (60 * 60 * 1000);
                                %>

                            </div>
                            <div>
                                Duration: <%=diffHours%> hours <%=diffMinutes%> minutes <%=diffSeconds%> seconds</div>
                                <%

                                        AstartTime.setTime(AendTime.getTime());
                                    }
                                    if (trgInactiveList.size() > i) {
                                        x = Integer.parseInt(trgInactiveList.get(i));
                                        AendTime.add(Calendar.SECOND, x);
                                        diff = AendTime.getTime().getTime() - AstartTime.getTime().getTime();
                                        diffSeconds = diff / 1000 % 60;
                                        diffMinutes = diff / (60 * 1000) % 60;
                                        diffHours = diff / (60 * 60 * 1000);
                                %>
                            <div>
                                Inactive: <font color="red"><%=displayFormat.format(AstartTime.getTime())%></font> to <font color="red"><%=displayFormat.format(AendTime.getTime())%></font>

                            </div>
                            <div>Duration: <%=diffHours%> hours <%=diffMinutes%> minutes <%=diffSeconds%> seconds</div>
                            <br>
                            <%
                                        AstartTime.setTime(AendTime.getTime());
                                    }
                                }
                            %> 

                        </div>

                </div>
            </div>
        </div>
        <div id="footer">
            <ul>
                <li id="twitter">
                    <a href="http://freewebsitetemplates.com/go/twitter/">twitter</a>
                </li>
                <li id="facebook">
                    <a href="http://freewebsitetemplates.com/go/facebook/">facebook</a>
                </li>
                <li id="googleplus">
                    <a href="http://freewebsitetemplates.com/go/googleplus/">googleplus</a>
                </li>
            </ul>
            <p>
                &copy; Copyright 2012. All rights reserved.
            </p>
        </div>
    </body>
</html>
