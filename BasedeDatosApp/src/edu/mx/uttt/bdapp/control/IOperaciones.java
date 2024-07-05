/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package edu.mx.uttt.bdapp.control;
import java.util.List;
/**
 *
 * @author jlgallardoadmon
 */
public interface IOperaciones {
    void agregar(Object obj);
    boolean eliminar(Object obj);
    boolean actualizar(Object obj);
    List<Object> consultar();
}
