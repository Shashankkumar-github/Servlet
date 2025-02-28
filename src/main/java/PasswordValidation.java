import java.util.regex.Pattern;

public class PasswordValidation {

    private static final Pattern PASSWORD_PATTERN =
            Pattern.compile("^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};:'\"\\\\|,.<>/?]).{8,}$");

    public static boolean isValidPassword(String password) {
        if (password == null) return false;


        int specialCount = 0;
        for (char ch : password.toCharArray()) {
            if ("!@#$%^&*()_+-=[]{};:'\"\\|,.<>?/".contains(Character.toString(ch))) {
                specialCount++;
            }
        }
        return PASSWORD_PATTERN.matcher(password).matches() && specialCount == 1;
    }
}
