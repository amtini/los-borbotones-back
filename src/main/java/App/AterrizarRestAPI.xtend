package App

import Filtros.FiltrosAsiento
import Filtros.FiltrosVuelo
import Parsers.ParserStringToLong
import Repositorio.RepositorioCarritoDeCompras
import RepositorioHibernate.RepositorioUsuario
import RepositorioMongo.RepositorioBusquedaVuelos
import RepositorioMongo.RepositorioVuelo
import Serializer.AmigoSerializer
import Serializer.AsientoSerializer
import Serializer.FiltrosSerializer
import Serializer.PasajeSerializer
import Serializer.TicketSerializer
import Serializer.UsuarioSerializer
import Serializer.VueloSerializer
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils

@Controller
class AterrizarRestAPI {
	extension JSONUtils = new JSONUtils
	RepositorioUsuario repoUsuario
	RepositorioVuelo repoVuelo
	//RepositorioAsiento repoAsiento
	val repoFiltro =  new RepositorioBusquedaVuelos
	RepositorioCarritoDeCompras repoCarritoDeCompras = RepositorioCarritoDeCompras.instance
	
	static ParserStringToLong parserStringToLong = ParserStringToLong.instance

	new(RepositorioUsuario repoU, RepositorioVuelo repoV/*, RepositorioAsiento repoA*/) {
		repoUsuario = repoU
		repoVuelo = repoV
//		repoAsiento = repoA
	}

	@Post("/login")
	def login(@Body String body) {
		try {
			val usuarioLogeadoBody = body.fromJson(UsuarioLogeadoRequest)
			try {
				val usuarioLogeado = this.repoUsuario.verificarLogin(usuarioLogeadoBody.usuario,
					usuarioLogeadoBody.password)
				return ok(usuarioLogeado.ID.toJson)
			} catch (UserException exception) {
				return badRequest()
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest()
		}
	}

	// cambiar password, edad y saldo
	@Get("/usuario/agregarSaldo/:id/:saldo")
	def agregarSaldo(@Body String body) {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			// val saldoAAgregar = 
			try {
				usuario.agregarSaldo(saldo.fromJson(Double))
				repoUsuario.update(usuario)
				return ok()
			} catch (UserException exception) {
				return badRequest()
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/cambiarPassword/:id/:nuevaPassword")
	def cambiarPassword() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))

			try {
				usuario.cambiarPassword(nuevaPassword)
				repoUsuario.update(usuario)
				return ok()
			} catch (UserException exception) {
				return badRequest()
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/cambiarEdad/:id/:nuevaEdad")
	def cambiarEdad() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			try {
				usuario.cambiarEdad(nuevaEdad.fromJson(Integer))
				repoUsuario.update(usuario)
				return ok()
			} catch (UserException exception) {
				return badRequest()
			}
		} catch (UnrecognizedPropertyException exception) {
			return badRequest()
		}
	}

	// dame mis amigos
	@Get("/usuario/amigos/:id")
	def dameMisAmigos() {
		try {
			val amigos = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id)).amigos
			return ok(AmigoSerializer.toJson(amigos))
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// agregar o remover Amigos
	@Get("/usuario/agregarAmigo/:id/:usuarioAmigo")
	def agregarAmigo() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			repoUsuario.agregarAmigo(usuario, usuarioAmigo)
			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Delete("/usuario/eliminarAmigo/:id/:id2")
	def eliminarAmigo() {
		try {
			repoUsuario.eliminarAmigo(parserStringToLong.parsearDeStringALong(id),
				parserStringToLong.parsearDeStringALong(id2))
			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}
	
	
	
	// reservar o cancelar reserva de vuelo en Carrito de compras de usuario logeado
	@Get("/usuario/reservarVuelo/:id1/:id2/:id3")
	def reservarVuelo() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id1))
			val vuelo = repoVuelo.searchByID((id2))
			usuario.carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id1)
			

			usuario.carritoDeCompras.agregarTicketAlCarrito(vuelo, vuelo.avion.seleccionarAsiento(id3))
			repoUsuario.update(usuario)
			repoVuelo.update(vuelo)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Delete("/usuario/cancelarReserva/:id1/:id2/:id3")
	def cancelarReserva() {
		try {
			val vuelo = repoVuelo.searchByID(id2)
			val carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id1)
			val ticket = carritoDeCompras.buscarTicket(vuelo, vuelo.avion.seleccionarAsiento(id3))

			carritoDeCompras.removerTicketDelCarrito(ticket)
			
			repoVuelo.update(ticket.vuelo)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/limpiarCarritoDeCompras/:id")
	def limpiarCarritoDeCompras() {
		try {
			val carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id)
			val tickets = carritoDeCompras.tickets
			carritoDeCompras.cancelarReservaDeTodosLosAsientos
			tickets.forEach(ticket|repoVuelo.update(ticket.vuelo))
			carritoDeCompras.limpiarCarritoDeCompras

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// mi carrito de compras
	@Get("/usuario/carritoDeCompras/:id")
	def dameCarritoDeCompras() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			usuario.carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id)
			
			return ok(TicketSerializer.toJson(usuario.carritoDeCompras.tickets))
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// comprarPasajes
	@Get("/usuario/finalizarCompra/:id")
	def finalizarCompra() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			//val tickets = usuario.carritoDeCompras.tickets.clone
			usuario.carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id)
			usuario.comprarPasajes
			
			repoUsuario.update(usuario)
			//repoTicket.eliminarTickets(tickets)
			
			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/costoTotalCarrito/:id")
	def costoTotalCarrito() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			usuario.carritoDeCompras = repoCarritoDeCompras.searchCarritoDelUsuario(id)
			
			return ok(usuario.carritoDeCompras.costoTotalDelCarrito.toJson)
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// dame vuelos y dame asientos
	@Get("/vuelos")
	def dameVuelos(String origen, String destino, String desde, String hasta, String ventanilla, String claseAsiento, String idUsuario) {
		try {
			val filtro = new FiltrosVuelo(origen, destino, desde, hasta, ventanilla, claseAsiento, idUsuario)
			
			repoFiltro.create(filtro)
			
			return ok(VueloSerializer.toJson(repoVuelo.searchFiltros(filtro).toSet))
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Post("/vuelo/asientos/:id")
	def dameAsientos(@Body String body) {
		try {
			val filtros = body.fromJson(FiltrosAsiento)
			val asientos = repoVuelo.asientosDeMiVuelo(id , filtros)
			return ok(AsientoSerializer.toJson(asientos))
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/:id")
	def dameUsuario() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			return ok(UsuarioSerializer.toJson(usuario))

		} catch (UserException exception) {
			return badRequest()
		}
	}

	// dame mis pasajes
	@Get("/usuario/pasajes/:id")
	def damePasajes() {
		try {

			val pasajes = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id)).pasajesComprados

			return ok(PasajeSerializer.toJson(pasajes))
		// usuario.toJson
		} catch (UserException exception) {
			return badRequest()
		}
	}
	
	@Get("/usuario/historialDeBusqueda/:id")
	def historialDeBusqueda(){
		try {
			
			return ok(FiltrosSerializer.toJson(repoFiltro.searchByExample(id)))
		
		} catch (UserException exception) {
			return badRequest()
		}
	}
}

@Accessors
class UsuarioLogeadoRequest {
	String usuario
	String password
}
