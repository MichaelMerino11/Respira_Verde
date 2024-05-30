<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Iniciar Sesión - Respira Verde</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>Iniciar Sesión</h1>
            <form action="<%= request.getContextPath() %>/login" method="post">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required><br>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required><br>

                <% if (request.getParameter("error") != null) { %>
                <p class="error-message">¡Credenciales incorrectas! Por favor, inténtalo de nuevo.</p>
                <% } %>

                <button type="submit">Ingresar</button>
            </form>
            <p>¿No tienes cuenta? <a href="<%= request.getContextPath() %>/vista/registro.jsp">Regístrate</a></p>
            <a href="<%= request.getContextPath() %>/vista/index.jsp"><button>Regresar</button></a>
        </div>
    </div>
</body>
</html>
