package br.org.aumigos.model.voluntary;

public enum Availability {
    MANHA("Masculino"),
    TARDE("Feminino"),
    NOITE("Outro"),
    FIM_DE_SEMANA("Prefiro não dizer");

    private String description;

    private Availability(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
