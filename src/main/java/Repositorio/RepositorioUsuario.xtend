package Repositorio

import Clases.Usuario

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioUsuario extends Repositorio<Usuario>{
	
	
	def Usuario searchByID(Long id) {
		val criteria = entityManager.criteriaBuilder
		val query = criteria.createQuery(getEntityType)
		val from = query.from(getEntityType)
		// evita n + 1 queries
		//fromEntidad.fetch("proveedores")
		query.select(from).where(criteria.equal(from.get("id"),id))
		val finalQuery = entityManager.createQuery(query)
		finalQuery.singleResult
	}

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
	
}