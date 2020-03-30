package Repositorio

import Clases.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioUsuario extends Repositorio<Usuario>{
	@Accessors String tipo = "U"

	def verificarLogin(String usuarioLogin, String passwordLogin){
		elementos.findFirst(usuario | usuario.verificarUsuario(usuarioLogin, passwordLogin))
	}
}