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
}

@Accessors
class usuarioLogeadoRequest{
	String usuario
	String password
}