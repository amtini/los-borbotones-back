package RepositorioMongo

import Filtros.FiltrosVuelo

class RepositorioBusquedaVuelos extends RepoPersistencia<FiltrosVuelo> {

	override getEntityType() {
		FiltrosVuelo
	}

	def searchByExample(String idUsuario) {
		val query = ds.createQuery(entityType)
		if (idUsuario.isNullOrEmpty) {
			query.field("idUsuario").equal(idUsuario)
		}

		query.asList.toSet
	}

	override defineUpdateOperations(FiltrosVuelo t) {
	}
	
	override searchByExample(FiltrosVuelo t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
