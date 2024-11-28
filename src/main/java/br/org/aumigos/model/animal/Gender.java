package br.org.aumigos.model.animal;

public enum Gender {
    MACHO("Macho"),
    FEMEA("Fêmea");

    private String description;

    private Gender(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
