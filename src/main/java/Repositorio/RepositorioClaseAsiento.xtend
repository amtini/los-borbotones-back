package Repositorio

import Clases.ClaseAsiento
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioClaseAsiento extends Repositorio<ClaseAsiento>{
	
	override getEntityType() {
		ClaseAsiento
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<ClaseAsiento> query, Root<ClaseAsiento> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		} 
	}
	
	override fetch(Root<ClaseAsiento> from) {
	}
	
}