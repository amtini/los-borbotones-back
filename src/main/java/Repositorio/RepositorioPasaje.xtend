package Repositorio

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

import Clases.Pasaje


class RepositorioPasaje extends Repositorio<Pasaje>  {

	
		def Pasaje searchByID(Long id) {
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
		Pasaje
	}
	

	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Pasaje> query, Root<Pasaje> camposCandidato, Pasaje t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}