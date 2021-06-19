public class Counter {
    private int value;

    public int getValue() {
        return value;
    }

    public void increment() {
        int tmp = value;
        value = tmp + 1;
    }
}
