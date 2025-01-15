package br.org.aumigos.model.voluntary;

import br.org.aumigos.model.person.Person;

import java.io.Serial;
import java.io.Serializable;

public class Voluntary extends Person implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String phone;
    private Availability availability;
    private String skills;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Availability getAvailability() {
        return availability;
    }

    public void setAvailability(Availability availability) {
        this.availability = availability;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

}
