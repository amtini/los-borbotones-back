package Repositorio

import Clases.Vuelo

import App.FiltrosVuelo
import App.FiltrosAsiento
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import java.time.LocalDate
import javax.persistence.criteria.JoinType
import javax.persistence.EntityManager

class RepositorioVuelo extends Repositorio<Vuelo> {
	
	EntityManager instance
	
	def vuelosDisponibles() {
		allInstances.filter [ vuelo |
			vuelo.avion.asientosDisponibles.size > 0
		].toList
	}

	def vuelosFiltrados(FiltrosVuelo filtros) {
		vuelosDisponibles.filter[vuelo|vuelo.cumpleLosFiltros(filtros)].toSet
	}

	def asientosDeMiVuelo(Long id, FiltrosAsiento filtros) {
		searchByID(id).dameAsientos(filtros)
	}

	override getEntityType() {
		Vuelo
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

	def searchFiltros(String origen, String destino, Boolean ventanilla, String claseAsiento, Boolean disponible) { // , LocalDate fechaDesde, LocalDate fechaHasta
		val entityManager = this.entityManager
		try {
			
			val criteria = entityManager.criteriaBuilder // criteria =  aerolinea.avion_asiento av ON v.Avion_ID =  av.Avion_ID
			val query = criteria.createQuery(entityType) // vuelo
			val from = query.from(entityType) // voy hacer select from avion y lo meto en una variable que se llama from
			
			//from.fetch("avion", JoinType.LEFT)
			val tAvion = from.join("avion", JoinType.LEFT)
			//tAvion.fetch("asientos", JoinType.LEFT)
			val tAsiento = tAvion.joinSet("asientos", JoinType.LEFT)
			//tAsiento.fetch("claseDeAsiento", JoinType.LEFT)  //ir a buscar o traerme como tenemos un objeto que lazy contra otro no te lo trae
			
			val tClaseAsiento = tAsiento.join("claseDeAsiento", JoinType.LEFT)
			query.where(criteria.equal(tAsiento.get("ventana"), ventanilla))
			
			if (!claseAsiento.isNullOrEmpty) {
				query.where(criteria.equal(tClaseAsiento.get("nombre"), claseAsiento))
			}
			
			// filtros
			
			if (!origen.isNullOrEmpty) {
				query.where(criteria.equal(from.get("ciudadDeOrigen"), origen))
			}
			
			if (!destino.isNullOrEmpty) {
				query.where(criteria.equal(from.get("ciudadDeDestino"), destino))
			}
			
			query.where(criteria.equal(tAsiento.get("habilitado"), disponible ))

			instance = entityManager
			
			val result = entityManager.createQuery(query).resultList.toSet
			
			return result // devuelvo todo
		} finally {
			
		}
	}
	
	def closeSession() {
		instance?.close
	}
}
