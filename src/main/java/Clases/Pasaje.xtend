package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.Column
import javax.persistence.Temporal
import javax.persistence.TemporalType
import javax.persistence.GenerationType

@Entity
@Observable
@Accessors
class Pasaje {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id

	Vuelo vuelo
	Asiento asiento

	@Column(length=150)
	Double costo

	@Column
	LocalDate comprado

	new(Vuelo vuelo_, Asiento asiento_, Double costo_, LocalDate comprado_) {
		vuelo = vuelo_
		asiento = asiento_
		costo = costo_
		comprado = comprado_
	}
}
