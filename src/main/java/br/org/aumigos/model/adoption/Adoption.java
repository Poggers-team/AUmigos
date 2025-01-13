package br.org.aumigos.model.adoption;

import br.org.aumigos.model.animal.Animal;

import java.io.Serial;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

public class Adoption implements Serializable {

    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;
    private String name;
    private int age;
    private String email;
    private String phone;
    private String address;
    private String zipCode;
    private ResidenceType residenceType;
    private boolean automaticGate;
    private boolean pool;
    private boolean netOnWindows;
    private String comments;
    private int qtyAnimals;
    private String experiences;
    private String animalPlace;
    private boolean responsible;
    private boolean awareOfCosts;
    private int peopleLivingInHouse;
    private boolean peopleAwareOfAdoption;
    private boolean childrenAtHouse;
    private LocalDate adoptionDate;
    private String animalAloneTime;
    private Animal animal;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public ResidenceType getResidenceType() {
        return residenceType;
    }

    public void setResidenceType(ResidenceType residenceType) {
        this.residenceType = residenceType;
    }

    public boolean isAutomaticGate() {
        return automaticGate;
    }

    public void setAutomaticGate(boolean automaticGate) {
        this.automaticGate = automaticGate;
    }

    public boolean isPool() {
        return pool;
    }

    public void setPool(boolean pool) {
        this.pool = pool;
    }

    public boolean isNetOnWindows() {
        return netOnWindows;
    }

    public void setNetOnWindows(boolean netOnWindows) {
        this.netOnWindows = netOnWindows;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public int getQtyAnimals() {
        return qtyAnimals;
    }

    public void setQtyAnimals(int qtyAnimals) {
        this.qtyAnimals = qtyAnimals;
    }

    public String getExperiences() {
        return experiences;
    }

    public void setExperiences(String experiences) {
        this.experiences = experiences;
    }

    public String getAnimalPlace() {
        return animalPlace;
    }

    public void setAnimalPlace(String animalPlace) {
        this.animalPlace = animalPlace;
    }

    public boolean isResponsible() {
        return responsible;
    }

    public void setResponsible(boolean responsible) {
        this.responsible = responsible;
    }

    public boolean isAwareOfCosts() {
        return awareOfCosts;
    }

    public void setAwareOfCosts(boolean awareOfCosts) {
        this.awareOfCosts = awareOfCosts;
    }

    public int getPeopleLivingInHouse() {
        return peopleLivingInHouse;
    }

    public void setPeopleLivingInHouse(int peopleLivingInHouse) {
        this.peopleLivingInHouse = peopleLivingInHouse;
    }

    public boolean isPeopleAwareOfAdoption() {
        return peopleAwareOfAdoption;
    }

    public void setPeopleAwareOfAdoption(boolean peopleAwareOfAdoption) {
        this.peopleAwareOfAdoption = peopleAwareOfAdoption;
    }

    public boolean isChildrenAtHouse() {
        return childrenAtHouse;
    }

    public void setChildrenAtHouse(boolean childrenAtHouse) {
        this.childrenAtHouse = childrenAtHouse;
    }

    public String getAnimalAloneTime() {
        return animalAloneTime;
    }

    public void setAnimalAloneTime(String animalAloneTime) {
        this.animalAloneTime = animalAloneTime;
    }

    public LocalDate getAdoptionDate() {
        return adoptionDate;
    }

    public void setAdoptionDate(LocalDate adoptionDate) {
        this.adoptionDate = adoptionDate;
    }

    public Animal getAnimal() {
        return animal;
    }

    public void setAnimal(Animal animal) {
        this.animal = animal;
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        Adoption adoption = (Adoption) o;
        return Objects.equals(id, adoption.id);
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(id);
    }
}
