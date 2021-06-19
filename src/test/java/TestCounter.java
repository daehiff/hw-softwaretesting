import com.google.code.tempusfugit.concurrency.ConcurrentRule;
import com.google.code.tempusfugit.concurrency.RepeatingRule;
import com.google.code.tempusfugit.concurrency.annotations.Concurrent;
import com.google.code.tempusfugit.concurrency.annotations.Intermittent;
import com.google.code.tempusfugit.concurrency.annotations.Repeating;
import org.junit.After;
import org.junit.Rule;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.assertTrue;

public class TestCounter {

    @Rule
    public ConcurrentRule concurrently = new ConcurrentRule();
    @Rule
    public RepeatingRule repeatedly = new RepeatingRule();


    Counter counter = new Counter();

    @Test
    @Repeating(repetition = 1000)
    public void testnTimes() {
        System.out.println("Woop!");
        counter.increment();
    }

    @After
    public void afterTest() {
        System.out.println("Checking");
        Assertions.assertEquals(counter.getValue(), 100);
    }
}
