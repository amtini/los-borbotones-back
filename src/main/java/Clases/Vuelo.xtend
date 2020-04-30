package Clases

import App.FiltrosAsiento
import java.time.LocalDate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToOne
import javax.persistence.OneToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Vuelo{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long ID // TODO: VER EL STRING

	@Column(length=150)
	String ciudadDeOrigen

	@Column(length=150)
	String ciudadDeDestino

	@Column
	LocalDate horarioDePartida

	@ManyToOne(fetch=FetchType.LAZY)
	Aerolinea aerolinea

	@OneToOne(fetch=FetchType.LAZY)
	Avion avion

	@Column(length=150)
	Double duracionDeVuelo

	@Column(length=150)
	int cantidadEscalas = 1

	@Column(precision=2)
	Double precioBase

	def precioDeVuelo() {
		(precioBase + aerolinea.precioAsiento) * avion.recargoUltimosPasajes
	}

	def precioMinimoPasaje() {
		precioDeVuelo() + avion.asientoMasBarato.precio
	}

	def dameAsientos(FiltrosAsiento filtros) {
		avion.asientosFiltrados(filtros)
	}

}
