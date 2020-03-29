package App

import Clases.ClaseAsiento
import Clases.Avion
import Clases.Asiento
import Clases.Aerolinea
import Clases.Vuelo
import java.time.LocalDate
import Clases.VueloCompuesto

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
			precioAsiento = 2000.0
		]
		
		val CopaAirlans = new Aerolinea =>[
			nombre = "Copa Airlans"
			precioAsiento = 700.0
		]
		
		val Varig = new Aerolinea =>[
			nombre = "Varig"
			precioAsiento = 500.0
		]
		
		val LanChile = new Aerolinea =>[
			nombre = "Lan Chile"
			precioAsiento = 300.0
		]
		
		val AirFrance = new Aerolinea =>[
			nombre = "Air France"
			precioAsiento = 1000.0
		]
		
		
		
		// vuelo 1
		
		val vueloBSaRio = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2020,09,01)
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
	       horarioDePartida = LocalDate.of(2020,07,09)
	       aerolinea = Luftansa
	       duracionDeVuelo = 7.0
	       avion = AirbusA320 
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
		
		Boeing747.agregarAsiento(asiento4)
		Boeing747.agregarAsiento(asiento5)
		Boeing747.agregarAsiento(asiento6)
		
		//avion 3
		
		// vuelo 1
		
		val vueloAFrancia = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Paris"
	       horarioDePartida = LocalDate.of(2020,07,01)
	       aerolinea = AirFrance
	       duracionDeVuelo = 17.0
	       avion = Tu204 
	       precioBase = 80000.0
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
		
		Boeing747.agregarAsiento(asiento7)
		Boeing747.agregarAsiento(asiento8)
		Boeing747.agregarAsiento(asiento9)
		
		//avion 4
		
		// vuelo 1
		
		val vueloBSaChile = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Santiago"
	       horarioDePartida = LocalDate.of(2020,07,14)
	       aerolinea = LanChile
	       duracionDeVuelo = 3.0
	       avion = Il96 
	       precioBase = 200.0
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
		
		Boeing747.agregarAsiento(asiento10)
		Boeing747.agregarAsiento(asiento11)
		Boeing747.agregarAsiento(asiento12)
		//avion 5
		
		// vuelo 1
		
		val vueloBSaMiami = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Miami"
	       horarioDePartida = LocalDate.of(2020,08,01)
	       aerolinea = CopaAirlans
	       duracionDeVuelo = 12.0
	       avion = CRJ200 
	       precioBase = 15000.0
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
		
		Boeing747.agregarAsiento(asiento13)
		Boeing747.agregarAsiento(asiento14)
		Boeing747.agregarAsiento(asiento15)
		//avion 6
		
		// vuelo 1
		
		val vueloBSaItalia = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Rio de Janeiro"
	       horarioDePartida = LocalDate.of(2021,06,01)
	       aerolinea = AirFrance
	       duracionDeVuelo = 15.0
	       avion = Boeing777 
	       precioBase = 30000.0
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
		
		Boeing747.agregarAsiento(asiento16)
		Boeing747.agregarAsiento(asiento17)
		Boeing747.agregarAsiento(asiento18)
		//avion 7
		
		// vuelo 1
		
		val vueloBSaAustralia = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Sidney"
	       horarioDePartida = LocalDate.of(2021,03,01)
	       aerolinea = Luftansa
	       duracionDeVuelo = 16.0
	       avion = Boeing767 
	       precioBase = 80000.0
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
		Boeing747.agregarAsiento(asiento19)
		Boeing747.agregarAsiento(asiento20)
		Boeing747.agregarAsiento(asiento21)
		
		//avion 8
		
		// vuelo 1
		
		val vueloBSaInglaterra = new Vuelo =>[
		   ciudadDeOrigen = "Buenos Aires"
	       ciudadDeDestino = "Londres"
	       horarioDePartida = LocalDate.of(2021,01,05)
	       aerolinea = Varig
	       duracionDeVuelo = 10.0
	       avion = Boeing757 
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
		
		Boeing747.agregarAsiento(asiento22)
		Boeing747.agregarAsiento(asiento23)
		Boeing747.agregarAsiento(asiento24)
	
	
	
	
	//vuelo compuesto
	
	val RapidoDelNorte = new Avion =>[ nombre = "Rapido del Norte"]

        val asientoDeRapidoDelNorte = new Asiento =>[
            ventana = false
            disponible = true
            claseDeAsiento = bussisnes
        ]

        RapidoDelNorte.agregarAsiento(asientoDeRapidoDelNorte)

        val vueloARGaCHILEaCUBA = new VueloCompuesto  =>[
            ciudadDeOrigen = "Buenos Aires"
            ciudadDeDestino = "La Habana"
            horarioDePartida = LocalDate.of(2020,11,23)
            aerolinea = AerolineasArgentinas
            avion = RapidoDelNorte
            precioBase = 45000.0
        ]

        val vueloBSaCHILE = new Vuelo =>[
           ciudadDeOrigen = "Buenos Aires"
           ciudadDeDestino = "Santiago de Chile"
           horarioDePartida = LocalDate.of(2020,11,23)
           aerolinea = AerolineasArgentinas
           duracionDeVuelo = 2.0
           avion = RapidoDelNorte
           precioBase = 8000.0
        ]

        val vueloCHILEaCUBA = new Vuelo =>[
           ciudadDeOrigen = "Santiago de Chile"
           ciudadDeDestino = "La Habana"
           horarioDePartida = LocalDate.of(2020,11,23)
           aerolinea = AerolineasArgentinas
           duracionDeVuelo = 12.0
           avion = RapidoDelNorte
           precioBase = 18000.0
        ]

        vueloARGaCHILEaCUBA.agregarEscala(vueloBSaCHILE)
        vueloARGaCHILEaCUBA.agregarEscala(vueloCHILEaCUBA)
		
		
		
		//XTRest.startInstance(16005, new DefensorRestAPI(repoUsuario, repoVuelo))
	}
}