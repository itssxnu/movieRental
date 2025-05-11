package com.app.movierental.dao;

import com.app.movierental.model.WatchListItem;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class WatchListDAO {

    private static String getFilePath(String username) {
        return "data/78/" + username + "/watchlist.txt";
    }

    public static void addToWatchList(String username, String movieId) {
        System.out.println("addToWatchList called with username=" + username + ", movieId=" + movieId);

        String filePath = getFilePath(username);
        File dir = new File("data/78/" + username);
        if (!dir.exists()) {
            boolean created = dir.mkdirs();
            System.out.println("Created directory: " + dir.getAbsolutePath() + " = " + created);
        }

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true))) {
            bw.write(username + "|" + movieId);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<WatchListItem> getWatchListByUser(String username) {
        List<WatchListItem> watchList = new ArrayList<>();
        String filePath = getFilePath(username);
        File file = new File(filePath);

        if (!file.exists()) {
            return watchList; // return empty list if watchlist file doesn't exist
        }

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 2 && parts[0].equals(username)) {
                    watchList.add(new WatchListItem(parts[0], parts[1]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

        return watchList;
    }

    public static void removeFromWatchList(String username, String movieId) {
        List<WatchListItem> all = getWatchListByUser(username);
        String filePath = getFilePath(username);

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            for (WatchListItem item : all) {
                if (!(item.getUsername().equals(username) && item.getMovieId().equals(movieId))) {
                    bw.write(item.getUsername() + "|" + item.getMovieId());
                    bw.newLine();
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
