<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.productos.datos.Conexion"%>

<%
HttpSession s = request.getSession(false); //s = session
if (s == null || s.getAttribute("usuario") == null) {
    response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Administrador - Respira Verde</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/admin.css">

<script>
    function validarNombreProducto() {
        var nombreProducto = document.getElementById("nombreProducto").value;
        var patron = /^[a-zA-Z0-9\sáéíóúÁÉÍÓÚüÜñÑ.,()-]+$/; // Expresión regular permitiendo letras, números, espacios y algunos caracteres especiales
        if (!patron.test(nombreProducto)) {
            alert("¡Nombre de producto inválido! Por favor, utiliza solo letras, números, espacios y los caracteres .,()-.");
            return false;
        }
        return true;
    }
</script>

</head>
<body>
    <div class="admin-container">
        <div class="admin-box">
            <h1>Panel de Administrador</h1>
            <form action="<%= request.getContextPath() %>/registrarProducto" method="post" onsubmit="return validarNombreProducto()">
                <label for="nombre">Nombre del Producto:</label> 
                <input type="text" id="nombreProducto" name="nombre" required><br> 
                <label for="descripcion">Descripción:</label>
                <textarea id="descripcion" name="descripcion" required></textarea><br> 
                <label for="valor_carbono">Valor de Carbono:</label> 
                <input type="number" id="valor_carbono" name="valor_carbono" required><br>

                <%
                if ("duplicado".equals(request.getParameter("error"))) {
                %>
                <p class="error-message">¡Error! El producto ya está registrado.</p>
                <%
                }
                %>

                <button type="submit">Registrar Producto</button>
            </form>

            <h2>Productos Registrados</h2>
            <ul>
                <%
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "SELECT * FROM productos";
                    PreparedStatement ps = conexion.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        String nombre = rs.getString("nombre");
                        String descripcion = rs.getString("descripcion");
                        int valorCarbono = rs.getInt("valor_carbono");
                %>
                <li><%=nombre%> - <%=descripcion%> - Valor de Carbono: <%=valorCarbono%></li>
                <%
                }
                } catch (SQLException e) {
                e.printStackTrace();
                }
                %>
            </ul>
            <a href="<%= request.getContextPath() %>/vista/logout.jsp"><button>Cerrar Sesión</button></a>
        </div>
    </div>
</body>
</html>
