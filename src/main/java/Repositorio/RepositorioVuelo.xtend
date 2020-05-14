package Repositorio

import Clases.Vuelo

class RepositorioVuelo extends RepoPersistencia<Vuelo> {

	/*def asientosDeMiVuelo(Long id, FiltrosAsiento filtros) {
		val vuelo = searchByID(id)
		vuelo.avion.asientosFiltrados(filtros)
	}*/

	override getEntityType() {
		Vuelo
	}
	
	def createWhenNew(Vuelo vuelo) {
		if (searchByExample(vuelo).isEmpty) {
			this.create(vuelo)
		}
	}
	
	override searchByExample(Vuelo vuelo) {
		val query = ds.createQuery(entityType)
		if (vuelo !== null) {
			query.field("ID")
				.equal(vuelo.ID)
		}
		
		query.asList
	}
	
	override defineUpdateOperations(Vuelo vuelo) {
		val operations = ds.createUpdateOperations(entityType)
		if (vuelo.avion === null) {
			operations.unset("fechaRetorno")
		} else {
			// No tiene sentido modificar el libro o el usuario
			//.set("libro", prestamo.libro)
			//.set("usuario", prestamo.usuario)
			// solo la fecha de devolucion cuando lo devuelve
			operations.set("avion", vuelo.avion)
		}
	}

	
	/*def searchByFilter(Vuelo vuelo) {
		val query = ds.createQuery(entityType)
		if (vuelo !== null) {
			query.field("ID")
				.equal(vuelo.ID)
		}
		
		query.asList
	}*/
	


	/*override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Vuelo> query, Root<Vuelo> camposUsuario, Long id) {
		if (id !== null) {
			query.where(criteria.equal(camposUsuario.get("ID"), id))
		}
	}

	override fetch(Root<Vuelo> from) {
		from.fetch("avion").fetch("asientos").fetch("claseDeAsiento")
		from.fetch("aerolinea")
	}

	def searchFiltros(String origen, String destino, Boolean ventanilla, String claseAsiento, Boolean disponible, LocalDate desde, LocalDate hasta) { 
		val entityManager = singletonDeEntityManager.getEntityManager
		try {
			val criteria = entityManager.criteriaBuilder 
			val query = criteria.createQuery(entityType) 
			val from = query.from(entityType)
			
			
			query.where(newArrayList => [
				
				if (!origen.isNullOrEmpty) {		
					add(criteria.equal(from.get("ciudadDeOrigen"), origen))		
				}
				
				if (!destino.isNullOrEmpty) {		
					add(criteria.equal(from.get("ciudadDeDestino"), destino))		
				}	
				
				if(hasta !== null){
					add(criteria.lessThan(from.get("horarioDePartida"), hasta))
				}
				
				add(criteria.greaterThan(from.get("horarioDePartida"), desde))
				
			])	
			
			
			
			
			val result = entityManager.createQuery(query).resultList.toSet
			
			return filtroFechas(result, claseAsiento, ventanilla)
			
		} finally {
			
		}
	}*/
	
	/*def filtroFechas(Set<Vuelo> vuelos, String claseAsiento, Boolean ventanilla) {
			
			vuelos.filter[it|  it.avion.filtroAsientosVuelo(claseAsiento, ventanilla)]
			
	}*/
}