import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;
import java.util.stream.IntStream;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

public class JunitArrayReverse {


    public int[] generateRandomArray(int n) {
        return IntStream.generate(() -> new Random().nextInt(100)).limit(n).toArray();
    }

    public boolean isReversed(int[] x, int[] y) {
        if (x.length != y.length) {
            return false;
        }
        for (int i = 0; i < x.length; i++) {
            if (x[i] != y[y.length - 1 - i]) {
                return false;
            }
        }
        return true;
    }


    @Test
    @DisplayName("Random instance of size 5")
    public void testRandomArray() {
        int[] randomInstance = generateRandomArray(5);
        int[] reversed = ArrayClass.reverseArray(randomInstance);
        assertEquals(randomInstance.length, reversed.length, "Expected same lenght for both instances");
        assertTrue(isReversed(randomInstance, reversed),
                "The random instance: " + Arrays.toString(randomInstance) + " couldnt be reversed");
    }


    @Test
    @DisplayName("Test a array of size 1")
    public void test1dArray() {
        int[] randomInstance = generateRandomArray(1);
        int[] reversed = ArrayClass.reverseArray(randomInstance);
        assertEquals(randomInstance.length, 1, "1D array is not 1D, WTF");
        assertEquals(reversed.length, 1, "reversed array does not match size");
        assertEquals(randomInstance[0], reversed[0], "1D Array is expected to be reversed");
    }
}
