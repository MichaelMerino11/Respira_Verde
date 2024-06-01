<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Testimonios - Respira Verde</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/testimonios.css">
</head>
<body>
    <div class="container">
        <h1>Testimonios</h1>

        <div class="testimonial-card">
            <img src="<%= request.getContextPath() %>/imagenes/user_icon.png" alt="Usuario" class="user-icon">
            <div class="testimonial-content">
                <p>
                    "Respira Verde ha sido una herramienta increíble para mi familia. Hemos aprendido a reducir nuestra huella de carbono y a tomar decisiones más ecológicas en nuestro día a día. La calculadora de huella de carbono es muy fácil de usar y nos ha dado una visión clara de nuestro impacto ambiental. ¡Gracias Respira Verde!"
                </p>
                <p class="user-name">- Laura Gómez</p>
            </div>
        </div>

        <div class="testimonial-card">
            <img src="<%= request.getContextPath() %>/imagenes/user_icon.png" alt="Usuario" class="user-icon">
            <div class="testimonial-content">
                <p>
                    "La plataforma de Respira Verde es exactamente lo que necesitábamos. Nos ha permitido entender mejor cómo nuestras acciones diarias afectan al medio ambiente y nos ha inspirado a hacer cambios positivos. Las guías y consejos son extremadamente útiles. ¡Recomiendo Respira Verde a todos!"
                </p>
                <p class="user-name">- Carlos Pérez</p>
            </div>
        </div>

        <div class="button-container">
            <a href="index.jsp" class="btn">Regresar</a>
        </div>
    </div>
</body>
</html>
