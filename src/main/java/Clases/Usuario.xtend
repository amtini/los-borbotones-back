package Clases

import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.CascadeType
import java.util.Set
import java.util.HashSet
import java.time.LocalDate
import javax.persistence.Transient
import javax.persistence.OneToMany
import javax.persistence.ManyToMany

@Entity
@Observable
@Accessors
class Usuario {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long ID // TODO ver lo del id
	@Column(length=150)
	String usuario

	@Column(length=150)
	String nombre

	@Column(length=150)
	String apellido

	@Column(length=150)
	String password

	@Column(length=150)
	int edad

	@Column(length=150)
	double dinero

	@ManyToMany(fetch=FetchType.LAZY)
	Set<Usuario> amigos = new HashSet<Usuario>

	@OneToMany(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	Set<Pasaje> pasajesComprados = new HashSet<Pasaje>

	@Transient
	CarritoDeCompras carritoDeCompras

	def verificarUsuario(String usuarioLogin, String passwordLogin) {
		return (usuario == usuarioLogin && password == passwordLogin)
	}

	def comprarPasajes() {//TODO:PASAR LISTA DE TICKETS Y COSTO DEL CARRITO
		if (carritoDeCompras.costoTotalDelCarrito() < dinero) {
			dinero -= carritoDeCompras.costoTotalDelCarrito
			carritoDeCompras.tickets.forEach [ ticket |
				pasajesComprados.add(new Pasaje(ticket.vuelo.ciudadDeDestino, ticket.vuelo.ciudadDeOrigen, ticket.vuelo.aerolinea.nombre, ticket.vuelo.horarioDePartida, ticket.costo, LocalDate.now))
			]
			carritoDeCompras.limpiarCarritoDeCompras
		}
	}

	def agregarAmigo(Usuario usuarioNuevo) {
		if (amigos.contains(usuarioNuevo) && usuario != usuarioNuevo.usuario) {
		} else {
			amigos.add(usuarioNuevo)
		}
	}

	def removerAmigo(Usuario usuario) {
		val amigo = amigos.findFirst[it.ID == usuario.ID]
		amigos.remove(amigo)
	}

	def cambiarPassword(String pass) {
		password = pass
	}

	def cambiarEdad(int ed) {
		edad = ed
	}

	def agregarSaldo(double din) {
		dinero += din
	}

	def removerSaldo(double din) {
		dinero -= din
	}
}
