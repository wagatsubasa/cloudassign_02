package Controller;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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

    public static ArrayList<ArrayList<String>> processActive() {
        String active_lvl = "X:/daasactivitylevels20150918195538.csv";

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
                if (count > 0 && !sA.equals("Asia/Singapore") && !sA.equals("null") ) {
                    tempList.add(sA.replaceAll("\"", ""));
                }
                count++;
            }
            testList.add(tempList);
        }

        return testList;
    }
    
    public static ArrayList<ArrayList<String>> processInactive() {
        String inactive_lvl = "X:/daasinactivitylevels20150918195753.csv";

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
                if (count > 0 && !sA.equals("Asia/Singapore") && !sA.equals("null") ) {
                    tempList.add(sA.replaceAll("\"", ""));
                }
                count++;
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

            br = new BufferedReader(new FileReader(url));
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
