package com.productos.controladores;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.productos.datos.Conexion;
import com.productos.modelo.Productos;

@WebServlet("/registrarProducto")
public class RegistrarProductoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int valorCarbono = Integer.parseInt(request.getParameter("valor_carbono"));
        
        Productos producto = new Productos(nombre, descripcion, valorCarbono);
        
        if (existeProducto(nombre)) {
            // Redirigir a admin.jsp con mensaje de error
            response.sendRedirect(request.getContextPath() + "/vista/admin.jsp?error=duplicado");
            return;
        }

        try (Connection conexion = Conexion.conectar()) {
            String sql = "INSERT INTO productos (nombre, descripcion, valor_carbono) VALUES (?, ?, ?)";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setInt(3, producto.getValor_carbono());
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/vista/admin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/vista/admin.jsp?error=1");
        }
    }
    
    private boolean existeProducto(String nombreProducto) {
        try (Connection conexion = Conexion.conectar()) {
            String sql = "SELECT COUNT(*) AS count FROM productos WHERE nombre = ?";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ps.setString(1, nombreProducto);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                return count > 0; // Si count > 0, el producto existe
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
