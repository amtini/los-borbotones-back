package RepositorioMongo

import Filtros.FiltrosVuelo

class RepositorioBusquedaVuelos extends RepoPersistencia<FiltrosVuelo> {

	override getEntityType() {
		FiltrosVuelo
	}

	override searchByExample(FiltrosVuelo t) {
	}

	override defineUpdateOperations(FiltrosVuelo t) {
	}
}
