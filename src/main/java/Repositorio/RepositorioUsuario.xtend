package Repositorio

import Clases.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioUsuario extends Repositorio<Usuario>{
	@Accessors String tipo = "U"

	def verificarLogin(String usuarioLogin, String passwordLogin){
		elementos.findFirst(usuario | usuario.verificarUsuario(usuarioLogin, passwordLogin))
	}
	
	def agregarAmigo(String id, String nombreAmigo){
		if(verificarAmigo(nombreAmigo) === null && this.searchByID(id).amigos.contains(this.verificarAmigo(nombreAmigo))){
			this.searchByID(id).agregarAmigo(this.verificarAmigo(nombreAmigo))
		}
	}
	
	
	def eliminarAmigo(String id, String nombreAmigo){
		if(verificarAmigo(nombreAmigo) === null && this.searchByID(id).amigos.contains(this.verificarAmigo(nombreAmigo))){
			this.searchByID(id).removerAmigo(this.verificarAmigo(nombreAmigo))
		}
	}
	
	def verificarAmigo(String nombreAmigo){
		elementos.findFirst[usuario | usuario.nombre == nombreAmigo]
	}
}