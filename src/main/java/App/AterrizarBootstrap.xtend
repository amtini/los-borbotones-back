package App

import org.uqbar.xtrest.api.XTRest
import Clases.ClaseAsiento
import Clases.Avion
import Clases.Asiento
import Clases.Aerolinea
import Clases.Vuelo
import java.time.LocalDate
import Clases.VueloCompuesto
import Clases.Usuario
import Clases.Pasaje
import Repositorio.RepositorioAsiento
import Repositorio.RepositorioUsuario
import Repositorio.RepositorioVuelo
import Repositorio.RepositorioClaseAsiento
import Repositorio.RepositorioAerolinea
import Repositorio.RepositorioAvion

class AterrizarBootstrap {
	def static void main(String[] args) {
		
		//Clases de asientos
		
		val primeraClase = new ClaseAsiento =>[
			nombre = "primera clase"
			precioClase = 35000
		]
		
		val bussisnes = new ClaseAsiento =>[
			nombre = "empresario"
			precioClase = 22000
		]
		
		val turista = new ClaseAsiento =>[
			nombre = "turista"
			precioClase = 10000
		]
		
		//Aviones
		
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
		
		val asiento25 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = turista
		]
		
		Boeing747.asientos.add(asiento1)
		Boeing747.asientos.add(asiento2)
		Boeing747.asientos.add(asiento3)
		
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
		
		val asiento36 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		AirbusA320.asientos.add(asiento4)
		AirbusA320.asientos.add(asiento5)
		AirbusA320.asientos.add(asiento6)
		AirbusA320.asientos.add(asiento36)
		
		// vuelo 3
		
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
		
