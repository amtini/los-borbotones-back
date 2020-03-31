package Repositorio

import Clases.Usuario
import org.eclipse.xtend.lib.annotations.Accessors

class RepositorioUsuario extends Repositorio<Usuario>{
	@Accessors String tipo = "U"

	def verificarLogin(String usuarioLogin, String passwordLogin){
		elementos.findFirst(usuario | usuario.verificarUsuario(usuarioLogin, passwordLogin))
	}
	
	def agregarAmigo(String id, String usuarioAmigo){		
		if(existeUsuarioNombre(usuarioAmigo)){
			this.searchByID(id).agregarAmigo(verificarAmigo(usuarioAmigo))
		}
	}
	
	def eliminarAmigo(String id, String id2){
		if(searchByID(id2) !== null && this.searchByID(id).amigos.contains(searchByID(id2))){
			this.searchByID(id).removerAmigo(searchByID(id2))
		}
	}
	
	def verificarAmigo(String usuarioAmigo){
		elementos.findFirst[usuario | usuario.usuario == usuarioAmigo]
	}
	
	def existeUsuarioNombre(String nombreAmigo){
		elementos.contains(verificarAmigo(nombreAmigo))
	}
}