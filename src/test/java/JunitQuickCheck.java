import com.pholser.junit.quickcheck.Property;
import com.pholser.junit.quickcheck.runner.JUnitQuickcheck;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import static org.junit.Assert.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

@RunWith(JUnitQuickcheck.class)
public class JunitQuickCheck {

    /**
     * Assume this a method verified by hand
     *
     * @param a
     * @param b
     * @return
     */
    public boolean isEqual(int[] a, int[] b) {
        if (a.length != b.length)
            return false;
        for (int i = 0; i < a.length; i++) {
            if (a[i] != b[i])
                return false;
        }
        return true;
    }

    @Property
    public void concatenationLength(int[] toBeReversed) {
        var reversed = ArrayClass.reverseArray(toBeReversed);
        var reReversed = ArrayClass.reverseArray(reversed);
        assertTrue(isEqual(toBeReversed, reReversed), "Application of reversed twice does not hold");

    }
}