		val asiento34 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = bussisnes
		]
		
		val asiento35 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = bussisnes
		]
		
		Tu204.asientos.add(asiento7)
		Tu204.asientos.add(asiento8)
		Tu204.asientos.add(asiento9)
		Tu204.asientos.add(asiento34)
		Tu204.asientos.add(asiento35)
		
		// vuelo 4
		
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
		
		Il96.asientos.add(asiento10)
		Il96.asientos.add(asiento11)
		Il96.asientos.add(asiento12)
		
		// vuelo 5
		
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
		
		val asiento26 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = bussisnes
		]
		
			val asiento27 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = bussisnes
		]
		
		CRJ200.asientos.add(asiento13)
		CRJ200.asientos.add(asiento14)
		CRJ200.asientos.add(asiento15)
		CRJ200.asientos.add(asiento26)
		CRJ200.asientos.add(asiento27)
		
		// vuelo 6
		
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
		
		val asiento28 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		val asiento29 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		
		Boeing777.asientos.add(asiento16)
		Boeing777.asientos.add(asiento17)
		Boeing777.asientos.add(asiento18)
		Boeing777.asientos.add(asiento28)
		Boeing777.asientos.add(asiento29)
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
		
			val asiento30 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
			val asiento31 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		Boeing767.asientos.add(asiento19)
		Boeing767.asientos.add(asiento20)
		Boeing767.asientos.add(asiento21)
		Boeing767.asientos.add(asiento30)
		Boeing767.asientos.add(asiento31)
		
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
		
		val asiento32 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		val asiento33 = new Asiento =>[
			ventana = false
			disponible = false
			claseDeAsiento = primeraClase
		]
		
		
		Boeing757.asientos.add(asiento22)
		Boeing757.asientos.add(asiento23)
		Boeing757.asientos.add(asiento24)
		Boeing757.asientos.add(asiento32)
		Boeing757.asientos.add(asiento33)
	
	
	
	
	//vuelo compuesto
	
	val RapidoDelNorte = new Avion =>[ nombre = "Rapido del Norte"]

        val asientoDeRapidoDelNorte = new Asiento =>[
            ventana = false
            disponible = true
            claseDeAsiento = bussisnes
        ]

        RapidoDelNorte.asientos.add(asientoDeRapidoDelNorte)

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

        vueloARGaCHILEaCUBA.escalas.add(vueloBSaCHILE)
        vueloARGaCHILEaCUBA.escalas.add(vueloCHILEaCUBA)
		
	
		//usuarios
	
		val MartinMorena = new Usuario =>[
			usuario = "mmorena"
			nombre = "Martin"
			apellido = "Morena"
			password = "mmorena"
			edad = 28
			dinero = 25000.0
		]
		
		val LucasPerez = new Usuario =>[
			usuario = "lperez"
			nombre = "Lucas"
			apellido = "Perez"
			password = "lperez"
			edad = 24
			dinero = 155000.0
		]
		
		val NicolasDichiara = new Usuario =>[
			usuario = "ndichiara"
			nombre = "Nicolas"
			apellido = "Dichiara"
			password = "ndichiara"
			edad = 25
			dinero = 74856.0
		]
		
		val BrianZerial = new Usuario =>[
			usuario = "bzerial"
			nombre = "Braian"
			apellido = "Zerial"
			password = "bzerial"
			edad = 30
			dinero = 74358.0
		]
		
		val AgustinMarioTini = new Usuario =>[
			usuario = "atini"
			nombre = "Agustin Mario"
			apellido = "Tini"
			password = "atini"
			edad = 24
			dinero = 148654.0
		]
	
		val JorgeLopez = new Usuario =>[
			usuario = "jlopez"
			nombre = "Jorgue"
			apellido = "Lopez"
			password = "jlopez"
			edad = 56
			dinero = 23984.0
		]
		
		//amigos
		
		AgustinMarioTini.agregarAmigo(BrianZerial)	
		NicolasDichiara.agregarAmigo(BrianZerial)
		
		//pasajes para Martin Morena
		val pasajeBSaRioMMorena = new Pasaje(vueloBSaRio,asiento25,15000.0,LocalDate.of(2020,03,29))
		val pasajeBSaCHILEMMorena = new Pasaje(vueloBSaMiami,asiento26,36000.0,LocalDate.of(2020,04,16))
		
		MartinMorena.pasajesComprados.add(pasajeBSaRioMMorena)
		MartinMorena.pasajesComprados.add(pasajeBSaCHILEMMorena)
		
		//pasajes para Lucas Perez
		
		val pasajeBSaJamaicaLPerez = new Pasaje(vueloBSaJamaica,asiento36,26000.0,LocalDate.of(2020,03,25))
		val pasajeBSaFranciaLPerez = new Pasaje(vueloAFrancia,asiento35,45000.0,LocalDate.of(2020,04,02))
		
		LucasPerez.pasajesComprados.add(pasajeBSaJamaicaLPerez)
		LucasPerez.pasajesComprados.add(pasajeBSaFranciaLPerez)
		
		//pasajes para NicolasDichiara
        val pasajeBSaMiamiDiachiara = new Pasaje(vueloBSaMiami,asiento27,150000.0,LocalDate.of(2020,03,23))
        val pasajeBSaItaliaDiachiara= new Pasaje(vueloBSaItalia,asiento28,36000.0,LocalDate.of(2020,02,01))

        NicolasDichiara.pasajesComprados.add(pasajeBSaMiamiDiachiara)
        NicolasDichiara.pasajesComprados.add(pasajeBSaItaliaDiachiara)

         //pasajes para BrianZerial
        val pasajeBSaItaliaBrian = new Pasaje(vueloBSaItalia,asiento29,150000.0,LocalDate.of(2020,03,23))
        val pasajeBSaAustraliaBrian= new Pasaje(vueloBSaAustralia,asiento30,36000.0,LocalDate.of(2020,02,01))

        BrianZerial.pasajesComprados.add(pasajeBSaItaliaBrian)
        BrianZerial.pasajesComprados.add(pasajeBSaAustraliaBrian)

		//Pasajes para Agustin Mario Tini
		
		val vueloAFranciaAMTini = new Pasaje(vueloBSaJamaica,asiento34,55000.0,LocalDate.of(2020,03,27))
		val vueloBSaInglaterraAMTini = new Pasaje(vueloAFrancia,asiento33,65000.0,LocalDate.of(2020,04,06))
		
		AgustinMarioTini.pasajesComprados.add(vueloAFranciaAMTini)
		AgustinMarioTini.pasajesComprados.add(vueloBSaInglaterraAMTini)
		
		
		//Pasajes para Jorge Lopez
		
		val vueloBSaInglaterraJLopez = new Pasaje(vueloBSaInglaterra,asiento32,63000.0,LocalDate.of(2020,03,22))
		val	vueloBSaAustraliaJLopez = new Pasaje(vueloBSaAustralia,asiento31,85000.0,LocalDate.of(2020,02,15))
		
		JorgeLopez.pasajesComprados.add(vueloBSaInglaterraJLopez)
		JorgeLopez.pasajesComprados.add(vueloBSaAustraliaJLopez)
		
		
		
		//REPOOO
		
		val repoAsiento = new RepositorioAsiento
		val repoUsuario = new RepositorioUsuario
		val repoVuelo = new RepositorioVuelo
		val repoClaseAsiento = new RepositorioClaseAsiento
		val repoAerolinea = new RepositorioAerolinea
		val repoAvion = new RepositorioAvion
		
		repoClaseAsiento.create(primeraClase)
		repoClaseAsiento.create(bussisnes)
		repoClaseAsiento.create(turista)
		
		repoAerolinea.create(AerolineasArgentinas)
		repoAerolinea.create(AirFrance)
		repoAerolinea.create(Luftansa)
		repoAerolinea.create(LanChile)
		repoAerolinea.create(CopaAirlans)
		repoAerolinea.create(Varig)
		
		repoAsiento.create(asiento1)
		repoAsiento.create(asiento2)
		repoAsiento.create(asiento3)
		repoAsiento.create(asiento4)
		repoAsiento.create(asiento5)
		repoAsiento.create(asiento6)
		repoAsiento.create(asiento7)
		repoAsiento.create(asiento8)
		repoAsiento.create(asiento9)
		repoAsiento.create(asiento10)
		repoAsiento.create(asiento11)
		repoAsiento.create(asiento12)
		repoAsiento.create(asiento13)
		repoAsiento.create(asiento14)
		repoAsiento.create(asiento15)
		repoAsiento.create(asiento16)
		repoAsiento.create(asiento17)
		repoAsiento.create(asiento18)
		repoAsiento.create(asiento19)
		repoAsiento.create(asiento20)
		repoAsiento.create(asiento21)
		repoAsiento.create(asiento22)
		repoAsiento.create(asiento23)
		repoAsiento.create(asiento24)
		repoAsiento.create(asiento25)
		repoAsiento.create(asiento26)
		repoAsiento.create(asiento27)
		repoAsiento.create(asiento28)
		repoAsiento.create(asiento29)
		repoAsiento.create(asiento30)
		repoAsiento.create(asiento31)
		repoAsiento.create(asiento32)
		repoAsiento.create(asiento33)
		repoAsiento.create(asiento34)
		repoAsiento.create(asiento35)
		repoAsiento.create(asiento36)
		repoAsiento.create(asientoDeRapidoDelNorte)
		
		repoAvion.create(Boeing747)
		repoAvion.create(AirbusA320)
		repoAvion.create(Tu204)
		repoAvion.create(Il96)
		repoAvion.create(CRJ200)
		repoAvion.create(Boeing777)
		repoAvion.create(Boeing767)
		repoAvion.create(Boeing757)
		
		
		repoVuelo.create(vueloBSaRio)
        repoVuelo.create(vueloBSaJamaica)
        repoVuelo.create(vueloAFrancia)
        repoVuelo.create(vueloBSaChile)
        repoVuelo.create(vueloBSaMiami)
        repoVuelo.create(vueloBSaItalia)
        repoVuelo.create(vueloBSaAustralia)
        repoVuelo.create(vueloBSaInglaterra)
        repoVuelo.create(vueloARGaCHILEaCUBA)
        
        repoUsuario.create(MartinMorena)
        repoUsuario.create(LucasPerez)
        repoUsuario.create(NicolasDichiara)
        repoUsuario.create(BrianZerial)
        repoUsuario.create(AgustinMarioTini)
        repoUsuario.create(JorgeLopez)
        
 
		
		XTRest.startInstance(16000, new AterrizarRestAPI(repoUsuario, repoVuelo, repoAsiento))
	}
}