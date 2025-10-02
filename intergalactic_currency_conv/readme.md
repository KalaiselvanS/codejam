This project is developed only with the help of chatgpt prompt.
Whereas I have spent 3 days For this same problem and developed this at https://github.com/KalaiselvanS/codejam/tree/master/galaxy.merchant.guide

https://chatgpt.com/share/68def287-72d8-800f-a5dd-5e64f413497a

THis link has the GPT propmt below:

You said:
 You decided to give up on earth after the latest financial collapse left 99.99% of the earth's population with 0.01% of the wealth. Luckily, with the scant sum of money that is left in your account, you are able to afford to rent a spaceship, leave earth, and fly all over the galaxy to sell common metals and dirt (which apparently is worth a lot). 
Buying and selling over the galaxy requires you to convert numbers and units. The numbers used for intergalactic transactions follows similar convention to the roman numerals and you have  
painstakingly collected the appropriate translation between them.

Input consists of lines of text detailing your notes on the conversion between intergalactic units and roman numerals. 

  glob is I
  prok is V
  pish is X
  tegj is L

  glob glob Silver is 34 Credits 
  glob prok Gold is 57800 Credits
  pish pish Iron is 3910 Credits
  
ChatGPT said:
Ah, I see — this is the classic "Merchant’s Guide to the Galaxy" problem (from Taming the Merchant’s Guide / “Intergalactic Merchant” puzzle). You’ve given me the notes (the rules for mapping words → Roman numerals → values). Let’s carefully work through what’s happening step by step.

Step 1. Known mappings (intergalactic → Roman)
glob → I

prok → V

pish → X

tegj → L

Step 2. Extract commodity values from the statements
We’re given sentences like:

glob glob Silver is 34 Credits
This means:

glob glob → I I = II = 2 (in decimal).

2 units of Silver = 34 Credits.

So, 1 unit of Silver = 34 / 2 = 17 Credits.

✅ Silver = 17 Credits per unit.

Next:

glob prok Gold is 57800 Credits
glob prok → I V = IV = 4.

4 units of Gold = 57800 Credits.

So, 1 unit of Gold = 57800 / 4 = 14450 Credits.

✅ Gold = 14450 Credits per unit.

Next:

pish pish Iron is 3910 Credits
pish pish → X X = XX = 20.

20 units of Iron = 3910 Credits.

So, 1 unit of Iron = 3910 / 20 = 195.5 Credits.

✅ Iron = 195.5 Credits per unit.

Step 3. Summarize the knowledge
glob = I

prok = V

pish = X

tegj = L

Values:

Silver = 17 Credits/unit

Gold = 14450 Credits/unit

Iron = 195.5 Credits/unit

👉 Now, usually the next step in the full problem is:
You’d get queries like:

“how much is pish tegj glob glob ?”

“how many Credits is glob prok Silver ?”

Or sometimes nonsensical input (“how much wood could a woodchuck chuck”), which you need to handle gracefully.

Would you like me to write the full solution in Java (parsing inputs, mapping to Roman numerals, calculating, and handling queries), or just keep working through examples manually?

You said:
how much is pish tegj glob glob ? how many Credits is glob prok Silver ? how many Credits is glob prok Gold ? how many Credits is glob prok Iron ? how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
ChatGPT said:
Perfect — now you’re giving me the queries 🎉. Let’s solve each carefully using the knowledge we derived.

Query 1:
“how much is pish tegj glob glob ?”

pish = X

tegj = L

glob glob = I I

So sequence = X L I I → XLII

Roman numeral XLII = 42 (L = 50, XL = 40, + II = 2 → 42).

✅ Answer:
pish tegj glob glob is 42

Query 2:
“how many Credits is glob prok Silver ?”

glob prok = I V = IV = 4.

Silver = 17 Credits/unit.

4 × 17 = 68.

✅ Answer:
glob prok Silver is 68 Credits

Query 3:
“how many Credits is glob prok Gold ?”

glob prok = IV = 4.

Gold = 14450 Credits/unit.

4 × 14450 = 57800.

✅ Answer:
glob prok Gold is 57800 Credits

Query 4:
“how many Credits is glob prok Iron ?”

glob prok = IV = 4.

Iron = 195.5 Credits/unit.

4 × 195.5 = 782.

✅ Answer:
glob prok Iron is 782 Credits

Query 5:
“how much wood could a woodchuck chuck if a woodchuck could chuck wood ?”

