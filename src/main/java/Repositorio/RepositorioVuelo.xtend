package Repositorio

import App.FiltrosAsiento
import Clases.Vuelo
import java.time.LocalDate
import java.util.Set
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.JoinType
import javax.persistence.criteria.Root

class RepositorioVuelo extends Repositorio<Vuelo> {

	def asientosDeMiVuelo(Long id, FiltrosAsiento filtros) {
		val avion = searchByID(id)
		avion.dameAsientos(filtros)
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

	def searchFiltros(String origen, String destino, Boolean ventanilla, String claseAsiento, Boolean disponible,
		LocalDate desde, LocalDate hasta) { // , LocalDate fechaDesde, LocalDate fechaHasta
		val entityManager = singletonDeEntityManager.getEntityManager
		try {
			val criteria = entityManager.criteriaBuilder // criteria =  aerolinea.avion_asiento av ON v.Avion_ID =  av.Avion_ID
			val query = criteria.createQuery(entityType) // vuelo
			val from = query.from(entityType) // voy hacer select from avion y lo meto en una variable que se llama from
			val tAvion = from.join("avion", JoinType.INNER)
			val tAsiento = tAvion.joinSet("asientos", JoinType.INNER)
			val tClaseAsiento = tAsiento.join("claseDeAsiento", JoinType.INNER)

			query.where(criteria.equal(tAsiento.get("ventana"), ventanilla))

			query.where(criteria.equal(tAsiento.get("habilitado"), disponible))

			if (!claseAsiento.isNullOrEmpty) {
				query.where(criteria.equal(tClaseAsiento.get("nombre"), claseAsiento))
			}

			if (!origen.isNullOrEmpty) {
				query.where(criteria.equal(from.get("ciudadDeOrigen"), origen))
			}

			if (!destino.isNullOrEmpty) {
				query.where(criteria.equal(from.get("ciudadDeDestino"), destino))
			}

			val result = entityManager.createQuery(query).resultList.toSet

			return filtroFechas(result, desde, hasta)

		} finally {
			
		}
	}

	def filtroFechas(Set<Vuelo> vuelos, LocalDate desde, LocalDate hasta) {
		println("Estoy en el filtro de fechas con el hasta " + hasta)
		if (hasta !== null) {
			println("Estoy en el filtro de fechas y entre al if con el hasta " + hasta)
			vuelos.filter[it|it.horarioDePartida >= desde && it.horarioDePartida <= hasta]
		} else {
			vuelos.filter[it|it.horarioDePartida >= desde]
		}
	}
}
