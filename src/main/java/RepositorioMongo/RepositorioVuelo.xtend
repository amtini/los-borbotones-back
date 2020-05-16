package RepositorioMongo

import Clases.Vuelo
import Filtros.FiltrosVuelo
import Filtros.FiltrosAsiento
import org.bson.types.ObjectId
import java.util.Set

class RepositorioVuelo extends RepoPersistencia<Vuelo> {

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
			query.field("asereje a deje").equal(vuelo)
		}

		query.asList
	}

	def searchByID(String vueloID) {
		val query = ds.createQuery(entityType)
		println("lo que me llega del front " + vueloID)
		println("lo que le mando a mongo " + new ObjectId(vueloID))
		if (vueloID !== null) {
			query.field("ID").equal(new ObjectId(vueloID))
		}

		query.get
	}

	def searchFiltros(FiltrosVuelo filtroVuelo) {
		val query = ds.createQuery(entityType)
		if (filtroVuelo !== null) {

			if (!filtroVuelo.origen.isNullOrEmpty) {
				query.field("ciudadDeOrigen").equal(filtroVuelo.origen)
			}

			if (!filtroVuelo.destino.isNullOrEmpty) {
				query.field("ciudadDeDestino").equal(filtroVuelo.destino)
			}

			if (filtroVuelo.desde !== null) {
				query.field("horarioDePartida").greaterThan(filtroVuelo.desde)
			}

			if (filtroVuelo.hasta !== null) {
				query.field("horarioDePartida").lessThan(filtroVuelo.hasta)
			}

		// chequear comportamiento de mongo al utilizar query con listas
		/*
		 * query.field("avion.asientos.ventana")
		 * 	.equal(filtroVuelo.ventanilla)
		 * 
		 * 
		 * if (filtroVuelo.claseAsiento !== null) {
		 * query.field("avion.asientos.claseAsiento")
		 * 	.equal(filtroVuelo.claseAsiento)
		 * }
		 * 
		 * 
		 * query.field("habilitado")
		 .equal(filtroVuelo.disponible)*/
		}

		val result = query.asList.toSet //TODO: fijarse de filtrarlo en la query

		return filtroFechas(result, filtroVuelo.claseAsiento, filtroVuelo.ventanilla)
	}

	override defineUpdateOperations(Vuelo vuelo) {
		val operations = ds.createUpdateOperations(entityType)
		if (vuelo.avion === null) {
			operations.unset("fechaRetorno")
		} else {
			// No tiene sentido modificar el libro o el usuario
			// .set("libro", prestamo.libro)
			// .set("usuario", prestamo.usuario)
			// solo la fecha de devolucion cuando lo devuelve
			operations.set("avion", vuelo.avion)
		}
	}

	def asientosDeMiVuelo(String id, FiltrosAsiento filtros) {
		val vuelo = searchByID(id)
		println(vuelo.ciudadDeDestino)
		println("asientos " + vuelo.avion.asientosFiltrados(filtros))
		vuelo.avion.asientosFiltrados(filtros)
	}

	def filtroFechas(Set<Vuelo> vuelos, String claseAsiento, Boolean ventanilla) {

		vuelos.filter[it|it.avion.filtroAsientosVuelo(claseAsiento, ventanilla)]

	}
}
