<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.productos.datos.Conexion"%>

<%
HttpSession s = request.getSession(false);
if (s == null || s.getAttribute("usuario") == null) {
    response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Usuario - Respira Verde</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/usuario.css">
</head>
<body>
    <div class="usuario-container">
        <div class="usuario-box">
            <h1>Calculadora de Huella de Carbono</h1>

            <!-- Guía de Consumo de Energía -->
            <h2>Guía de Consumo de Energía (kWh)</h2>
            <ul>
                <li><strong>Hogar pequeño (1-2 personas):</strong> 150-300 kWh por mes.</li>
                <li><strong>Hogar mediano (3-4 personas):</strong> 300-600 kWh por mes.</li>
                <li><strong>Hogar grande (5+ personas):</strong> 600-1000+ kWh por mes.</li>
            </ul>

            <!-- Guía de Consumo de Agua -->
            <h2>Guía de Consumo de Agua (litros)</h2>
            <ul>
                <li><strong>Hogar pequeño (1-2 personas):</strong> 5,000-10,000 litros por mes.</li>
                <li><strong>Hogar mediano (3-4 personas):</strong> 10,000-20,000 litros por mes.</li>
            </ul>

            <form action="<%= request.getContextPath() %>/calcularHuella" method="post">
                <h3>Seleccione los electrodomésticos de uso diario (deje vacío si no lo usa):</h3>
                <%
                try (Connection conexion = Conexion.conectar()) {
                    String sql = "SELECT * FROM productos";
                    PreparedStatement ps = conexion.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        String nombre = rs.getString("nombre");
                %>
                <label><%=nombre%> (horas por día):</label> 
                <input type="number" name="producto_<%=id%>" min="0" step="0.1" placeholder="Horas por día"><br>
                <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                %>
                <h3>Consumo de energía en el hogar:</h3>
                <label for="energia">Consumo mensual de energía (kWh):</label> 
                <input type="number" id="energia" name="energia" min="0" step="0.1" required><br>

                <h3>Uso de recursos:</h3>
                <label for="agua">Consumo mensual de agua (litros):</label> 
                <input type="number" id="agua" name="agua" min="0" step="0.1" required><br>

                <button type="submit">Calcular</button>
            </form>

            <h2>Resultado</h2>
            <%
            String resultado = request.getParameter("resultado");
            if (resultado != null) {
                out.println("<p>Tu huella de carbono es: " + resultado + " kg CO2</p>");
                double huella = Double.parseDouble(resultado);
                if (huella < 500) {
                    out.println("<p>¡Estás ayudando al medio ambiente!</p>");
                } else {
                    out.println("<p>Debes reducir tu huella de carbono.</p>");
                }
            }
            %>
            <a href="<%= request.getContextPath() %>/vista/logout.jsp"><button>Cerrar Sesión</button></a>
        </div>
    </div>
</body>
</html>
