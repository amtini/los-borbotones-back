package Repositorio

import Clases.Asiento

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAsiento extends Repositorio<Asiento>{
	
	override getEntityType() {
		Asiento
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Asiento> query, Root<Asiento> camposAsiento, Asiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Asiento> query, Root<Asiento> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<Asiento> from) {
	}
	
	
}