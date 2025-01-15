package br.org.aumigos.model.adoption;

public enum ResidenceType {
    CASA("Casa"),
    CASA_CONDOMINIO("Casa em condomínio"),
    APARTAMENTO("Apartamento");

    private String description;

    private ResidenceType(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
