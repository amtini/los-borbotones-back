package Clases

import Repositorio.Entidad
import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import App.FiltrosAsiento
import App.FiltrosVuelo
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Column
import javax.persistence.Temporal
import javax.persistence.TemporalType

@Accessors
public class Vuelo implements Entidad{
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	String ID
	
	@Column(length=150)
	String ciudadDeOrigen
	
	@Column(length=150)
	String ciudadDeDestino
	
	@Temporal(TemporalType.DATE)
	LocalDate horarioDePartida
	
	
	Aerolinea aerolinea
	
	
	Double duracionDeVuelo
	Avion avion
	
	int cantidadEscalas = 1
	
	Double precioBase
	
	override getID() {
		ID
	}
	
	override setID(String idd) {
		ID  = idd
	}
	
	def precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * avion.recargoUltimosPasajes
	}
	
	def precioMinimoPasaje(){
		precioDeVuelo() + avion.asientoMasBarato.precio
	}
	
	def cumpleLosFiltros(FiltrosVuelo filtros){
		val primerFiltro = (avion.asientosDisponibles.exists[ it.ventana == filtros.ventanilla])
		if(filtros.origen !== "" && filtros.destino !== "" && filtros.claseAsiento !== ""){
			return primerFiltro && ciudadDeDestino == filtros.destino && ciudadDeOrigen == filtros.origen &&  avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if(filtros.destino !== "" && filtros.claseAsiento !== ""){
			return primerFiltro && ciudadDeDestino == filtros.destino &&  avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if(filtros.origen !== "" && filtros.claseAsiento !== ""){
			return primerFiltro && ciudadDeOrigen == filtros.origen &&  avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if(filtros.destino !== ""){
			return primerFiltro && ciudadDeDestino == filtros.destino
		}
		if(filtros.origen !== ""){
			return primerFiltro && ciudadDeOrigen == filtros.origen
		}
		if(filtros.claseAsiento !== ""){
			return primerFiltro && avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
		}
		if(filtros.origen == "" && filtros.destino == "" && filtros.claseAsiento == ""){
			return primerFiltro
		}
	}
	
	def dameAsientos(FiltrosAsiento filtros) {
		avion.asientosFiltrados(filtros)
	}
	
}