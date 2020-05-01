package Clases

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
class Asiento {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID
	
	@Column
	public boolean ventana 
	
	@Column
	boolean habilitado
	
	@Column
	String claseDeAsiento
	
	double precio
}
