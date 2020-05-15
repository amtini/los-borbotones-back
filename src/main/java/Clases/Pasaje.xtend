package Clases

import java.time.LocalDate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Pasaje {
	new(){}
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID
	
	@Column
	String ciudadDeDestino
	
	@Column
	String ciudadDeOrigen
	
	@Column
	String aerolinea
	
	@Column
	LocalDate horarioDePartida
	
	@Column(length=150)
	Double costo
	
	@Column
	LocalDate comprado
	
	new(String ciudadDeDestino_, String ciudadDeOrigen_, String aerolinea_, LocalDate horarioDePartida_, Double costo_, LocalDate comprado_) {
		ciudadDeOrigen = ciudadDeOrigen_
		ciudadDeDestino = ciudadDeDestino_
		aerolinea = aerolinea_
		horarioDePartida = horarioDePartida_
		costo = costo_
		comprado = comprado_
	}
}
