package Clases


import javax.persistence.Column
import javax.persistence.Entity
import javax.persistence.FetchType
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.OneToMany
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.annotations.Observable
import javax.persistence.ManyToMany
import javax.persistence.OneToOne
import javax.persistence.CascadeType
import java.util.Set
import java.util.HashSet
import java.time.LocalDate

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
	//@ElementCollection
	Set<Usuario> amigos = new HashSet<Usuario>

	@OneToMany(fetch=FetchType.LAZY)
	Set<Pasaje> pasajesComprados = new HashSet<Pasaje>
	
	@OneToOne(fetch=FetchType.LAZY, cascade=CascadeType.ALL)
	CarritoDeCompras carritoDeCompras = new CarritoDeCompras
	
	def verificarUsuario(String usuarioLogin, String passwordLogin) {
		return (usuario == usuarioLogin && password == passwordLogin)
	}

	def limpiarCarrito() {
		pasajesComprados.empty
	}
	
	def comprarPasajes() {
		if (carritoDeCompras.costoTotalDelCarrito() < dinero) {
			dinero -= carritoDeCompras.costoTotalDelCarrito
			carritoDeCompras.tickets.forEach [ ticket |
				pasajesComprados.add(new Pasaje(ticket.vuelo, ticket.asiento, ticket.costo, LocalDate.now))
			]
			carritoDeCompras.tickets.clear
		}
	}

	def agregarAmigo(Usuario usuario) {
		if (amigos.contains(usuario)) {
			println("El usuario ya es amigo")
		} else {
			amigos.add(usuario)
		}
	}

	def removerAmigo(Usuario usuario) {
		amigos.remove(usuario)
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
