package Repositorio

import Clases.Asiento
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAsiento extends Repositorio<Asiento>{
	@Accessors String tipo = "A"
	
	override getEntityType() {
		Asiento
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Asiento> query, Root<Asiento> camposAsiento, Asiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}