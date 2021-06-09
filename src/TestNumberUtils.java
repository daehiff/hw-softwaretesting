

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;


public class TestNumberUtils {

    @Test
    public void canDistinguishPalindrome() {
        assertTrue(new NumberUtils(1221).isPalindrome());
        assertFalse(new NumberUtils(122321).isPalindrome());
        assertFalse(new NumberUtils(123221).isPalindrome());
    }

    @Test
    public void negativeRejected() {
        assertFalse(new NumberUtils(-1221).isPalindrome());
        assertFalse(new NumberUtils(-122321).isPalindrome());
        assertFalse(new NumberUtils(-123321).isPalindrome());
    }

    @Test
    public void exoticTests() {
        assertTrue(new NumberUtils(0).isPalindrome());
        assertFalse(new NumberUtils(Integer.MAX_VALUE).isPalindrome());
        assertFalse(new NumberUtils(Integer.MIN_VALUE).isPalindrome());
    }


}
