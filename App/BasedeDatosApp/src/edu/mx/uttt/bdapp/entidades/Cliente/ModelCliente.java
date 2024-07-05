/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.mx.uttt.bdapp.entidades.Cliente;

import edu.mx.uttt.bdapp.entidades.Cliente;

public class ModelCliente {

    public boolean agragar(Cliente cli) {

        String resultado = "Clave del cliente" + cli.getCustomerId()
                + "\nNombre del cliente" + cli.getCompanyName()
                + "\nContacto: " + (cli.getCompanyName().equals(" ") ? "Null" : cli.getCompanyName())
                + "\nTitulo" + (cli.getContactTitle().equals(" ") ? "Null" : cli.getContactName());

        System.out.println(resultado);
        return true;
    }

}
