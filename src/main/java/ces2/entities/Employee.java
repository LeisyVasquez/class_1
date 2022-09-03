package ces2.entities;

import java.io.Serializable;

public class Employee extends Person implements Payment, Serializable {

    double limit = Payment.verifySalaryIncreaseLimit();

    public Employee(String name) {
        super(name);
    }

    public String increaseSalary(int percentage) {
        return "Aumentando el salario el " + percentage + "%. A la " + getName();
    }

}
