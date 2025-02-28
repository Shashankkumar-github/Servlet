import java.util.regex.Pattern;

public class UserValidation {
    // Name validation regex: Starts with a capital letter, min 3 characters
    private static final Pattern NAME_PATTERN = Pattern.compile("^[A-Z][a-zA-Z]{2,}$");

    public static boolean isValidName(String name) {
        return name != null && NAME_PATTERN.matcher(name).matches();
    }
}
