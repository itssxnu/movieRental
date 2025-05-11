package com.app.movierental.dao;

import com.app.movierental.model.Payment;

import java.io.*;
import java.util.*;

public class PaymentDAO {
    private static final String FILE_PATH = "data/78/payments.txt";

    public static void savePayment(Payment payment) {
        try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILE_PATH, true))) {
            String line = String.join("|", payment.getMovieId(), payment.getUsername(),
                    String.valueOf(payment.getAmount()), payment.getTimestamp());
            bw.write(line);
            bw.newLine();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static List<Payment> getPaymentsByUser(String username) {
        List<Payment> payments = new ArrayList<>();
        try (BufferedReader br = new BufferedReader(new FileReader(FILE_PATH))) {
            String line;
            while ((line = br.readLine()) != null) {
                String[] parts = line.split("\\|");
                if (parts.length == 4 && parts[1].equals(username)) {
                    payments.add(new Payment(parts[0], parts[1], Double.parseDouble(parts[2]), parts[3]));
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return payments;
    }
}
