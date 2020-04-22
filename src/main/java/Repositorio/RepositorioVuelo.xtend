package Repositorio

import Clases.Vuelo
import org.eclipse.xtend.lib.annotations.Accessors
import App.FiltrosVuelo
import App.FiltrosAsiento
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioVuelo extends Repositorio<Vuelo>{
	@Accessors String tipo = "V"
	
	def Vuelo searchByID(Long id) {
		val criteria = entityManager.criteriaBuilder
		val query = criteria.createQuery(getEntityType)
		val from = query.from(getEntityType)
		// evita n + 1 queries
		//fromEntidad.fetch("proveedores")
		query.select(from).where(criteria.equal(from.get("id"),id))
		val finalQuery = entityManager.createQuery(query)
		finalQuery.singleResult
	}
	
	def vuelosDisponibles(){
		allInstances.filter[
			vuelo | vuelo.avion.asientosDisponibles.size > 0
		].toList
	}
	
	def vuelosFiltrados(FiltrosVuelo filtros) {
		vuelosDisponibles.filter[ vuelo | vuelo.cumpleLosFiltros(filtros)].toSet
	}
	
	def asientosDeMiVuelo(Long id, FiltrosAsiento filtros) {
		searchByID(id).dameAsientos(filtros)
	}
	
	override getEntityType() {
		Vuelo
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Vuelo> query, Root<Vuelo> camposCandidato, Vuelo t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	
}