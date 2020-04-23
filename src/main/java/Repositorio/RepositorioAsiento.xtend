package Repositorio

import Clases.Asiento
import org.eclipse.xtend.lib.annotations.Accessors
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioAsiento extends Repositorio<Asiento>{
	@Accessors String tipo = "A"
	
	def Asiento searchByID(Long id) {
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
		Asiento
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Asiento> query, Root<Asiento> camposAsiento, Asiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
}