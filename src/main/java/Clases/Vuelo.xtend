package Clases

import Repositorio.Entidad
import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
public class Vuelo implements Entidad{
	String ID
	
	String ciudadDeOrigen
	String ciudadDeDestino
	LocalDate horarioDePartida
	Aerolinea aerolinea
	Double duracionDeVuelo
	Avion avion
	
	int cantidadEscalas
	
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
	
	def cumpleLosFiltros(String origen_, String destino_, LocalDate desde, LocalDate hasta, Boolean ventanilla, ClaseAsiento claseAsiento){
		ciudadDeDestino == destino_ && ciudadDeOrigen == origen_ && horarioDePartida >= desde && horarioDePartida <= hasta  && avion.asientosDisponibles.exists[ it.ventana == ventanilla] && avion.asientosDisponibles.exists[it.claseDeAsiento == claseAsiento]
	}	
}