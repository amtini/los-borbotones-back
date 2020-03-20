package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad

@Accessors
class Asiento implements Entidad{
	String id
	
	boolean alLadoDeLaVentana
	boolean disponible
	
	ClaseAsiento claseDeAsiento
	
	def precio(){
		claseDeAsiento.precioClase
	}
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id = id
	}
	
}