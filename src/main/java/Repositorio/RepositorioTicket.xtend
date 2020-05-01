package Repositorio

import Clases.Ticket
import java.util.List
import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root

class RepositorioTicket extends Repositorio<Ticket> {

	override getEntityType() {
		Ticket
	}

	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Ticket> query, Root<Ticket> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		}
	}

	override fetch(Root<Ticket> from) {
	}

	def searchTicketByAsiento(String asientoId) {
		val entityManager = singletonDeEntityManager.getEntityManager
		try {
			val criteria = entityManager.criteriaBuilder
			val query = criteria.createQuery(entityType)
			val from = query.from(entityType)
			query.select(from)
			from.fetch("asiento")
			query.where(criteria.equal(from.get("asiento"), asientoId))
			entityManager.createQuery(query).singleResult
		} finally {
			
		}
	}

	def eliminarTickets(List<Ticket> tickets) {
		tickets.forEach[ticket|println("voy a eliminar el ticket" + ticket.ID)]
		tickets.forEach[ticket|delete(ticket)]
	}

}
