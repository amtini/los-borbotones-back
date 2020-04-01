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

@Controller
class AterrizarRestAPI {
	extension JSONUtils = new JSONUtils
	RepositorioUsuario repoUsuario
	RepositorioVuelo repoVuelo
	RepositorioAsiento repoAsiento
	
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
	
	@Post("/usuario/agregarSaldo/:id/:saldo")
	def agregarSaldo(){
		try {
            val usuario = repoUsuario.searchByID(id)
            //val saldoAAgregar = 
            try {
                usuario.agregarSaldo(saldo.fromJson(Double))
                return ok("se agrego dinero")
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	@Post("/usuario/cambiarPassword/:id/:nuevaPassword")
	def cambiarPassword(){
		try{
			val usuario = repoUsuario.searchByID(id)
		
			try{
				usuario.cambiarPassword(nuevaPassword.fromJson(String))
		    	return ok("se agrego dinero")
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	@Post("/usuario/cambiarEdad/:id/:nuevaEdad")
	def cambiarEdad(){
		try{
			val usuario = repoUsuario.searchByID(id)
			try{
				usuario.cambiarEdad(nuevaEdad.fromJson(Integer))
		    	return ok("se agrego dinero")
            } catch (UserException exception) {
                return badRequest()
            }
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
	
	//dame mis amigos
	
	@Post("/usuario/amigos/:id")
	def dameMisAmigos(){
		try{
			val amigos = repoUsuario.searchByID(id).amigos
			return ok(AmigoSerializer.toJson(amigos))
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//agregar o remover Amigos
	
	@Post("/usuario/agregarAmigo/:id/:usuarioAmigo")
	def agregarAmigo(){
		try{
			repoUsuario.agregarAmigo(id, usuarioAmigo)
			return ok("Se agrego al usuario: "+usuarioAmigo+" como amigo")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Delete("/usuario/eliminarAmigo/:id/:id2")
	def eliminarAmigo(){
		try{
			repoUsuario.eliminarAmigo(id, id2)
			val nombreUsuario = repoUsuario.searchByID(id2).usuario
			return ok("Se elimino al usuario: "+nombreUsuario+" de la lista de amigos")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//reservar o cancelar reserva de vuelo en Carrito de compras de usuario logeado
	
	@Post("/usuario/reservarVuelo/:id1/:id2/:id3")
	def reservarVuelo(){
		try{
			val usuario = repoUsuario.searchByID(id1)
			val vuelo = repoVuelo.searchByID(id2)
			val asiento = repoAsiento.searchByID(id3)
			
			usuario.carritoDeCompras.agregarTicketAlCarrito(vuelo, asiento)
			
			return ok("Se ha reservado el vuelo")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Delete("/usuario/cancelarReserva/:id1/:id2/:id3")
	def cancelarReserva(){
		try{
			val usuario = repoUsuario.searchByID(id1)
			val vuelo = repoVuelo.searchByID(id2)
			val asiento = repoAsiento.searchByID(id3)
			
			usuario.carritoDeCompras.removerTicketDelCarrito(vuelo, asiento)
			
			return ok("se ha cancelado la reserva")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Post("/usuario/limpiarCarritoDeCompras/:id")
	def limpiarCarritoDeCompras(){
		try{
			val usuario = repoUsuario.searchByID(id)
			
			usuario.carritoDeCompras.limpiarCarritoDeCompras
			
			return ok("carrito de compras limpio")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//mi carrito de compras
	
	@Post("/usuario/carritoDeCompras/:id")
	def dameCarritoDeCompras(){
		try{
			val usuario = repoUsuario.searchByID(id)
			
			return ok(TicketSerializer.toJson(usuario.carritoDeCompras.tickets))
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	//comprarPasajes
	
	@Post("/usuario/finalizarCompra/:id")
	def finalizarCompra(){
		try{
			val usuario = repoUsuario.searchByID(id)
			
			usuario.comprarPasajes
			
			return ok("pasajes comprados")
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	//dame vuelos y dame asientos
	
	@Get("/vuelos")
	def dameVuelos(@Body String body){
		try{
			val filtros = body.fromJson(FiltrosRequest)
			val vuelos = repoVuelo.vuelosFiltrados(filtros)
			
			/*TODO filtros		*/
			return ok(VueloSerializer.toJson(vuelos))
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/vuelo/asientos/:id")
	def dameAsientos(){
		try{
			val asientos = repoVuelo.searchByID(id).avion.asientosDisponibles
			
			return ok(asientos.toJson)
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/usuario/:id")
	def dameUsuario(){
		try{
			val usuario = repoUsuario.searchByID(id)
			
			return ok(UsuarioSerializer.toJson(usuario))
				//usuario.toJson
			
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	//dame mis pasajes
	
	@Post("/usuario/pasajes/:id")
	def damePasajes(){
		try{
			val pasajes = repoUsuario.searchByID(id).pasajesComprados
			
			return ok(PasajeSerializer.toJson(pasajes))
				//usuario.toJson
			
		}catch(UserException exception){
			return badRequest()
		}
	}
	
}

@Accessors
class FiltrosRequest{
	String origen
	String destino
	LocalDate desde
	LocalDate hasta
	boolean ventanilla
}

@Accessors
class UsuarioLogeadoRequest{
	String usuario
	String password
}