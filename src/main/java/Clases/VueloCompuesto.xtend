package Clases

import java.util.ArrayList
import java.util.List
import javax.persistence.Entity
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Embedded

@Entity
@Observable
@Accessors
class VueloCompuesto extends Vuelo {
	
	@Embedded
	List<Vuelo> escalas = new ArrayList<Vuelo>

	override getDuracionDeVuelo() {
		escalas.fold(0.0, [acum, vuelo|acum + vuelo.duracionDeVuelo])
	}

	override precioDeVuelo() {
		(precioBase + aerolinea.precioAsiento) * 0.9 * avion.recargoUltimosPasajes
	}

	override getCantidadEscalas() {
		escalas.size
	}

	def boolean tieneEscalas() {
		getCantidadEscalas > 1
	}
}
