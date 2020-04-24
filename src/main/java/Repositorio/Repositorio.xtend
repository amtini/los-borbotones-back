package Repositorio

import java.util.List
import javax.persistence.EntityManagerFactory
import javax.persistence.Persistence
import javax.persistence.PersistenceException
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Repositorio<T> {

	static final EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("Aerolinea")

	abstract def Class<T> getEntityType()

	def List<T> allInstances() {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			entityManager.createQuery(query).resultList
		} finally {
			entityManager?.close
		}
	}

	def searchByExample(T t) {
		val entityManager = this.entityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			generateWhere(criteria, query, from, t) // ESTO ES LO QUE TIENE DE DIFERENTE CADA IF ASI QUE HACE UN METODO ABTRACTO Y LO REDEFINO EN CADA UNA DE LAS CLASES
			entityManager.createQuery(query).resultList
		} finally {
			entityManager?.close
		}
	}

	abstract def void generateWhere(CriteriaBuilder criteria, CriteriaQuery<T> query, Root<T> camposCandidato, T t) // ESTA ES LA ABTRACT QUE SE CREA PARA LUEGO REDEFINIR ESTE METODO

	def create(T t) {
		val entityManager = this.entityManager
		try {
			entityManager => [
				transaction.begin
				persist(t)
				transaction.commit
			]
		} catch (PersistenceException e) {
			e.printStackTrace
			entityManager.transaction.rollback
			throw new RuntimeException("Ocurri� un error, la operaci�n no puede completarse", e)
		} finally {
			entityManager?.close
		}
	}

	def update(T t) {
		val entityManager = this.entityManager
		try {
			entityManager => [
				transaction.begin
				merge(t)
				transaction.commit
			]
		} catch (PersistenceException e) {
			e.printStackTrace
			entityManager.transaction.rollback
			throw new RuntimeException("Ocurri� un error, la operaci�n no puede completarse", e)
		} finally {
			entityManager?.close
		}
	}

	def getEntityManager() {
		entityManagerFactory.createEntityManager
	}

//	def searchByID(Long id) {
//		val criteria = entityManager.criteriaBuilder
//		val query = criteria.createQuery(getEntityType)
//		val from = query.from(getEntityType)
//		// evita n + 1 queries
//		//fromEntidad.fetch("proveedores")
//		query.select(from).where(criteria.equal(from.get("id"),id))
//		val finalQuery = entityManager.createQuery(query)
//		finalQuery.resultList
//	}
	
}
