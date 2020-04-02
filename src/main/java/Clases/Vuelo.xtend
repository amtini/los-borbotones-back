package Clases

import Repositorio.Entidad
import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import App.FiltrosAsiento
import App.FiltrosVuelo

@Accessors
public class Vuelo implements Entidad{
	String ID
	
	String ciudadDeOrigen
	String ciudadDeDestino
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
		ciudadDeDestino == filtros.destino && ciudadDeOrigen == filtros.origen /* && horarioDePartida >= desde && horarioDePartida <= hasta */ && avion.asientosDisponibles.exists[ it.ventana == filtros.ventanilla] && avion.asientosDisponibles.exists[it.claseDeAsiento.nombre == filtros.claseAsiento]
	}
	
	def dameAsientos(FiltrosAsiento filtros) {
		avion.asientosFiltrados(filtros)
	}
	
}