😅 That’s not a valid intergalactic numeral or commodity statement. According to the rules, we must respond with an error message like:

✅ Answer:
I have no idea what you are talking about

Final Responses (in order):
pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
Do you want me to now implement a Java program that can parse any such input (notes + queries) and automatically output these answers?

You said:
yes
ChatGPT said:
Perfect! Let’s build a Java program that can handle your intergalactic transactions:

It will:

Parse intergalactic → Roman numeral mappings.

Parse commodity prices.

Handle queries: “how much is …?” and “how many Credits is …?”.

Gracefully respond to invalid questions.

Here’s a full example using Java 17+, with JUnit-ready structure if needed:

import java.util.*;
import java.util.regex.*;

public class MerchantGuide {

    private static final Map<String, String> intergalacticToRoman = new HashMap<>();
    private static final Map<String, Double> commodityValues = new HashMap<>();

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        List<String> inputs = new ArrayList<>();

        System.out.println("Enter your notes and queries (end input with an empty line):");

        while (true) {
            String line = scanner.nextLine().trim();
            if (line.isEmpty()) break;
            inputs.add(line);
        }

        for (String line : inputs) {
            processLine(line);
        }
    }

    private static void processLine(String line) {
        // 1. Mapping intergalactic unit to Roman
        if (line.matches("\\w+ is [IVXLCDM]")) {
            String[] parts = line.split(" ");
            intergalacticToRoman.put(parts[0], parts[2]);
        }
        // 2. Commodity definition
        else if (line.matches("([a-z]+ )+[A-Z][a-z]* is \\d+ Credits")) {
            parseCommodity(line);
        }
        // 3. Query: how much
        else if (line.startsWith("how much is")) {
            handleHowMuch(line);
        }
        // 4. Query: how many Credits
        else if (line.startsWith("how many Credits is")) {
            handleHowManyCredits(line);
        }
        // 5. Unknown
        else {
            System.out.println("I have no idea what you are talking about");
        }
    }

    private static void parseCommodity(String line) {
        // e.g., "glob glob Silver is 34 Credits"
        String[] parts = line.split(" is ");
        String[] words = parts[0].split(" ");
        String commodity = words[words.length - 1];
        String[] numerals = Arrays.copyOf(words, words.length - 1);
        int quantity = romanToDecimal(convertToRoman(numerals));
        double totalCredits = Double.parseDouble(parts[1].split(" ")[0]);
        double unitValue = totalCredits / quantity;
        commodityValues.put(commodity, unitValue);
    }

    private static void handleHowMuch(String line) {
        // e.g., "how much is pish tegj glob glob ?"
        String query = line.replace("how much is", "").replace("?", "").trim();
        String[] words = query.split(" ");
        try {
            int value = romanToDecimal(convertToRoman(words));
            System.out.println(query + " is " + value);
        } catch (Exception e) {
            System.out.println("I have no idea what you are talking about");
        }
    }

    private static void handleHowManyCredits(String line) {
        // e.g., "how many Credits is glob prok Silver ?"
        String query = line.replace("how many Credits is", "").replace("?", "").trim();
        String[] words = query.split(" ");
        String commodity = words[words.length - 1];
        String[] numerals = Arrays.copyOf(words, words.length - 1);
        try {
            int quantity = romanToDecimal(convertToRoman(numerals));
            if (!commodityValues.containsKey(commodity)) {
                throw new IllegalArgumentException("Unknown commodity");
            }
            double credits = quantity * commodityValues.get(commodity);
            System.out.println(query + " is " + (int) credits + " Credits");
        } catch (Exception e) {
            System.out.println("I have no idea what you are talking about");
        }
    }

    private static String[] convertToRoman(String[] words) {
        String[] romans = new String[words.length];
        for (int i = 0; i < words.length; i++) {
            if (!intergalacticToRoman.containsKey(words[i])) {
                throw new IllegalArgumentException("Unknown intergalactic word: " + words[i]);
            }
            romans[i] = intergalacticToRoman.get(words[i]);
        }
        return romans;
    }

    private static int romanToDecimal(String[] romanNumerals) {
        String roman = String.join("", romanNumerals);
        Map<Character, Integer> map = Map.of(
            'I', 1, 'V', 5, 'X', 10, 'L', 50,
            'C', 100, 'D', 500, 'M', 1000
        );

        int total = 0, prev = 0;
        for (int i = roman.length() - 1; i >= 0; i--) {
            int value = map.get(roman.charAt(i));
            if (value < prev) total -= value;
            else total += value;
            prev = value;
        }
        return total;
    }
}
✅ How it works
Type your notes and queries line by line.

