package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate

@Accessors
class Pasaje{
	
	Vuelo vuelo
	Asiento asiento
	double costo
	LocalDate comprado
	
	new(Vuelo vuelo_, Asiento asiento_, double costo_){
		vuelo = vuelo_
		asiento = asiento_
		costo = costo_
		comprado = LocalDate.now
	}
}