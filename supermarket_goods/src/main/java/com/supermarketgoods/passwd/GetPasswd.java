package com.supermarketgoods.passwd;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class GetPasswd {
    public static void main(String[] args) throws NoSuchAlgorithmException {
        String passed = "123456";
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        byte[] hash = messageDigest.digest(passed.getBytes());
        String newpassed = bytesToHex(hash);
        System.out.println(newpassed);
    }

    private static String bytesToHex(byte[] bytes) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bytes) {
            sb.append(String.format("%02x", b));
        }
        return sb.toString();
    }
}
