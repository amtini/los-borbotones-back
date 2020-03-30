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
	
	@Get("/dameUsuarios")
	def dameUsuarios(){
        try {
            return ok(repoUsuario.elementos.toJson)
        } catch (UnrecognizedPropertyException exception) {
            return badRequest()
        }
	}
}

@Accessors
class usuarioLogeadoRequest{
	String usuario
	String password
}