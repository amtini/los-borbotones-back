package Repositorio

import Clases.Aerolinea
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAerolinea extends Repositorio<Aerolinea>{
	
	override getEntityType() {
		Aerolinea
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Aerolinea> query, Root<Aerolinea> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<Aerolinea> from) {
	}
}