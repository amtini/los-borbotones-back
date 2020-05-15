package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.bson.types.ObjectId

@Observable
@Accessors
@Entity(value="Aerolinea")
class Aerolinea {
	@Id ObjectId ID

	String nombre

	Double precioAsiento
}
