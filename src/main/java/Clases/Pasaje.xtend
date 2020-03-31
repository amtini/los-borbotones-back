package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate

@Accessors
class Pasaje{
	
	Vuelo vuelo
	Asiento asiento
	Double costo
	LocalDate comprado
	
	new(Vuelo vuelo_, Asiento asiento_, Double costo_, LocalDate comprado_) {
		vuelo = vuelo_
		asiento = asiento_
		costo = costo_
		comprado = comprado_
	}
}