End input with an empty line.

Program outputs answers in order:

Example input for your scenario:

glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
Output:

pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
If you want, I can also refactor this into a more modular version with JUnit 5 tests ready to validate different inputs and outputs automatically.

Do you want me to do that?

You said:
yes
ChatGPT said:
Perfect! Let’s refactor the Merchant Guide program into a modular design with proper classes and methods, so it’s JUnit 5 testable. This will separate parsing, computation, and queries, making it easy to test each part.

Step 1: Core Classes
1. IntergalacticConverter.java – converts intergalactic words to decimal numbers using Roman numerals.

import java.util.HashMap;
import java.util.Map;

public class IntergalacticConverter {

    private final Map<String, String> intergalacticToRoman = new HashMap<>();

    public void addMapping(String word, String roman) {
        intergalacticToRoman.put(word, roman);
    }

    public int convert(String[] words) {
        StringBuilder roman = new StringBuilder();
        for (String word : words) {
            if (!intergalacticToRoman.containsKey(word)) {
                throw new IllegalArgumentException("Unknown intergalactic word: " + word);
            }
            roman.append(intergalacticToRoman.get(word));
        }
        return romanToDecimal(roman.toString());
    }

    private int romanToDecimal(String roman) {
        Map<Character, Integer> map = Map.of(
            'I', 1, 'V', 5, 'X', 10, 'L', 50,
            'C', 100, 'D', 500, 'M', 1000
        );

        int total = 0, prev = 0;
        for (int i = roman.length() - 1; i >= 0; i--) {
            int value = map.get(roman.charAt(i));
            if (value < prev) total -= value;
            else total += value;
            prev = value;
        }
        return total;
    }
}
2. CommodityStore.java – stores commodities and their per-unit prices.

import java.util.HashMap;
import java.util.Map;

public class CommodityStore {

    private final Map<String, Double> commodityValues = new HashMap<>();

    public void addCommodity(String name, double unitValue) {
        commodityValues.put(name, unitValue);
    }

    public double getCommodityValue(String name) {
        if (!commodityValues.containsKey(name)) {
            throw new IllegalArgumentException("Unknown commodity: " + name);
        }
        return commodityValues.get(name);
    }
}
3. MerchantGuide.java – main logic for processing lines and queries.

public class MerchantGuide {

    private final IntergalacticConverter converter = new IntergalacticConverter();
    private final CommodityStore store = new CommodityStore();

    public void addMapping(String word, String roman) {
        converter.addMapping(word, roman);
    }

    public void addCommodity(String[] intergalacticWords, String commodity, double totalCredits) {
        int quantity = converter.convert(intergalacticWords);
        double unitValue = totalCredits / quantity;
        store.addCommodity(commodity, unitValue);
    }

    public String queryHowMuch(String[] intergalacticWords) {
        int value = converter.convert(intergalacticWords);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " is " + value;
    }

    public String queryHowManyCredits(String[] intergalacticWords, String commodity) {
        int quantity = converter.convert(intergalacticWords);
        double credits = quantity * store.getCommodityValue(commodity);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " " + commodity + " is " + (int) credits + " Credits";
    }
}
Step 2: JUnit 5 Test Class
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class MerchantGuideTest {

    private MerchantGuide guide;

    @BeforeEach
    public void setup() {
        guide = new MerchantGuide();
        // Mappings
        guide.addMapping("glob", "I");
        guide.addMapping("prok", "V");
        guide.addMapping("pish", "X");
        guide.addMapping("tegj", "L");

        // Commodities
        guide.addCommodity(new String[]{"glob", "glob"}, "Silver", 34);
        guide.addCommodity(new String[]{"glob", "prok"}, "Gold", 57800);
        guide.addCommodity(new String[]{"pish", "pish"}, "Iron", 3910);
    }

    @Test
    public void testHowMuch() {
        assertEquals("pish tegj glob glob is 42", guide.queryHowMuch(new String[]{"pish", "tegj", "glob", "glob"}));
    }

    @Test
    public void testHowManyCredits() {
        assertEquals("glob prok Silver is 68 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Silver"));
        assertEquals("glob prok Gold is 57800 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Gold"));
        assertEquals("glob prok Iron is 782 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Iron"));
    }

    @Test
    public void testUnknownWord() {
        Exception e = assertThrows(IllegalArgumentException.class, () ->
                guide.queryHowMuch(new String[]{"foo", "bar"}));
        assertTrue(e.getMessage().contains("Unknown intergalactic word"));
    }

    @Test
    public void testUnknownCommodity() {
        Exception e = assertThrows(IllegalArgumentException.class, () ->
                guide.queryHowManyCredits(new String[]{"glob"}, "Platinum"));
        assertTrue(e.getMessage().contains("Unknown commodity"));
    }
}
✅ Benefits of this design:

