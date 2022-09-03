package ces2.entities;

public class Person {
    private String name; 
    
    public Person(String name) {
        this.name = name; 
        
    }
    
    public String getName(){
        return "Persona con nombre: " + name +"."; 
    }
}
