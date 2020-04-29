package App

import Repositorio.RepositorioAsiento
import Repositorio.RepositorioUsuario
import Repositorio.RepositorioVuelo
import Serializer.AmigoSerializer
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
import Serializer.AsientoSerializer
import Parsers.ParserStringToLong
import Repositorio.RepositorioTicket
import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.text.DateFormat
import java.text.SimpleDateFormat
import com.fasterxml.jackson.annotation.JsonFormat
import Parsers.ParserDate

@Controller
class AterrizarRestAPI {
	extension JSONUtils = new JSONUtils
	RepositorioUsuario repoUsuario
	RepositorioVuelo repoVuelo
	RepositorioAsiento repoAsiento
	RepositorioTicket repoTicket
	static ParserStringToLong parserStringToLong = ParserStringToLong.instance

	new(RepositorioUsuario repoU, RepositorioVuelo repoV, RepositorioAsiento repoA, RepositorioTicket repoT) {
		repoUsuario = repoU
		repoVuelo = repoV
		repoAsiento = repoA
		repoTicket = repoT
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
			val vuelo = repoVuelo.searchByID(parserStringToLong.parsearDeStringALong(id2))
			val asiento = repoAsiento.searchByID(parserStringToLong.parsearDeStringALong(id3))

			usuario.carritoDeCompras.agregarTicketAlCarrito(vuelo, asiento)
			repoUsuario.update(usuario)
			repoAsiento.update(asiento)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Delete("/usuario/cancelarReserva/:id1/:id2/:id3")
	def cancelarReserva() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id1))
			val vuelo = repoVuelo.searchByID(parserStringToLong.parsearDeStringALong(id2))
			val asiento = repoAsiento.searchByID(parserStringToLong.parsearDeStringALong(id3))
			val ticket = usuario.carritoDeCompras.buscarTicket(vuelo, asiento)

			ticket.cancelarReserva()
			repoAsiento.update(ticket.asiento)
			usuario.carritoDeCompras.removerTicketDelCarrito(ticket)
			repoUsuario.update(usuario)
			repoTicket.delete(ticket)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/limpiarCarritoDeCompras/:id")
	def limpiarCarritoDeCompras() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			val tickets = usuario.carritoDeCompras.tickets.clone

			usuario.carritoDeCompras.cancelarReservaDeTodosLosAsientos
			repoAsiento.actualizarAsientos(tickets)
			usuario.carritoDeCompras.limpiarCarritoDeCompras
			repoUsuario.update(usuario)
			repoTicket.eliminarTickets(tickets)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// TERMINA ACA
	//
	// REVISAR URGENTE 
	// mi carrito de compras
	@Get("/usuario/carritoDeCompras/:id")
	def dameCarritoDeCompras() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))

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

			usuario.comprarPasajes
			repoUsuario.update(usuario)

			return ok()
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Get("/usuario/costoTotalCarrito/:id")
	def costoTotalCarrito() {
		try {
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			return ok(usuario.carritoDeCompras.costoTotalDelCarrito.toJson)
		} catch (UserException exception) {
			return badRequest()
		}
	}

	// dame vuelos y dame asientos
	@Get("/vuelos")
	def dameVuelos(String origen,  String destino, String desde, String hasta, String ventanilla, String claseAsiento) {
		try {
			val filtros = new FiltrosVuelo(origen,destino, desde, hasta, ventanilla, claseAsiento)
			println(filtros.origen)
			println(filtros.destino)
			println(filtros.desde)
			println(filtros.hasta)
			
			
			val vuelos = repoVuelo.searchFiltros(filtros.origen,filtros.destino,filtros.ventanilla,filtros.claseAsiento, filtros.disponible, filtros.desde, filtros.hasta)				//vuelosFiltrados(filtros)
			
			/*TODO filtros */
			val vuelosJson = VueloSerializer.toJson(vuelos.toSet)
			repoVuelo.closeSession()
			return ok(vuelosJson)
		} catch (UserException exception) {
			return badRequest()
		}
	}

	@Post("/vuelo/asientos/:id")
	def dameAsientos(@Body String body) {
		try {
			val filtros = body.fromJson(FiltrosAsiento)
			val asientos = repoVuelo.asientosDeMiVuelo(parserStringToLong.parsearDeStringALong(id), filtros)
			
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
}

@Accessors
class FiltrosVuelo {
	String origen
	String destino
	LocalDate desde
	LocalDate hasta
	boolean ventanilla
	String claseAsiento
	Boolean disponible = true
	
	new(String _origen,  String _destino, String _desde, String _hasta, String _ventanilla, String _claseAsiento){
		origen = _origen
		destino = _destino
		desde = ParserDate.ParseStringToDate(_desde)
		hasta = ParserDate.ParseStringToDate(_hasta)
		ventanilla = Boolean.parseBoolean(_ventanilla)
		claseAsiento = _claseAsiento
	}
}

@Accessors
class FiltrosAsiento {
	boolean ventanilla
	String claseAsiento
}

@Accessors
class UsuarioLogeadoRequest {
	String usuario
	String password
}
