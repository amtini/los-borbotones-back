package Repositorio

import Clases.Avion

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAvion extends Repositorio<Avion> {
		
		
	
		def Avion searchByID(Long id) {
		val criteria = entityManager.criteriaBuilder
		val query = criteria.createQuery(getEntityType)
		val from = query.from(getEntityType)
		// evita n + 1 queries
		//fromEntidad.fetch("proveedores")
		query.select(from).where(criteria.equal(from.get("id"),id))
		val finalQuery = entityManager.createQuery(query)
		finalQuery.singleResult
	}
	
	override getEntityType() {
		Avion
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Avion> query, Root<Avion> camposCandidato, Avion t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
	
	
}