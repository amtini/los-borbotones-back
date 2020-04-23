package Clases

import java.time.LocalDate
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.OneToOne

@Entity
@Observable
@Accessors
class Pasaje {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long id
	
	@OneToOne
	Vuelo vuelo
	
	@OneToOne
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
