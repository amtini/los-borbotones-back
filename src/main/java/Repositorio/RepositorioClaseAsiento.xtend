package Repositorio

import Clases.Asiento
import Clases.ClaseAsiento
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioClaseAsiento extends Repositorio<ClaseAsiento>{
	
	override getEntityType() {
		ClaseAsiento
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<ClaseAsiento> query, Root<ClaseAsiento> camposCandidato, ClaseAsiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def ClaseAsiento searchByID(Long id) {
		val criteria = entityManager.criteriaBuilder
		val query = criteria.createQuery(getEntityType)
		val from = query.from(getEntityType)
		// evita n + 1 queries
		//fromEntidad.fetch("proveedores")
		query.select(from).where(criteria.equal(from.get("id"),id))
		val finalQuery = entityManager.createQuery(query)
		finalQuery.singleResult
	}
	
}