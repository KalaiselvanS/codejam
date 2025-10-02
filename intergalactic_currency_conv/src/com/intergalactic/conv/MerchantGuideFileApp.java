package com.intergalactic.conv;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class MerchantGuideFileApp {

    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Usage: java MerchantGuideFileApp <input-file>");
            return;
        }

        String fileName = args[0];
        MerchantGuide guide = new MerchantGuide();

        try (Scanner scanner = new Scanner(new File(fileName))) {
            while (scanner.hasNextLine()) {
                String line = scanner.nextLine().trim();
                if (line.isEmpty()) continue;

                try {
                    if (line.matches("\\w+ is [IVXLCDM]")) {
                        // Mapping intergalactic unit to Roman
                        String[] parts = line.split(" ");
                        guide.addMapping(parts[0], parts[2]);
                    } else if (line.matches("([a-z]+ )+[A-Z][a-z]* is \\d+ Credits")) {
                        // Commodity definition
                        String[] parts = line.split(" is ");
                        String[] words = parts[0].split(" ");
                        String commodity = words[words.length - 1];
                        String[] numerals = new String[words.length - 1];
                        System.arraycopy(words, 0, numerals, 0, words.length - 1);
                        double totalCredits = Double.parseDouble(parts[1].split(" ")[0]);
                        guide.addCommodity(numerals, commodity, totalCredits);
                    } else if (line.startsWith("how much is")) {
                        // Query: how much
                        String query = line.replace("how much is", "").replace("?", "").trim();
                        String[] words = query.split(" ");
                        System.out.println(guide.queryHowMuch(words));
                    } else if (line.startsWith("how many Credits is")) {
                        // Query: how many Credits
                        String query = line.replace("how many Credits is", "").replace("?", "").trim();
                        String[] words = query.split(" ");
                        String commodity = words[words.length - 1];
                        String[] numerals = new String[words.length - 1];
                        System.arraycopy(words, 0, numerals, 0, words.length - 1);
                        System.out.println(guide.queryHowManyCredits(numerals, commodity));
                    } else {
                        System.out.println("I have no idea what you are talking about");
                    }
                } catch (Exception e) {
                    System.out.println("I have no idea what you are talking about");
                }
            }
        } catch (FileNotFoundException e) {
            System.out.println("File not found: " + fileName);
        }
    }
}
