package br.org.aumigos.utils;

public class PhoneVerifier {

    public String verifyPhone(String phone) {
        String regex = "^((\\b1[1-9])|(\\b2[12478])|(\\b3[1234578])|(\\b4[1-9])|(\\b5[1345])|(\\b6[1-9])|(\\b7[1345789])|(\\b[89][1-9]))9\\d{8}$";
        String cleanPhone = cleanPhone(phone);
        if(cleanPhone.length() != 11) return null;
        if(!cleanPhone.matches(regex)) return null;
        return cleanPhone;
    }

    private String cleanPhone(String phone) {
        return phone.replaceAll("\\D", "");
    }
}
