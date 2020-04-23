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
import java.time.LocalDate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import Clases.ClaseAsiento
import Serializer.AsientoSerializer
import Parsers.ParserStringToLong

@Controller
class AterrizarRestAPI {
	extension JSONUtils = new JSONUtils
	RepositorioUsuario repoUsuario
	RepositorioVuelo repoVuelo
	RepositorioAsiento repoAsiento
	static ParserStringToLong parserStringToLong = ParserStringToLong.instance
	
	new(RepositorioUsuario repoU, RepositorioVuelo repoV, RepositorioAsiento repoA){
		repoUsuario = repoU
		repoVuelo = repoV
		repoAsiento = repoA
	}
	
	@Post("/login")
	def login(@Body String body){
		try {
            val usuarioLogeadoBody = body.fromJson(UsuarioLogeadoRequest)
            try {
                val usuarioLogeado = this.repoUsuario.verificarLogin(usuarioLogeadoBody.usuario, usuarioLogeadoBody.password)
                return ok(usuarioLogeado.ID.toJson)
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	//cambiar password, edad y saldo
	
	@Get("/usuario/agregarSaldo/:id/:saldo")
	def agregarSaldo(@Body String body){
		try {
            val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
            //val saldoAAgregar = 
            try {
                usuario.agregarSaldo(saldo.fromJson(Double))
                return ok()
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	@Get("/usuario/cambiarPassword/:id/:nuevaPassword")
	def cambiarPassword(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
		
			try{
				usuario.cambiarPassword(nuevaPassword)
		    	return ok()
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	@Get("/usuario/cambiarEdad/:id/:nuevaEdad")
	def cambiarEdad(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			try{
				usuario.cambiarEdad(nuevaEdad.fromJson(Integer))
		    	return ok()
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	//dame mis amigos
	
	@Get("/usuario/amigos/:id")
	def dameMisAmigos(){
		try{
			val amigos = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id)).amigos
			return ok(AmigoSerializer.toJson(amigos))
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//agregar o remover Amigos
	
	@Get("/usuario/agregarAmigo/:id/:usuarioAmigo")
	def agregarAmigo(){
		try{
			repoUsuario.agregarAmigo(parserStringToLong.parsearDeStringALong(id), usuarioAmigo)
			return ok()
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Delete("/usuario/eliminarAmigo/:id/:id2")
	def eliminarAmigo(){
		try{
			repoUsuario.eliminarAmigo(parserStringToLong.parsearDeStringALong(id), parserStringToLong.parsearDeStringALong(id2))
			return ok()
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//reservar o cancelar reserva de vuelo en Carrito de compras de usuario logeado
	
	@Get("/usuario/reservarVuelo/:id1/:id2/:id3")
	def reservarVuelo(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id1))
			val vuelo = repoVuelo.searchByID(parserStringToLong.parsearDeStringALong(id2))
			val asiento = repoAsiento.searchByID(parserStringToLong.parsearDeStringALong(id3))
			
			usuario.carritoDeCompras.agregarTicketAlCarrito(vuelo, asiento)
			
			return ok()
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Delete("/usuario/cancelarReserva/:id1/:id2/:id3")
	def cancelarReserva(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id1))
			val vuelo = repoVuelo.searchByID(parserStringToLong.parsearDeStringALong(id2))
			val asiento = repoAsiento.searchByID(parserStringToLong.parsearDeStringALong(id3))
			
			usuario.carritoDeCompras.removerTicketDelCarrito(vuelo, asiento)
			return ok()
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Get("/usuario/limpiarCarritoDeCompras/:id")
	def limpiarCarritoDeCompras(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			
			usuario.carritoDeCompras.limpiarCarritoDeCompras
			
			return ok()
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//mi carrito de compras
	
	@Get("/usuario/carritoDeCompras/:id")
	def dameCarritoDeCompras(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			
			return ok(TicketSerializer.toJson(usuario.carritoDeCompras.tickets))
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//comprarPasajes
	
	@Get("/usuario/finalizarCompra/:id")
	def finalizarCompra(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			
			usuario.comprarPasajes
			
			return ok()
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Get("/usuario/costoTotalCarrito/:id")
	def costoTotalCarrito(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			return ok(usuario.carritoDeCompras.costoTotalDelCarrito.toJson)
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	//dame vuelos y dame asientos
	
	@Post("/vuelos")
	def dameVuelos(@Body String body){
		try{
			val filtros = body.fromJson(FiltrosVuelo)
			val vuelos = repoVuelo.vuelosFiltrados(filtros)
			
			/*TODO filtros */
			
			return ok(VueloSerializer.toJson(vuelos))
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/vuelo/asientos/:id")
	def dameAsientos(@Body String body){
		try{
			val filtros = body.fromJson(FiltrosAsiento)
			val asientos = repoVuelo.asientosDeMiVuelo(parserStringToLong.parsearDeStringALong(id), filtros)
			
			return ok(AsientoSerializer.toJson(asientos))
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Get("/usuario/:id")
	def dameUsuario(){
		try{
			val usuario = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id))
			
			return ok(UsuarioSerializer.toJson(usuario))
				//usuario.toJson
			
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	//dame mis pasajes
	
	@Get("/usuario/pasajes/:id")
	def damePasajes(){
		try{
			val pasajes = repoUsuario.searchByID(parserStringToLong.parsearDeStringALong(id)).pasajesComprados
			
			return ok(PasajeSerializer.toJson(pasajes))
				//usuario.toJson
			
		}catch(UserException exception){
			return badRequest()
		}
	}
}

@Accessors
class FiltrosVuelo{
	String origen
	String destino
	//LocalDate desde
	//LocalDate hasta
	boolean ventanilla
	String claseAsiento
}

@Accessors
class FiltrosAsiento{
	boolean ventanilla
	String claseAsiento
}

@Accessors
class UsuarioLogeadoRequest{
	String usuario
	String password
}