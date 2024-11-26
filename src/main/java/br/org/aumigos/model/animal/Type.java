package br.org.aumigos.model.animal;

public enum Type {
    CACHORRO("Cachorro"),
    GATO("Gato");

    private String description;

    private Type(String description) {
        this.description = description;
    }

    public String getDescription() {
        return description;
    }
}
