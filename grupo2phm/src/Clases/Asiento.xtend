package Clases

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Asiento {
	String id
	
	boolean alLadoDeLaVentana
	boolean disponible
	
	ClaseAsiento claseDeAsiento
	
	def precio(){
		claseDeAsiento.precioClase
	}
}