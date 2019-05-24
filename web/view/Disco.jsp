<%-- 
    Document   : Disco
    Created on : 12/05/2019, 07:23:11 PM
    Author     : Saul
--%>

<%@page import="java.util.List"%>
<%@page import="controller.ConsultasDisco"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Disco</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../lib/bootstrap.min.css">
        <link rel="stylesheet" href="../lib/animate.css">
        <link rel="stylesheet" href="../css/util.css">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="../resources/images/icono.jpg" width="100px" height="35px" class="d-inline-block align-top" alt="">
                Discográfica
            </a>
            <a class="navbar-brand text-right" >Usuario</a>
        </nav>
        <div class="container-fluid">
            <div class="row">
                <div class="col-2 p-0" style="background: #303030; height: 89vh;">
                    <div class="list-group">
                        <a href="Dashboard.jsp" class="list-group-item list-group-item-action">Discos</a>
                        <a href="Carrito.jsp" class="list-group-item list-group-item-action">Carrito</a>
                        <a href="Usuario.jsp" class="list-group-item list-group-item-action">Usuarios</a>
                        <a href="Cliente.jsp" class="list-group-item list-group-item-action">Clientes</a>
                        <a href="Producto.jsp" class="list-group-item list-group-item-action">Productos</a>
                        <a href="Almacen.jsp" class="list-group-item list-group-item-action">Almacen</a>
                    </div>
                    <a href="#" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="row col-10 mt-3">
                    <div class="container-fluid">
                        <div class="row">
                            <%
                                /***Nota importante: Si se necesita el id del disco para añadirlo al carrillo usar la variable "id" **/
                                //Código para obtener toda la información del disco
                                
                                EntityManagerFactory emf = Persistence.createEntityManagerFactory("DiscograficaPU");
                                EntityManager em = emf.createEntityManager();
                                ConsultasDisco conDisco = new ConsultasDisco(emf);
                                List<Object[]> dis = conDisco.ontenerUnDisco(Integer.parseInt(request.getParameter("id")));
                                String id = "";
                                String titulo = "";
                                String artista = "";
                                String imagen = "";
                                String genero = "";
                                String descripcion = "";
                                for (Object[] disco : dis) {
                                    id = String.valueOf(disco[0]);
                                    titulo = String.valueOf(disco[1]);
                                    artista = String.valueOf(disco[2]);
                                    imagen = String.valueOf(disco[3]);
                                    genero = String.valueOf(disco[4]);
                                    descripcion = String.valueOf(disco[5]);
                                }
                            %>
                            <div class="col-4">
                                <div class="row">
                                    <div class="col-12">

                                        <img src="<%=imagen%>" width="100%" style="border-radius:15px" alt="Imagen de disco">
                                    </div>
                                    <div class="col-12 mt-3">
                                        <div class="row">
                                            <div class="col-6">
                                                <button type="button" class="btn btn-success col-12">Success</button>
                                            </div>
                                            <div class="col-6">
                                                <div class="input-group mb-3">
                                                    <div class="input-group-prepend">
                                                        <span class="input-group-text" id="basic-addon3">Cantidad</span>
                                                    </div>
                                                    <input type="text" class="form-control" id="basic-url" aria-describedby="basic-addon3">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="col-7">
                                <h1 style="display:inline"><%= titulo %></h1><span> (<%= genero %>)</span><br>
                                <h4 class="text-muted"><%= artista%></h4>
                                <p class="mt-5"><%=descripcion%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
    </body>
</html>
