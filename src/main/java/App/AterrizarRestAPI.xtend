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
import Clases.Asiento
import java.time.LocalDate
import com.fasterxml.jackson.databind.annotation.JsonDeserialize
import com.fasterxml.jackson.databind.annotation.JsonSerialize

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
                return ok(usuarioLogeado.toJson)
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
	
	//agregar o remover Amigos
	
	@Post("/usuario/agregarAmigo/:id/:nombreAmigo")
	def agregarAmigo(){
		try{
			repoUsuario.agregarAmigo(id, nombreAmigo)
			return ok("amigo agregado exitosamente")
		} catch (UserException exception){
			return badRequest()
		}
	}
	
	@Post("/usuario/eliminarAmigo/:id/:nombreAmigo")
	def eliminarAmigo(){
		try{
			repoUsuario.agregarAmigo(id, nombreAmigo)
			return ok("amigo agregado exitosamente")
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
	
	@Post("/usuario/cancelarReserva/:idUsuario/:idVuelo/:idAsiento")
	def cancelarReserva(){
		try{
			val usuario = repoUsuario.searchByID(idUsuario.fromJson(String))
			val vuelo = repoVuelo.searchByID(idVuelo.fromJson(String))
			val asiento = repoAsiento.searchByID(idAsiento.fromJson(String))
			
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
	
	@Post("/vuelos")
	def dameVuelos(@Body String body){
		try{
			val filtros = body.fromJson(filtrosRequest)
			
			return ok(/*repoVuelo.vuelosDisponibles.toJson)*/ repoVuelo.buscarVuelos(filtros.origen, filtros.destino, filtros.desde, filtros.hasta).toJson)
		}catch(UserException exception){
			return badRequest()
		}
	}
	
	@Post("/asientosDeVuelo/:id")
	def dameAsientos(){
		try{
			val asientos = repoVuelo.searchByID(id).avion.asientos
			
			return ok(asientos.toJson)
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