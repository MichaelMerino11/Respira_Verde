<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Respira Verde - Home</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="../css/styles.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		style="background-color: transparent;">
		<ul class="navbar-nav mx-auto">
			<li class="nav-item"><a class="nav-link"
				href="sobreNosotros.jsp">Sobre Nosotros</a></li>
			<li class="nav-item"><a class="nav-link" href="testimonios.jsp">Testimonios</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="terminosCondiciones.jsp">Términos y Condiciones</a></li>
		</ul>
		<ul class="navbar-nav">
			<li class="nav-item"><a href="login.jsp"><img
					src="../imagenes/user_icon.png" alt="Iniciar Sesión"
					class="login-icon"></a></li>
		</ul>
	</nav>

    <div class="parallax parallax1">
        <div class="title-container">
            <img src="../imagenes/titulo.png" alt="Respira Verde" class="animated-title">
        </div>
    </div>
	<div class="content">
		<h2>Importancia del Aire Limpio</h2>
		<p>El aire limpio es esencial para nuestra salud y bienestar. La
			contaminación del aire puede causar enfermedades respiratorias,
			afectar la calidad de vida y contribuir al cambio climático. En
			Respira Verde, estamos comprometidos con la reducción de la huella de
			carbono en nuestros hogares para asegurar un futuro más saludable.</p>
	</div>
	<div class="parallax parallax2"></div>
	<div class="content">
		<h2>Consejos para Reducir la Huella de Carbono</h2>
		<ul>
			<li>Apaga los electrodomésticos cuando no estén en uso.</li>
			<li>Utiliza bombillas de bajo consumo energético.</li>
			<li>Reduce, reutiliza y recicla los materiales en tu hogar.</li>
			<li>Opta por electrodomésticos eficientes energéticamente.</li>
		</ul>
	</div>
	<div class="parallax parallax3"></div>
	<div class="content">
		<h2>Calcula Tu Huella de Carbono</h2>
		<p>Utiliza nuestra calculadora de huella de carbono para evaluar
			el impacto ambiental de tu hogar. Ingresa información sobre tus
			electrodomésticos y consumo de recursos para obtener un informe
			detallado. ¡Cada pequeña acción cuenta para hacer una gran
			diferencia!</p>
	</div>
	<footer>
		<div class="footer-content">
			<p>Autores: Tu Nombre</p>
			<!-- Reemplaza "Tu Nombre" con tu nombre real -->
			<div>
				<a href="#"><img
					src="<%=request.getContextPath()%>/imagenes/facebook.png"
					alt="Facebook"></a> <a href="#"><img
					src="<%=request.getContextPath()%>/imagenes/instagram.png"
					alt="Instagram"></a> <a href="#"><img
					src="<%=request.getContextPath()%>/imagenes/twitter.png"
					alt="Twitter"></a> <a href="#"><img
					src="<%=request.getContextPath()%>/imagenes/linkedin.png"
					alt="LinkedIn"></a>
			</div>
			<p>&copy; 2024 Respira Verde</p>
		</div>
		<div>
			<p>Contactanos: info@respiraverde.com</p>
		</div>
	</footer>



	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/footer.js"></script>
	<script src="<%=request.getContextPath()%>/js/nav.js"></script>
</body>
</html>