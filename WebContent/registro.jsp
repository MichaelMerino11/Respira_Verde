<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Registro - Respira Verde</title>
<link rel="stylesheet" href="./css/styles.css">
</head>
<body>
	<h1>Registro</h1>
	<form action="registrar" method="post">
		<label for="nombre">Nombre:</label> <input type="text" id="nombre"
			name="nombre" required><br> <label for="edad">Edad:</label>
		<input type="number" id="edad" name="edad" required><br>
		<label for="email">Email:</label> <input type="email" id="email"
			name="email" required><br> <label for="password">Contraseña:</label>
		<input type="password" id="password" name="password" required><br>
		<label for="rol">Rol:</label> <select id="rol" name="rol">
			<option value="admin">Administrador</option>
			<option value="usuario">Usuario</option>
		</select><br>

		<%-- Verificar si hay un parámetro "error" en la URL --%>
		<%
		if ("duplicado".equals(request.getParameter("error"))) {
		%>
		<%-- Mostrar el mensaje de error si el parámetro "error" es "duplicado" --%>
		<p>¡Error! Nombre o correo electrónico ya están en uso.</p>
		<%
		}
		%>

		<button type="submit">Registrar</button>
		<a href="index.jsp"><button>Regresar</button></a>
	</form>
</body>
</html>
