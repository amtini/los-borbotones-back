package Repositorio

import Clases.Usuario

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioUsuario extends Repositorio<Usuario>{
	

	def verificarLogin(String usuarioLogin, String passwordLogin){
		allInstances.findFirst(usuario | usuario.verificarUsuario(usuarioLogin, passwordLogin))
	}
	
	def agregarAmigo(Long id, String usuarioAmigo){		
		if(existeUsuarioNombre(usuarioAmigo)){
			this.searchByID(id).agregarAmigo(verificarAmigo(usuarioAmigo))
		}
	}
	
	def eliminarAmigo(Long id, Long id2){
		if(searchByID(id2) !== null && this.searchByID(id).amigos.contains(searchByID(id2))){
			this.searchByID(id).removerAmigo(searchByID(id2))
		}
	}
	
	def verificarAmigo(String usuarioAmigo){
		allInstances.findFirst[usuario | usuario.usuario == usuarioAmigo]
	}
	
	def existeUsuarioNombre(String nombreAmigo){
		allInstances.contains(verificarAmigo(nombreAmigo))
	}
	
	override getEntityType() {
		Usuario
	}
	
	override generateWhere(CriteriaBuilder criteria, CriteriaQuery<Usuario> query, Root<Usuario> camposCandidato, Usuario t) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Usuario> query, Root<Usuario> camposUsuario, Long id) {
		if (id !== null) {
			query.where(criteria.equal(camposUsuario.get("ID"), id))
		} 
	}
	
	override fetch(Root<Usuario> from) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}