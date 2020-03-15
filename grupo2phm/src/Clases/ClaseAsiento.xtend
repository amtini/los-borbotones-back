package Clases

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class ClaseAsiento {
	float precioClase
}

class PrimeraClase extends ClaseAsiento{
	override getPrecioClase(){
		5000
	}
}

class Bussisnes extends ClaseAsiento{
	override getPrecioClase(){
		2500
	}
}

class Turista extends ClaseAsiento{
	override getPrecioClase(){
		500
	}
}