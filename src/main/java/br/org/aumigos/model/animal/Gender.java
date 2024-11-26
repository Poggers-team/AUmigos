package br.org.aumigos.model.animal;

public enum Gender {
    MASCULINO("Masculino"),
    FEMININO("Feminino");

    private String description;

    private Gender(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