Fully modular: converter, commodity store, query processor.

JUnit 5 tests cover all important scenarios.

Easily extendable for more intergalactic units or commodities.

Clear separation between parsing, computation, and queries.

If you want, I can now write a full interactive main() program that reads input lines like before but uses this modular structure — so it behaves exactly like your original example with answers printed automatically.

Do you want me to do that?

You said:
yes
ChatGPT said:
Perfect! Let’s combine the modular classes we made with an interactive main() program. This version reads your notes and queries line by line and prints answers using our MerchantGuide logic.

Interactive Main Program
import java.util.Scanner;

public class MerchantGuideApp {

    public static void main(String[] args) {
        MerchantGuide guide = new MerchantGuide();
        Scanner scanner = new Scanner(System.in);

        System.out.println("Enter your notes and queries (end input with an empty line):");

        while (true) {
            String line = scanner.nextLine().trim();
            if (line.isEmpty()) break;

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

        scanner.close();
    }
}
✅ How it works
Reads lines from standard input.

Distinguishes between:

Mappings: glob is I

Commodity definitions: glob glob Silver is 34 Credits

Queries: how much is … ? or how many Credits is … ?

Invalid input: outputs "I have no idea what you are talking about"

Uses the modular MerchantGuide logic for conversion and calculations.

Example Input
glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
Output
pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
This combines modular classes, JUnit testable design, and interactive CLI input.

If you want, I can also add support for multi-line input files, so you can run it with a .txt file instead of typing each line manually — very useful for large intergalactic trade notes.

Do you want me to do that?

You said:
yes
ChatGPT said:
Perfect! Let’s enhance the program so it can read input from a file instead of typing line by line. This is very useful for large intergalactic trade notes.

File-Based Main Program
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
✅ How to Use
Create a text file, e.g., input.txt, containing your intergalactic notes and queries:

glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
Run the program from the terminal:

java MerchantGuideFileApp input.txt
Output will be:

pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
✅ Benefits of this version:

No need to type input manually.

Handles large input files with hundreds of mappings, commodities, and queries.

Uses the same modular MerchantGuide logic, fully compatible with JUnit tests.

If you want, I can combine everything into a single ready-to-run project with:

IntergalacticConverter.java

CommodityStore.java

MerchantGuide.java

MerchantGuideFileApp.java

MerchantGuideTest.java (JUnit 5 tests)

This will be production-ready, and you can just compile and run.

Do you want me to do that?

You said:
yes
ChatGPT said:
Perfect! Here’s a complete ready-to-run Java project for your intergalactic merchant program, including all classes, the file-based main app, and JUnit 5 tests. You can just compile and run it.

1️⃣ IntergalacticConverter.java
import java.util.HashMap;
import java.util.Map;

public class IntergalacticConverter {

    private final Map<String, String> intergalacticToRoman = new HashMap<>();

    public void addMapping(String word, String roman) {
        intergalacticToRoman.put(word, roman);
    }

    public int convert(String[] words) {
        StringBuilder roman = new StringBuilder();
        for (String word : words) {
            if (!intergalacticToRoman.containsKey(word)) {
                throw new IllegalArgumentException("Unknown intergalactic word: " + word);
            }
            roman.append(intergalacticToRoman.get(word));
        }
        return romanToDecimal(roman.toString());
    }

    private int romanToDecimal(String roman) {
        Map<Character, Integer> map = Map.of(
            'I', 1, 'V', 5, 'X', 10, 'L', 50,
            'C', 100, 'D', 500, 'M', 1000
        );

        int total = 0, prev = 0;
        for (int i = roman.length() - 1; i >= 0; i--) {
            int value = map.get(roman.charAt(i));
            if (value < prev) total -= value;
            else total += value;
            prev = value;
        }
        return total;
    }
}
2️⃣ CommodityStore.java
import java.util.HashMap;
import java.util.Map;

public class CommodityStore {

