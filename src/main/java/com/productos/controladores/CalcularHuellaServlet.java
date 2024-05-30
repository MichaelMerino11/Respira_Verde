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

@WebServlet("/calcularHuella")
public class CalcularHuellaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double consumoEnergia = Double.parseDouble(request.getParameter("energia"));
        double consumoAgua = Double.parseDouble(request.getParameter("agua"));
        double huellaTotal = 0;

        try (Connection conexion = Conexion.conectar()) {
            String sql = "SELECT * FROM productos";
            PreparedStatement ps = conexion.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int valorCarbono = rs.getInt("valor_carbono");
                String paramName = "producto_" + id;
                String horasUso = request.getParameter(paramName);
                if (horasUso != null && !horasUso.isEmpty()) {
                    double horas = Double.parseDouble(horasUso);
                    huellaTotal += horas * valorCarbono;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/vista/usuario.jsp?error=2");
            return;
        }

        // Supongamos que 1 kWh = 0.5 kg CO2 y 1000 litros de agua = 1 kg CO2
        huellaTotal += consumoEnergia * 0.5;
        huellaTotal += consumoAgua / 1000.0;

        response.sendRedirect(request.getContextPath() + "/vista/usuario.jsp?resultado=" + huellaTotal);
    }
}
