package Repositorio

import javax.persistence.criteria.CriteriaBuilder
import javax.persistence.criteria.CriteriaQuery
import javax.persistence.criteria.Root
import Clases.Ticket

class RepositorioTicket extends Repositorio<Ticket>  {
	
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
	
}