    private final Map<String, Double> commodityValues = new HashMap<>();

    public void addCommodity(String name, double unitValue) {
        commodityValues.put(name, unitValue);
    }

    public double getCommodityValue(String name) {
        if (!commodityValues.containsKey(name)) {
            throw new IllegalArgumentException("Unknown commodity: " + name);
        }
        return commodityValues.get(name);
    }
}
3️⃣ MerchantGuide.java
public class MerchantGuide {

    private final IntergalacticConverter converter = new IntergalacticConverter();
    private final CommodityStore store = new CommodityStore();

    public void addMapping(String word, String roman) {
        converter.addMapping(word, roman);
    }

    public void addCommodity(String[] intergalacticWords, String commodity, double totalCredits) {
        int quantity = converter.convert(intergalacticWords);
        double unitValue = totalCredits / quantity;
        store.addCommodity(commodity, unitValue);
    }

    public String queryHowMuch(String[] intergalacticWords) {
        int value = converter.convert(intergalacticWords);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " is " + value;
    }

    public String queryHowManyCredits(String[] intergalacticWords, String commodity) {
        int quantity = converter.convert(intergalacticWords);
        double credits = quantity * store.getCommodityValue(commodity);
        String joinedWords = String.join(" ", intergalacticWords);
        return joinedWords + " " + commodity + " is " + (int) credits + " Credits";
    }
}
4️⃣ MerchantGuideFileApp.java (Interactive File Input)
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
5️⃣ MerchantGuideTest.java (JUnit 5)
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class MerchantGuideTest {

    private MerchantGuide guide;

    @BeforeEach
    public void setup() {
        guide = new MerchantGuide();
        // Mappings
        guide.addMapping("glob", "I");
        guide.addMapping("prok", "V");
        guide.addMapping("pish", "X");
        guide.addMapping("tegj", "L");

        // Commodities
        guide.addCommodity(new String[]{"glob", "glob"}, "Silver", 34);
        guide.addCommodity(new String[]{"glob", "prok"}, "Gold", 57800);
        guide.addCommodity(new String[]{"pish", "pish"}, "Iron", 3910);
    }

    @Test
    public void testHowMuch() {
        assertEquals("pish tegj glob glob is 42", guide.queryHowMuch(new String[]{"pish", "tegj", "glob", "glob"}));
    }

    @Test
    public void testHowManyCredits() {
        assertEquals("glob prok Silver is 68 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Silver"));
        assertEquals("glob prok Gold is 57800 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Gold"));
        assertEquals("glob prok Iron is 782 Credits", guide.queryHowManyCredits(new String[]{"glob", "prok"}, "Iron"));
    }

    @Test
    public void testUnknownWord() {
        Exception e = assertThrows(IllegalArgumentException.class, () ->
                guide.queryHowMuch(new String[]{"foo", "bar"}));
        assertTrue(e.getMessage().contains("Unknown intergalactic word"));
    }

    @Test
    public void testUnknownCommodity() {
        Exception e = assertThrows(IllegalArgumentException.class, () ->
                guide.queryHowManyCredits(new String[]{"glob"}, "Platinum"));
        assertTrue(e.getMessage().contains("Unknown commodity"));
    }
}
✅ Usage Instructions
Compile all .java files:

javac *.java
Create a file input.txt with your notes and queries:

glob is I
prok is V
pish is X
tegj is L
glob glob Silver is 34 Credits
glob prok Gold is 57800 Credits
pish pish Iron is 3910 Credits
how much is pish tegj glob glob ?
how many Credits is glob prok Silver ?
how many Credits is glob prok Gold ?
how many Credits is glob prok Iron ?
how much wood could a woodchuck chuck if a woodchuck could chuck wood ?
Run the program:

java MerchantGuideFileApp input.txt
Expected Output:

pish tegj glob glob is 42
glob prok Silver is 68 Credits
glob prok Gold is 57800 Credits
glob prok Iron is 782 Credits
I have no idea what you are talking about
Run JUnit tests with your IDE or via Maven/Gradle to verify correctness.

This project is fully modular, testable, and ready for large input files.

If you want, I can add support for additional Roman numeral rules (like checking for invalid sequences, e.g., IIII or VV) so your program fully validates intergalactic numerals.

Do you want me to do that?




No file chosenNo file chosen
ChatGPT can make mistakes. Check important info. See Cookie Preferences.
