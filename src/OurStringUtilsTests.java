import jdk.jfr.Name;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class OurStringUtilsTests {
    OurStringUtils utils = new OurStringUtils();

    @Test
    @DisplayName("Test EmptyString")
    public void testEmptyString() {
        assertTrue(utils.isEmpty(""));
        assertFalse(utils.isEmpty("sometext"));
        assertTrue(utils.isEmpty(null));
        assertFalse(utils.isEmpty("   "));
    }


    @Test
    @DisplayName("Count Number of letters")
    public void testCountNumberOfLetters() {
        assertEquals(utils.countNumberOfLetters("abcdefg"), 7);
        assertEquals(utils.countNumberOfLetters("abc"), 3);
        assertEquals(utils.countNumberOfLetters("a b c d e f g"), 7);
        assertEquals(utils.countNumberOfLetters("a b  c  d e f g"), 7);
        assertEquals(utils.countNumberOfLetters("A b$5  c  d e f g"), 9);
        assertEquals(utils.countNumberOfLetters(""), 0);
        assertEquals(utils.countNumberOfLetters(null), 0);
    }

    @Test
    @DisplayName("Test the reverse of the String")
    public void testreverseString() {
        String test = "dsanfifbgnfvjdhoi";
        assertEquals(utils.reverseString(utils.reverseString(test)), test);
        assertEquals(utils.reverseString(null), null);
    }
}
