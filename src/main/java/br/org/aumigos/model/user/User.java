package br.org.aumigos.model.user;

import br.org.aumigos.model.person.Person;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;

public class User extends Person implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private String password;
    private LocalDate dateOfBirth;
    private Gender gender;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public LocalDate getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDate dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
