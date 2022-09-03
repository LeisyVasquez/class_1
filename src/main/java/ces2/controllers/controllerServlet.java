package ces2.controllers;

import ces2.entities.Contractor;
import ces2.entities.Employee;
import ces2.entities.Person;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.Stateful;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Stateful(passivationCapable = false)
public class controllerServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            //Si es la primera vez que entra y la sesión no existe, creala,si 
            //ya existe no me la cree, reutilice la que existe, para eso es el true
            HttpSession session = request.getSession(true);

            List<Person> employees;
            //Traer algo que se llame employees y a la sesión vamos a 
            //meterle una lista de personas que se llame trabajadores
            employees = (List<Person>) session.getAttribute("employees");
            //Si al comienzo mi sesión no tiene la lista de personas la 
            //trae vacia, si ya la tiene se trae como la tenga adentro

            String name = request.getParameter("userName");
            String type = request.getParameter("type");
            if (name != null && !name.isEmpty() && type != null && !type.isEmpty()) {
                Employee emp;
                Contractor contr;

                if (type.equals("empleado")) {
                    emp = new Employee(name);

                    if (employees == null) {
                        employees = new ArrayList<>();
                        employees.add(emp);
                        session.setAttribute("employees", employees);
                    } else {
                        employees.add(emp);
                    }
                } else if (type.equals("contratista")) {
                    contr = new Contractor(name);

                    if (employees == null) {
                        employees = new ArrayList<>();
                        employees.add(contr);
                        session.setAttribute("employees", employees);
                    } else {
                        employees.add(contr);
                    }
                }
                
                request.setAttribute("employees", employees); 
                //Despachador de solicitudes
                request.getRequestDispatcher("index.jsp").forward(request, response); 
            } else {
                out.println("Se debe de ingresar el nombre y el tipo.");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
