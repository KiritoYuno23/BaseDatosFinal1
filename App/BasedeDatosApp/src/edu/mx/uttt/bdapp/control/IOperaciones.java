
package edu.mx.uttt.bdapp.control;
import edu.mx.uttt.bdapp.entidades.Cliente;
import java.util.List;
public interface IOperaciones {
    
    void agregar(Object obj);
    boolean eliminar (Object obj);
    boolean actualizar(Object obj);
    List<Object> consultar();
    
}
