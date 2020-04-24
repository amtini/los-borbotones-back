package Clases

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.GenerationType

@Entity
@Observable
@Accessors
class ClaseAsiento {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Long ID

	@Column(length=150)
	String nombre

	@Column(length=150)
	float precioClase
}
