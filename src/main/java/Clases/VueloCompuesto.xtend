package Clases

import java.util.ArrayList
import java.util.List
import javax.persistence.Entity
import javax.persistence.FetchType
//import javax.persistence.GeneratedValue
//import javax.persistence.GenerationType
//import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.CascadeType

@Entity
@Observable
@Accessors
class VueloCompuesto extends Vuelo {

//	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
//	Long id

	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	List<Vuelo> escalas = new ArrayList<Vuelo>

	override getDuracionDeVuelo() {
		// ChronoUnit.HOURS.between(escalas.head().horarioDePartida,escalas.last().horarioDeLlegada)
		escalas.fold(0.0, [acum, vuelo|acum + vuelo.duracionDeVuelo])
	}

	override precioDeVuelo() {
		(precioBase + aerolinea.precioAsiento) * 0.9 * avion.recargoUltimosPasajes
	// TODO VER REUTILIZACION
	}

	override getCantidadEscalas() {
		escalas.size
	}

	def boolean tieneEscalas() {
		getCantidadEscalas > 1
	}
}
