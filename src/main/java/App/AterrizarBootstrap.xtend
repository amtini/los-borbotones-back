package App

import Clases.ClaseAsiento
import Clases.Avion
import Clases.Asiento
import Clases.Aerolinea
import Clases.Vuelo
import java.time.LocalDate

class AterrizarBootstrap {
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
			nombre = "Boeing 747"
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
		
		//aerolineas
		
		val AerolineasArgentinas = new Aerolinea =>[
			nombre = "Aerolineas Argentinas"
			precioAsiento = 20.0
		]
		
		val Luftansa = new Aerolinea =>[
			nombre = "Luftansa"
			precioAsiento = 1000.0
		]
		
		val Luftansa = new Aerolinea =>[
			nombre = "Luftansa"
			precioAsiento = 1000.0
		]
		
		
		//DECLARACION
		//vuelos: ciduad origine y destino, horario de partida, asignarle el avion, asignar aerolinea (hay qeu declararla), valor de precio base, duracion de vuelo
		//crear los usuarios
		//vuelos compuestos: 
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		//agregamos los asientos al avion 
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
		
		Boeing747.agregarAsiento(asiento1)
		Boeing747.agregarAsiento(asiento2)
		Boeing747.agregarAsiento(asiento3)
		
		// vuelo 2
		
		val vueloBSaJamaica = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Kingston"
	       horarioDePartida = LocalDate.of(2020,02,01)
	       aerolinea = Luftansa
	       duracionDeVuelo = 7.0
	       avion = Boeing747
	       precioBase = 50000.0
		]
		
		val asiento4 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		val asiento5 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		val asiento6 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		//avion 3
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento7 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento8 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento9 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		//avion 4
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento10 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento11 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = turista
		]
		
		val asiento12 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		//avion 5
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento13 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = turista
		]
		
		val asiento14 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = turista
		]
		
		val asiento15 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = turista
		]
		
		//avion 6
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento16 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		val asiento17 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = turista
		]
		
		val asiento18 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		//avion 7
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento19 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = turista
		]
		
		val asiento20 = new Asiento =>[
			ventana = true
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento21 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
		//avion 8
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,01,01)
	       aerolinea = AerolineasArgentinas
	       duracionDeVuelo = 5.0
	       avion = Boeing747
	       precioBase = 8000.0
		]
		
		val asiento22 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento23 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = bussisnes
		]
		
		val asiento24 = new Asiento =>[
			ventana = false
			disponible = true
			claseDeAsiento = primeraClase
		]
		
	
		
		
		
		//XTRest.startInstance(16005, new DefensorRestAPI(repoUsuario, repoVuelo))
	}
}