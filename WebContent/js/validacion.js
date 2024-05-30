function validarNombreProducto() {
    var nombreProducto = document.getElementById("nombreProducto").value;
    var patron = /^[a-zA-Z0-9\sáéíóúÁÉÍÓÚüÜñÑ.,()-]+$/; // Expresión regular permitiendo letras, números, espacios y algunos caracteres especiales
    if (!patron.test(nombreProducto)) {
        alert("¡Nombre de producto inválido! Por favor, utiliza solo letras, números, espacios y algunos caracteres especiales.");
        return false;
    }
    return true;
}
