package Controller;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author TC
 */
public class ElderController {

    static final String hardcode = "";

    public static void mashData() {
        //0 - active/inactive durations in secs
        //1 - date of analysis
        ArrayList<ArrayList<String>> activeList = processActive();
        ArrayList<ArrayList<String>> inactiveList = processInactive();
        //0 - sleeping and waking time
        ArrayList<ArrayList<String>> sleepList = processSleeping();
        ArrayList<ArrayList<String>> wakeList = processWakeup();

        ArrayList<String> activityDateList = new ArrayList<>();

        HashMap<String, ArrayList<String>> activeMap = new HashMap<>();
        for (ArrayList<String> arr : activeList) {
            String key = arr.get(arr.size() - 1);
            activityDateList.add(key);
            arr.remove(arr.size() - 1);
            activeMap.put(key, arr);

        }

        HashMap<String, ArrayList<String>> inactiveMap = new HashMap<>();
        for (ArrayList<String> arr : inactiveList) {
            String key = arr.get(arr.size() - 1);
            arr.remove(arr.size() - 1);
            inactiveMap.put(key, arr);

        }

    }

    public static ArrayList<ArrayList<String>> processActive() {
        String active_lvl = hardcode + "daasactivitylevels20150918195538.csv";

        ArrayList<String> activeList = readFile(active_lvl);
        ArrayList<ArrayList<String>> testList = new ArrayList<>();
        for (String s : activeList) {

//            String s_cut = s.substring(s.indexOf("\"") + 1);
//            s_cut = s.substring(0, s.indexOf("\""));
//            testList.add(s_cut);
            String[] sArr = s.split(",");
            int count = 0;
            ArrayList<String> tempList = new ArrayList<>();
            for (String sA : sArr) {
                if (count > 0 && !sA.equals("Asia/Singapore") && !sA.equals("null")) {
                    tempList.add(sA.replaceAll("\\s+", "").replaceAll("\"", ""));
                }
                count++;
            }
            testList.add(tempList);
        }

        return testList;
    }

    public static ArrayList<ArrayList<String>> processInactive() {
        String inactive_lvl = hardcode + "daasinactivitylevels20150918195753.csv";

        ArrayList<String> inactiveList = readFile(inactive_lvl);
        ArrayList<ArrayList<String>> testList = new ArrayList<>();
        for (String s : inactiveList) {

//            String s_cut = s.substring(s.indexOf("\"") + 1);
//            s_cut = s.substring(0, s.indexOf("\""));
//            testList.add(s_cut);
            String[] sArr = s.split(",");
            int count = 0;
            ArrayList<String> tempList = new ArrayList<>();
            for (String sA : sArr) {
                if (count > 0 && !sA.equals("Asia/Singapore") && !sA.equals("null")) {
                    tempList.add(sA.replaceAll("\\s+", "").replaceAll("\"", ""));
                }
                count++;
            }
            testList.add(tempList);
        }

        return testList;
    }

    public static ArrayList<ArrayList<String>> processSleeping() {
        String active_lvl = hardcode + "daassleepingtiming20150918192704.csv";

        ArrayList<String> sleepList = readFile(active_lvl);
        ArrayList<ArrayList<String>> testList = new ArrayList<>();
        for (String s : sleepList) {

//            String s_cut = s.substring(s.indexOf("\"") + 1);
//            s_cut = s.substring(0, s.indexOf("\""));
//            testList.add(s_cut);
            String[] sArr = s.split(",");
            //int count = 0;
            ArrayList<String> tempList = new ArrayList<>();
            for (String sA : sArr) {
                if (!sA.equals("Asia/Singapore") && !sA.equals("null")) {
                    tempList.add(sA.replaceAll("\\s+", ""));
                }
                //count++;
            }
            testList.add(tempList);
        }

        return testList;
    }

    public static ArrayList<ArrayList<String>> processWakeup() {
        String active_lvl = hardcode + "daaswakeuptiming20150918192359.csv";

        ArrayList<String> wakeList = readFile(active_lvl);
        ArrayList<ArrayList<String>> testList = new ArrayList<>();
        for (String s : wakeList) {

//            String s_cut = s.substring(s.indexOf("\"") + 1);
//            s_cut = s.substring(0, s.indexOf("\""));
//            testList.add(s_cut);
            String[] sArr = s.split(",");
            //int count = 0;
            ArrayList<String> tempList = new ArrayList<>();
            for (String sA : sArr) {
                if (!sA.equals("Asia/Singapore") && !sA.equals("null")) {
                    tempList.add(sA.replaceAll("\\s+", ""));
                }
                //count++;
            }
            testList.add(tempList);
        }

        return testList;
    }

    public static ArrayList<String> readFile(String url) {
        ArrayList<String> resultList = new ArrayList<>();

        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        try {

            FileReader r = new FileReader(ElderController.class.getClassLoader()
                    .getResource(url).getPath()
                    .replaceAll("%20", " "));
            br = new BufferedReader(r);
            //br = new BufferedReader(new InputStreamReader(new URL(url).openStream(), "UTF-8"));
            int count = 0;
            while ((line = br.readLine()) != null) {
                if (count != 0) {
                    resultList.add(line);
                }
                count++;
                // use comma as separator
                //String[] country = line.split(cvsSplitBy);

                //System.out.println("Country [code= " + country[4]
                //      + " , name=" + country[5] + "]");
            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
//        try {
//            Scanner scanner = new Scanner(new File(url));
//
//            //Set the delimiter used in file
//            //scanner.useDelimiter(",");
//
//        //Get all tokens and store them in some data structure
//            //I am just printing them
//            while (scanner.hasNext()) {
//                resultList.add(scanner.next());
//            }
//            scanner.close();
//        } catch (Exception ex) {
//
//        } finally {
//
//        }

        return resultList;
    }
}
