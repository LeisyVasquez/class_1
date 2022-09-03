package ces2.entities;

public class Contractor extends Person implements Payment {

    public Contractor(String name) {
        super(name);
    }

    public String increaseSalary(int percentage) {
        String exit = "";

        if (percentage <= TOPE_AUMENTO) {
            exit = "Aumentando el salario el " + percentage + "%. A la " + getName();
        } else {
            exit = "Lo sentimos, no es posible aumentar el pago por hora más del " + 
                    TOPE_AUMENTO + "%. A la " + getName();
        }
        return exit; 
    }
}
