package Clases

import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Entity
import org.bson.types.ObjectId
import org.mongodb.morphia.annotations.Id
import org.mongodb.morphia.annotations.Embedded
import javax.persistence.OneToOne
import javax.persistence.FetchType
import javax.persistence.CascadeType

@Observable
@Accessors
@Entity(value="Vuelos")
class Vuelo{

	@Id ObjectId ID

	String ciudadDeOrigen

	String ciudadDeDestino

	LocalDate horarioDePartida

	Aerolinea aerolinea

	@Embedded
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
