<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Iniciar Sesión - Respira Verde</title>
<link rel="stylesheet" href="./css/styles.css">
</head>
<body>

	<h1>Iniciar Sesión</h1>
	<form action="login" method="post">
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" required><br> <label for="password">Contraseña:</label>
		<input type="password" id="password" name="password" required><br>

		<%
		if (request.getParameter("error") != null) {
		%>
		<p>¡Credenciales incorrectas! Por favor, inténtalo de nuevo.</p>
		<%
		}
		%>

		<button type="submit">Ingresar</button>
	</form>
	<p>
		¿No tienes cuenta? <a href="registro.jsp">Regístrate</a>
	</p>
	<a href="index.jsp"><button>Regresar</button></a>
</body>
</html>

