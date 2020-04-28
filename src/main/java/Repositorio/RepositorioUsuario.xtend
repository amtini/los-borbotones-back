package Repositorio

import Clases.Usuario

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioUsuario extends Repositorio<Usuario> {

	def verificarLogin(String usuarioLogin, String passwordLogin) {
		allInstances.findFirst(usuario|usuario.verificarUsuario(usuarioLogin, passwordLogin))
	}

	def agregarAmigo(Usuario usuario, String usuarioAmigo) {
		if(puedoAgregarAmigo(usuario,usuarioAmigo)){
			usuario.agregarAmigo(verificarAmigo(usuarioAmigo))
			update(usuario)
		}
	}
	
	def puedoAgregarAmigo(Usuario usuario, String usuarioAmigo){
		return usuario.usuario != usuarioAmigo
	}

	def eliminarAmigo(Long id, Long id2) {
		val usuario = searchByID(id)
		val amigo = searchByID(id2)
		if (usuario.amigos.map(a|a.ID).toList.contains(amigo.ID)) {
			usuario.removerAmigo(amigo)
			update(usuario)
		}
	}

	// hacer search by EXAMPLE, en este caso el nombre del usuario a agregar a amigos
	def verificarAmigo(String usuarioAmigo) {
		searchUsuarioPorNombre(usuarioAmigo)
	}

	override getEntityType() {
		Usuario
	}

	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Usuario> query, Root<Usuario> camposUsuario,
		Long id) {
		if (id !== null) {
			query.where(criteria.equal(camposUsuario.get("ID"), id))
		}
	}

	override fetch(Root<Usuario> from) {
	}

	def searchUsuarioPorNombre(String unString) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			query.where(criteria.equal(from.get("usuario"), unString))
			entityManager.createQuery(query).singleResult
		} finally {
			entityManager?.close
		}
	}
}
