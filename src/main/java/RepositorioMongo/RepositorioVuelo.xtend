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
		
			query.field("avion.asientos.habilitado")
		 		.equal(true)
			
		  	query.field("avion.asientos.ventana")
		  		.equal(filtroVuelo.ventanilla)
		  
		  
		  	if (!filtroVuelo.claseAsiento.isNullOrEmpty) {
		  		query.field("avion.asientos.claseDeAsiento")
		  			.equal(filtroVuelo.claseAsiento)
		  	}
		  
		  
		  	
		}
		return query.asList.toSet 
		
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
		vuelo.avion.asientosFiltrados(filtros)
	}
}
