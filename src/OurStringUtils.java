import java.util.ArrayList;

public class OurStringUtils {


    public boolean isEmpty(String str) {
        if (str == null)
            return true;
        return str.length() == 0;
    }

    public String reverseString(String str) {
        if (str == null)
            return null;
        StringBuilder reversedStrBuilder = new StringBuilder();
        for (int i = str.length() - 1; i >= 0; i--) {
            reversedStrBuilder.append(str.charAt(i));
        }
        return reversedStrBuilder.toString();
    }

    public String stripWhiteSpaces(String str) {
        StringBuilder reversedStrBuilder = new StringBuilder();

        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) != ' ')
                reversedStrBuilder.append(str.charAt(i));
        }
        return reversedStrBuilder.toString();
    }


    public int countNumberOfLetters(String str) {
        if (str == null)
            return 0;
        String out = stripWhiteSpaces(str);
        return out.length();
    }


}
