package Clases

import App.FiltrosAsiento
import App.FiltrosVuelo
import java.time.LocalDate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.CascadeType
import javax.persistence.OneToOne

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

	def cumpleLosFiltros(FiltrosVuelo filtros) {
		val primerFiltro = (avion.asientosDisponibles.exists[it.ventana == filtros.ventanilla])
		if (filtros.origen !== "" && filtros.destino !== "" && filtros.claseAsiento !== "") {
			return primerFiltro && ciudadDeDestino == filtros.destino && ciudadDeOrigen == filtros.origen &&
				avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if (filtros.destino !== "" && filtros.claseAsiento !== "") {
			return primerFiltro && ciudadDeDestino == filtros.destino && avion.asientosDisponibles.exists [
				it.claseDeAsiento.nombre == filtros.claseAsiento
			]
		}
		if (filtros.origen !== "" && filtros.claseAsiento !== "") {
			return primerFiltro && ciudadDeOrigen == filtros.origen && avion.asientosDisponibles.exists [
				it.claseDeAsiento.nombre == filtros.claseAsiento
			]
		}
		if (filtros.destino !== "") {
			return primerFiltro && ciudadDeDestino == filtros.destino
		}
		if (filtros.origen !== "") {
			return primerFiltro && ciudadDeOrigen == filtros.origen
		}
		if (filtros.claseAsiento !== "") {
			return primerFiltro && avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if (filtros.origen == "" && filtros.destino == "" && filtros.claseAsiento == "") {
			return primerFiltro
		}
	}

	def dameAsientos(FiltrosAsiento filtros) {
		avion.asientosFiltrados(filtros)
	}

}
