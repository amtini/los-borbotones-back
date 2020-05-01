package Repositorio

import Clases.Avion

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAvion extends Repositorio<Avion> {
	
	override getEntityType() {
		Avion
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Avion> query, Root<Avion> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<Avion> from) {
	}
}