package App

import Clases.ClaseAsiento
import Clases.Avion
import Clases.Asiento

class AterrizarApp {
	def static void main(String[] args) {
		
		val primeraClase = new ClaseAsiento =>[
			precioClase = 35000
		]
		
		val bussisnes = new ClaseAsiento =>[
			precioClase = 22000
		]
		
		val turista = new ClaseAsiento =>[
			precioClase = 10000
		]
		
		val Boeing747 = new Avion =>[
			nombre = "Boeing747"
		]
		
		val AirbusA320 = new Avion =>[
			nombre = "AirbusA320"
		]
		
		val Tu204 = new Avion =>[
			nombre = "Tu204"
		]
		
		val Il96 = new Avion =>[
			nombre = "Il96"
		]
		
		val CRJ200 = new Avion =>[
			nombre = "CRJ200"
		]
		
		val Boeing777 = new Avion =>[
			nombre = "Boeing777"
		]
		
		val Boeing767 = new Avion =>[
			nombre = "Boeing767"
		]
		
		val Boeing757 = new Avion =>[
			nombre = "Boeing757"
		]
		
		val AirbusA380 = new Avion =>[
			nombre = "AirbusA380"
		]
		
		val asiento1 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		val asiento2 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento3 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		//XTRest.startInstance(16005, new DefensorRestAPI(repoUsuario, repoVuelo))
	}
}