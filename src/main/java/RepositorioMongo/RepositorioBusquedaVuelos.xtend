package RepositorioMongo

import Filtros.FiltrosVuelo

class RepositorioBusquedaVuelos extends RepoPersistencia<FiltrosVuelo> {

	override getEntityType() {
		FiltrosVuelo
	}

	override searchByExample(FiltrosVuelo t) {
		throw new UnsupportedOperationException("TODO: Operacion no soportada")
	}

	override defineUpdateOperations(FiltrosVuelo t) {
		throw new UnsupportedOperationException("TODO: Operacion no soportada")
	}

}
