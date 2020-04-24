package Repositorio

import Clases.Aerolinea
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAerolinea extends Repositorio<Aerolinea>{
	
	def Aerolinea searchByID(Long id) {
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
		Aerolinea
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Aerolinea> query, Root<Aerolinea> camposCandidato, Aerolinea t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}