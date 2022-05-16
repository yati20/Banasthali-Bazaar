package newpackage;

public class check_EmailId {

    public boolean check_email(String email) {
        if (email.length() < 15) {
            return false;
        } else {
            String str = email.substring(email.length() - 14);
            if (str.equalsIgnoreCase("@banasthali.in")) {
                return true;
            } else {
                return false;
            }
        }
    }
}