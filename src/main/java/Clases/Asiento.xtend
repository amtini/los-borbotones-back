package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad

@Accessors
class Asiento implements Entidad{
	String ID
	
	boolean ventana
	boolean disponible
	
	ClaseAsiento claseDeAsiento = new ClaseAsiento
	
	def precio(){
		claseDeAsiento.precioClase
	}
	
	override getID() {
		ID
	}
	
	override setID(String idd) {
		ID = idd
	}
}