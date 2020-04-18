package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Column

@Entity
@Observable
@Accessors
class Asiento implements Entidad{
	
	@Id
	@GeneratedValue //(strategy = GenerationType.AUTO)
	String ID	//TODO: hay que ver como cambiar este string a Long
	
	@Column(columnDefinition = "TINYINT")
//@Type  //(type = "org.hibernate.type.NumericBooleanType") TODO: en teoria deberiamos usar este no estoy seguropara el booleano, lo dejo para chekear
public boolean ventana = true;

	//boolean ventana
	boolean disponible
	
	ClaseAsiento claseDeAsiento = new ClaseAsiento
	
	def precio(){
		claseDeAsiento.precioClase
	}
	
	override getID() {
		ID
	}
	
	override setID(String idd) {
		ID = idd
	}
}