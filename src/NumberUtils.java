
public class NumberUtils {

    private final int number;

    public NumberUtils(int number) {
        this.number = number;
    }

    public boolean isPalindrome() {
        if (number >= 0) {
            String numberString = String.valueOf(this.number);
            return numberString.equals(new StringBuilder(numberString).reverse().toString());
        }
        return false;
    }

}
