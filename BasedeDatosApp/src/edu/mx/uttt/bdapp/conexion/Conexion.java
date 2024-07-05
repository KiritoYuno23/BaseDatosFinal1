package edu.mx.uttt.bdapp.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection conectar() {

        String url = "jdbc:sqlserver://localhost\\SQLEXPRESS;databaseName=Northwind;encrypt=true;trustServerCertificate=true";

        // credenciales de la BD
        String user = "sa";
        String password = "HolaMundo";

        Connection con = null;

        try {
            // Establecer la conexión
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Conexión exitosa a la base de datos!");

        } catch (SQLException e) {
            System.out.println(e.getMessage());
            System.out.println("Error al conectar a la base de datos.");

        } finally {

            if (con != null) {

                try {
                    con.close();
                } catch (SQLException e) {
                    System.out.println();
                }

            } else {
                System.out.println("La conexion esta cerrada");
            }

        }
        return con;

    }

}
