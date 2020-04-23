package Clases

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.OneToOne
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Asiento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID // TODO: hay que ver como cambiar este string a Long
	
	@Column(columnDefinition="TINYINT")
	// @Type  //(type = "org.hibernate.type.NumericBooleanType") TODO: en teoria deberiamos usar este no estoy seguropara el booleano, lo dejo para chekear
	public boolean ventana = true;

	// boolean ventana
	boolean disponible
	
	@OneToOne(fetch=FetchType.LAZY)
	ClaseAsiento claseDeAsiento = new ClaseAsiento

	def precio() {
		claseDeAsiento.precioClase
	}

}
