package com.mycompany.simplerest.entities;

public class Worker extends Entity {

    private String id;
    private String name;
    private String profession;
    private double Salary;

    @Override
    public void setId(String id) {
        this.id = id;
    }

    @Override
    public String getId() {

        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProfession() {
        return profession;
    }

    public void setProfession(String profession) {
        this.profession = profession;
    }

    public double getSalary() {
        return Salary;
    }

    public void setSalary(double Salary) {
        this.Salary = Salary;
    }

}
