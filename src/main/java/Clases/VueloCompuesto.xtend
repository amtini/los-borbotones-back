package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList
import java.util.List
import java.time.temporal.ChronoUnit
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.OneToMany
import javax.persistence.FetchType

@Entity
@Observable
@Accessors
class VueloCompuesto extends Vuelo{
	
	@Id
	@GeneratedValue //(strategy = GenerationType.AUTO)
	Long id
	
	@OneToMany(fetch=FetchType.LAZY)
	List<Vuelo> escalas = new ArrayList<Vuelo>
	
	override getDuracionDeVuelo(){
		//ChronoUnit.HOURS.between(escalas.head().horarioDePartida,escalas.last().horarioDeLlegada)
		escalas.fold(0.0, [acum, vuelo | acum + vuelo.duracionDeVuelo ])
	}
	
	override precioDeVuelo(){
		(precioBase + aerolinea.precioAsiento) * 0.9 * avion.recargoUltimosPasajes
		//TODO VER REUTILIZACION
	}
	

	override getCantidadEscalas(){
		escalas.size
	}
	
	def boolean tieneEscalas(){
		getCantidadEscalas > 1
	}
}