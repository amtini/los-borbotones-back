package Clases

import javax.persistence.Entity
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Asiento {
	
	@Id Object id
	Long ID
	
	public boolean ventana 
	
	boolean habilitado
	
	String claseDeAsiento
	
	double precio
}
