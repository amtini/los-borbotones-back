package Repositorio

import Clases.Vuelo

import App.FiltrosVuelo
import App.FiltrosAsiento
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioVuelo extends Repositorio<Vuelo>{
	
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
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Vuelo> query, Root<Vuelo> camposUsuario, Long id) {
		if (id !== null) {
			query.where(criteria.equal(camposUsuario.get("ID"), id))
		} 
	}
	
	override fetch(Root<Vuelo> from) {
		from.fetch("avion").fetch("asientos").fetch("claseDeAsiento")
		from.fetch("aerolinea")
	}
	
}