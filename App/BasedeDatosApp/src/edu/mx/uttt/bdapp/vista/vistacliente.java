/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.mx.uttt.bdapp.vista;

import edu.mx.uttt.bdapp.control.CtrlCliente;
import edu.mx.uttt.bdapp.entidades.Cliente;
/**
 *
 * @author AFCB_
 */
public class vistacliente {
    public static void main(String[] args) {
        Cliente cli = new Cliente();
        
        cli.setCustomerId("XYZ");
        cli.setCompanyName("Patito Hule");
        cli.setContactName("Edith");
        
        CtrlCliente ctrlCli = new CtrlCliente();
        ctrlCli.agregar(cli);
        
        
        
    }
}
