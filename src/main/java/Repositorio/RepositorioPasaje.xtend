package Repositorio

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

import Clases.Pasaje


class RepositorioPasaje extends Repositorio<Pasaje>  {
	
	override getEntityType() {
		Pasaje
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Pasaje> query, Root<Pasaje> campos, Long id) {
		if (id !== null) { 
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<Pasaje> from) {
	}
}