public class ArrayClass {
    /**
     * Yes documentation is important, but I give a fuck
     *
     * @param arrayToReverse
     * @return
     */
    public static int[] reverseArray(int[] arrayToReverse) {
        int[] reversedArray = new int[arrayToReverse.length];

        for (int i = 0; i < arrayToReverse.length; i++) {
            reversedArray[reversedArray.length - 1 - i] = arrayToReverse[i];
        }
        return reversedArray;
    }
}
