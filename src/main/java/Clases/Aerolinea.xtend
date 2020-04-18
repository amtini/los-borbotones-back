package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.GeneratedValue
import javax.persistence.Id
import javax.persistence.GenerationType
import javax.persistence.Column
import javax.persistence.Entity
import org.uqbar.commons.model.annotations.Observable

@Entity
@Observable
@Accessors
class Aerolinea {
	@Id
	@GeneratedValue //(strategy = GenerationType.AUTO)
	Long id
	
	@Column(length=150)
	String nombre
	
	@Column(length=150)
	Double precioAsiento
}