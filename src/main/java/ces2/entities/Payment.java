package ces2.entities;

public interface Payment {

    int TOPE_AUMENTO = 20;

    default String increaseSalary(int percentage) {
        return "Hola, ¿quieres que te aumente el salario?";
    }

    static double verifySalaryIncreaseLimit() {
        return 300000;
    }
}
