<%-- 
    Document   : ActualizaUsuario
    Created on : 25/05/2019, 01:54:43 PM
    Author     : Saul
--%>

<%@page import="controller.ConsultasUsuario"%>
<%@page import="java.util.List"%>
<%@page import="controller.ConsultasDisco"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Usuario</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../lib/bootstrap.min.css">
        <link rel="stylesheet" href="../lib/animate.css">
        <link rel="stylesheet" href="../css/util.css">
        <link rel="icon" href="../resources/images/favicon.ico" type="image/x-icon">
    </head>
    <body>
        <%
            String var = "";
            
            if(session.getAttribute("idUsuario") != null){
                var = session.getAttribute("idUsuario").toString();
            }
            
            if(!var.equals("")){
        %>
        <nav class="navbar navbar-dark bg-primary">
            <a class="navbar-brand" href="#">
                <img src="../resources/images/icono.jpg" width="100px" height="35px" class="d-inline-block align-top" alt="">
                Discográfica
            </a>
            <a class="navbar-brand text-right" ><%=session.getAttribute("nombreUsuario")%></a>
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
                    <a href="../CerrarSesion" class="list-group-item list-group-item-action" style="position:absolute;bottom: 0px">Cerrar sesión</a>
                </div>
                <div class="row col-10 mt-3">
                    <div class="container-fluid">
                        <h3 class="text-center mt-3">Modificar usuario</h3>
                        <div class="row mx-5 mb-5">

                            <%
                                //Código para obtener toda la información del disco
                                ConsultasUsuario conUsuario = new ConsultasUsuario();
                                List<Object[]> usr = conUsuario.obtenerDetallesUsuario(Integer.parseInt(request.getParameter("id")));
                                String id = "";
                                String nombre = "";
                                String apellidos = "";
                                String contrasenia = "";
                                String telefono = "";
                                String direccion = "";
                                String correo = "";
                                String tipo_usuario = "";
                                String idUsrAlta = "";
                                String fechaAlta = "";
                                String idUsrMod = "";
                                String fechaMod = "";
                                for (Object[] usuario : usr) {
                                    id = String.valueOf(usuario[0]);
                                    nombre = String.valueOf(usuario[1]);
                                    apellidos = String.valueOf(usuario[2]);
                                    contrasenia = String.valueOf(usuario[3]);
                                    telefono = String.valueOf(usuario[4]);
                                    direccion = String.valueOf(usuario[5]);
                                    correo = String.valueOf(usuario[6]);
                                    tipo_usuario = String.valueOf(usuario[7]);
                                    idUsrAlta = String.valueOf(usuario[8]);
                                    fechaAlta = String.valueOf(usuario[9]);
                                    idUsrMod = String.valueOf(usuario[10]);
                                    fechaMod = String.valueOf(usuario[11]);
                                }
                                
                                usr = conUsuario.obtenerDetallesUsuario(Integer.parseInt(idUsrAlta));
                                for (Object[] usuario : usr) {
                                    idUsrAlta = String.valueOf(usuario[1]+" "+usuario[2]);
                                }
                                
                                usr = conUsuario.obtenerDetallesUsuario(Integer.parseInt(idUsrMod));
                                for (Object[] usuario : usr) {
                                    idUsrMod = String.valueOf(usuario[1]+" "+usuario[2]);
                                }
                            %>
                            <div class="col">
                                <form class="form-row" action="../ModificarUsuario">
                                    <label class="font-weight-bold">Nombre completo</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="id_mod" placeholder="Id" value="<%= id%>">
                                        <input type="text" class="form-control" name="nombre_mod" placeholder="Nombre" value="<%= nombre%>">
                                        <input type="text" class="form-control" name="apellido_mod" placeholder="Apellido" value="<%= apellidos%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Datos personales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="direccion_mod" placeholder="Dirección" value="<%= direccion%>">
                                        <input type="text" class="form-control" name="correo_mod" placeholder="Correo" value="<%= correo%>">
                                        <input type="text" class="form-control" name="telefono_mod" placeholder="Teléfono" value="<%= telefono%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Credenciales</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="tipo_mod" placeholder="Tipo usuario" value="<%= tipo_usuario%>">
                                        <input type="text" class="form-control" name="repPass_mod" placeholder="Contraseña" value="<%= contrasenia%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de creación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="usrAlta_mod" placeholder="Usuario alta" disabled="disabled" value="<%= idUsrAlta%>">
                                        <input type="text" class="form-control" name="fecAlta_mod" placeholder="Fecha alta" disabled="disabled" value="<%= fechaAlta%>">
                                    </div>
                                    <label class="font-weight-bold mt-2">Detalles de modificación</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" name="usrMod_mod" placeholder="Usuario de modificación" disabled="disabled" value="<%= idUsrMod%>">
                                        <input type="text" class="form-control" name="fecMod_mod" placeholder="Fecha de modificación" disabled="disabled" value="<%= fechaMod%>">
                                    </div>
                                    <%
                                        if(!session.getAttribute("tipoUsuario").equals("Cliente") && !session.getAttribute("tipoUsuario").equals("Empleado")){
                                    %>
                                    <div class="row justify-content-end">
                                        <div class="col mt-3">
                                            <input class="btn btn-warning" type="submit" value="Modificar"></input>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="../lib/jquery-3.4.1.min.js"></script>
        <script src="../lib/popper.min.js"></script>
        <script src="../lib/bootstrap.min.js"></script>
        <%
            }else{
        %>
        <script type="text/javascript">
            alert("Por favor inicia sesión para poder ingresar al sitio");
            setTimeout("redireccionar()", 1); //tiempo expresado en milisegundos
            
            function redireccionar(){
                window.location="../index.html";
            }
        </script>
        <%
            }
        %>
    </body>
</html>
