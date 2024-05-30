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
import javax.servlet.http.HttpSession;
import com.productos.datos.Conexion;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String hashedPassword = Base64.getEncoder().encodeToString(password.getBytes());
        
        try (Connection conexion = Conexion.conectar()) {
            String sql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            
            ps.setString(1, email);
            ps.setString(2, hashedPassword);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String rol = rs.getString("rol");
                HttpSession session = request.getSession();
                session.setAttribute("usuario", email);
                session.setAttribute("rol", rol);
                if ("admin".equals(rol)) {
                    response.sendRedirect("admin.jsp");
                } else {
                    response.sendRedirect("usuario.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=2");
        }
    }
}
