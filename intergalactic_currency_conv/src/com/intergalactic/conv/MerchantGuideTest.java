package com.intergalactic.conv;
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
