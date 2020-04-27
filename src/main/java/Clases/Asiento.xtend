package Clases

import javax.persistence.CascadeType
import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.OneToOne

@Entity
@Observable
@Accessors
class Asiento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID // TODO: hay que ver como cambiar este string a Long

	@Column(columnDefinition="TINYINT")
	public boolean ventana 

	@Column(columnDefinition="TINYINT")
	// boolean ventana
	boolean disponible

//	@OneToOne(fetch=FetchType.LAZY)
//	Aerolinea aerolinea
	
	@ManyToOne(fetch=FetchType.LAZY)
	ClaseAsiento claseDeAsiento

	def precio() {
		claseDeAsiento.precioClase
	}

}
