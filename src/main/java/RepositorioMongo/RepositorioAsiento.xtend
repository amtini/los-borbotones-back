package RepositorioMongo

import Clases.Asiento

class RepositorioAsiento extends RepoPersistencia<Asiento>{
	
	override getEntityType() {
		Asiento
	}
	
	override searchByExample(Asiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override defineUpdateOperations(Asiento t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}
