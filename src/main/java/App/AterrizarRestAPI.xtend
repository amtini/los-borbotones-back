package App

import Repositorio.RepositorioUsuario
import Repositorio.RepositorioVuelo
import Repositorio.RepositorioAsiento
import org.uqbar.xtrest.api.annotation.Controller

@Controller
class AterrizarRestAPI {
	
	RepositorioUsuario repoUsuario
	RepositorioVuelo repoVuelo
	RepositorioAsiento repoAsiento
	
	new(RepositorioUsuario repoU, RepositorioVuelo repoV, RepositorioAsiento repoA){
		repoUsuario = repoU
		repoVuelo = repoV
		repoAsiento = repoA
	}
	
}