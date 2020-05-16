package Repositorio

import java.util.Set
import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

interface Entidad {

	def String getID()

	def String setID(String id)

}

@Accessors
abstract class Repositorio<T extends Entidad> {

	Set<T> elementos = new HashSet<T>
	int id = 0

	def void create(T element) {
		if (element.getID === null) {
			id++
			element.setID(newID)
			elementos.add(element)
		} else {
			elementos.add(element)
		}
	}
	
	def createIfNotExists(T element) {
		if (searchByID(element.ID) === null){
			create(element)
		}
	}

	def String newID() {
		getTipo + id.toString()
	}

	def delete(T element) {
		elementos.remove(element)
	}

	def update(T elementoNuevo) {
		var id = elementoNuevo.getID()
		var elementoViejo = searchByID(id)
		delete(elementoViejo)
		create(elementoNuevo)
	}

	def searchByID(String id) {
		elementos.findFirst(element|element.getID == id)
	}

	def List<T> search(String value) {
		elementos.filter[condicionDeBusqueda(it, value)].toList
	}

	def boolean condicionDeBusqueda(T el, String value)

	def String getTipo()
}