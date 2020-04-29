package Clases

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Asiento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID
	
	@Column
	public boolean ventana 
	
	@Column
	boolean habilitado
	
	@ManyToOne(fetch=FetchType.LAZY)
	ClaseAsiento claseDeAsiento
	
	def precio() {
		claseDeAsiento.precioClase
	}
}
