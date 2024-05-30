package com.productos.controladores;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.productos.datos.Conexion;
import com.productos.modelo.Usuario;

@WebServlet("/registrar")
public class RegistroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rol = request.getParameter("rol");
        
        Usuario usuario = new Usuario(nombre, edad, email, password, rol);
        
        if (existeUsuario(nombre, email)) {
            // Redirigir a registro.jsp con mensaje de error
            response.sendRedirect(request.getContextPath() + "/vista/registro.jsp?error=duplicado");
            return;
        }
        
        String hashedPassword = Base64.getEncoder().encodeToString(usuario.getPassword().getBytes());
        
        try (Connection conexion = Conexion.conectar()) {
            String sql = "INSERT INTO usuarios (nombre, edad, email, password, rol) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, usuario.getNombre());
            ps.setInt(2, usuario.getEdad());
            ps.setString(3, usuario.getEmail());
            ps.setString(4, hashedPassword);
            ps.setString(5, usuario.getRol());
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/vista/login.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/vista/registro.jsp?error=1");
        }
    }
    
    private boolean existeUsuario(String nombre, String email) {
        try (Connection conexion = Conexion.conectar()) {
            String sql = "SELECT COUNT(*) AS count FROM usuarios WHERE nombre = ? OR email = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0; // Si count > 0, el usuario existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
