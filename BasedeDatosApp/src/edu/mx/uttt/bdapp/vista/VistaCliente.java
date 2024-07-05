
package edu.mx.uttt.bdapp.vista;

import edu.mx.uttt.bdapp.conexion.Conexion;
import edu.mx.uttt.bdapp.entidades.Cliente;
import edu.mx.uttt.bdapp.control.CtrlCliente;

public class VistaCliente {
    public static void main(String[] args) {
  
        Conexion.conectar();   
        
        Cliente cl = new Cliente();
        cl.setCustomerId("DSMG3");
        cl.setCompanyName("Gallina de Hule");
        cl.setContactName("Lizeth Kazumi Pando");
        cl.setContactTitle("Gerente de Asi");
        cl.setAddress("Av. Libre");
        cl.setCity("Salte si puede");
        cl.setRegion("Este");
        cl.setPostalCode("42800");
        cl.setCountry("Irlanda");
        cl.setPhone("556-325543");
        cl.setFax("surf123@gmail.com");
        
        // enviar el objeto cliente al control cliente
        
        CtrlCliente ctrlCli =new CtrlCliente();
        ctrlCli.agregar(cl);
        
        
        
        
        
        
        
        
        
        
        
        
    }
}
