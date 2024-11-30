package br.org.aumigos.model.animal;

public enum Size {
    PEQUENO("Pequeno"),
    MEDIO("Médio"),
    GRANDE("Grande");

    private String description;

    private Size(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
