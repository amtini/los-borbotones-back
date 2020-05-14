package Clases

import java.time.LocalDate
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Entity

@Observable
@Accessors
@Entity(value="Vuelos")
class Vuelo{

	@Id Object id
	Long ID // TODO: VER EL STRING

	String ciudadDeOrigen

	String ciudadDeDestino

	LocalDate horarioDePartida

	Aerolinea aerolinea

	Avion avion

	Double duracionDeVuelo

	int cantidadEscalas = 1

	Double precioBase

	def precioDeVuelo() {
		(precioBase + aerolinea.precioAsiento) * avion.recargoUltimosPasajes
	}

	def precioMinimoPasaje() {
		precioDeVuelo() + avion.asientoMasBarato.precio
	}
}
