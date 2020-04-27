package Repositorio

import Clases.Asiento

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import java.util.List
import Clases.Ticket

class RepositorioAsiento extends Repositorio<Asiento> {

	override getEntityType() {
		Asiento
	}

	override generateWhereId(CriteriaBuilder criteria, CriteriaQuery<Asiento> query, Root<Asiento> campos, Long id) {
		if (id !== null) {
			query.where(criteria.equal(campos.get("ID"), id))
		}
	}

	override fetch(Root<Asiento> from) {
	}

	def actualizarAsientos(List<Ticket> tickets) {
		tickets.forEach(ticket|update(ticket.asiento))
	}

}
