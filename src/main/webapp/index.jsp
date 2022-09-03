<%@page import="ces2.entities.Contractor"%>
<%@page import="ces2.entities.Employee"%>
<%@page import="java.util.List"%>
<%@page import="ces2.entities.Person"%>
<%@page import="ces2.entities.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Person Pages</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <!-- Bulma Version 0.9.0-->
        <link rel="stylesheet" href="https://unpkg.com/bulma@0.9.0/css/bulma.min.css" />
        <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
    </head>
    <body>
        <section class="hero is-info is-fullheight">
            <div class="hero-head">
                <nav class="navbar">
                    <div class="container">
                        <div class="navbar-brand">
                            <!-- <a class="navbar-item" href="../">
                                <img src="https://cdn-icons-png.flaticon.com/512/7698/7698646.png" width="40" alt="Logo">
                            </a> -->
                        </div>
                        <div id="navbarMenu" class="navbar-menu">
                            <div class="navbar-end">
                                <span class="navbar-item">
                                    <a class="button is-white is-outlined" href="#">
                                        <span class="icon">
                                            <i class="fa fa-home"></i>
                                        </span>
                                        <span>Home</span>
                                    </a>
                                </span>
                                <span class="navbar-item">
                                    <a class="button is-white is-outlined" href="https://github.com/LeisyVasquez/class_1" target="_blank">
                                        <span class="icon">
                                            <i class="fa fa-github"></i>
                                        </span>
                                        <span>View Source</span>
                                    </a>
                                </span>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>

            <div class="hero-body">
                <div class="container has-text-centered">
                    <div class="column is-6 is-offset-3">
                        <h1 class="title">
                            Aumentar Salario de personas
                        </h1>
                        <%
                            List<Person> employees = (List<Person>) request.getAttribute("employees");
                            Employee emp;
                            Contractor contr;
                            if (employees != null) {
                                for (Person p : employees) {
                                    if (p instanceof Employee) {
                                        emp = (Employee) p;
                        %>                
                                    <h2 class="subtitle mb-4">
                                        <%= emp.increaseSalary(30)%>
                                    </h2>
                        <%         } else if (p instanceof Contractor) {
                            contr = (Contractor) p;
                        %>      
                                    <h2 class="subtitle mb-4">
                                        <%= contr.increaseSalary(10)%>
                                    </h2>
                        <%
                                    }
                                }
                            }
                        %>
                        <form action="controllerServlet" method="POST">
                            <div class="box">
                                <p class="control is-expanded mb-4">
                                    <input id="userName" name="userName" class="input" type="text" placeholder="Nombre de usuario">
                                </p>
                                <div class="field is-grouped">
                                    <select id="type" name="type" class="form-select mr-3" aria-label="Default select example">
                                        <option selected>Seleccione un tipo</option>
                                        <option value="empleado">Empleado</option>
                                        <option value="contratista">Contratista</option>
                                    </select>
                                    <p class="control">
                                        <input class="button is-info" type="submit" value="Enviar">
                                    </p>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
