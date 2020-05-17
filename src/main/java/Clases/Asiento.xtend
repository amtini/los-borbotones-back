package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.bson.types.ObjectId

@Entity(value="Asientos")
@Observable
@Accessors
class Asiento {
	
	@Id String ID
	
	boolean ventana
	
	boolean habilitado
	
	String claseDeAsiento
	
	double precio
}
