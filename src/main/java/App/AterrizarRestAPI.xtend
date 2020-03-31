package App

import Repositorio.RepositorioUsuario
import Repositorio.RepositorioVuelo
import Repositorio.RepositorioAsiento
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.json.JSONUtils
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.commons.model.exceptions.UserException
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.xtrest.api.annotation.Get
import Clases.Ticket
import java.time.LocalDate
import Serializer.VueloSerializer
import Serializer.UsuarioSerializer
import org.uqbar.xtrest.api.annotation.Delete

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
            val usuarioLogeadoBody = body.fromJson(usuarioLogeadoRequest)
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
	
	@Post("/misAmigos/:id")
	def dameMisAmigos(){
		try{
			val amigos = repoUsuario.searchByID(id).amigos
			return ok(UsuarioSerializer.toJson(amigos))
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
	
	@Post("/usuario/reservarVuelo/:idUsuario/:idVuelo/:idAsiento")
	def reservarVuelo(){
		try{
			val usuario = repoUsuario.searchByID(idUsuario.fromJson(String))
			val vuelo = repoVuelo.searchByID(idVuelo.fromJson(String))
			val asiento = repoAsiento.searchByID(idAsiento.fromJson(String))
			
			usuario.carritoDeCompras.agregarTicketAlCarrito(new Ticket(vuelo, asiento))
			
			return ok("se ha realizado la reserva")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Post("/usuario/cancelarReserva/:id1/:id2/:id3")
	def cancelarReserva(){
		try{
			val usuario = repoUsuario.searchByID(id1.fromJson(String))
			val vuelo = repoVuelo.searchByID(id2.fromJson(String))
			val asiento = repoAsiento.searchByID(id3.fromJson(String))
			
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
	def dameVuelos(){
		try{
			val vuelos = repoVuelo.elementos
			/*TODO filtros		*/
			return ok(VueloSerializer.toJson(vuelos))
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/asientosDeVuelo/:id")
	def dameAsientos(){
		try{
			val asientos = repoVuelo.searchByID(id).avion.asientosDisponibles
			
			return ok(asientos.toJson)
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/dameUsuario/:id")
	def dameUsuario(){
		try{
			val usuario = repoUsuario.searchByID(id)
			
			return ok(UsuarioSerializer.toJson(usuario))
				//usuario.toJson
			)
		}catch(UserException exception){
			return badRequest()
		}
	}
}

@Accessors
class filtrosRequest{
	String origen
	String destino
	LocalDate desde
	LocalDate hasta
	boolean ventanilla
}

@Accessors
class usuarioLogeadoRequest{
	String usuario
	String password
}