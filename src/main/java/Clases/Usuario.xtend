package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad
import java.util.ArrayList
import java.util.List
import java.util.HashSet
import java.util.Set
import java.time.LocalDate
import com.fasterxml.jackson.annotation.JsonIgnore

@Accessors
class Usuario implements Entidad{
	
	String ID
	
	String usuario
	String nombre
	String apellido
	String password
	int edad
	double dinero
	
	@JsonIgnore List<Usuario> amigos = new ArrayList<Usuario>
	
	@JsonIgnore CarritoDeCompras carritoDeCompras
	
	@JsonIgnore Set<Pasaje> pasajesComprados = new HashSet<Pasaje>
	
	override getID() {
		ID
	}
	
	override setID(String idd) {
		ID  = idd
	}
	
	def verificarUsuario(String usuarioLogin,String passwordLogin){
		return (usuario == usuarioLogin && password == passwordLogin)
	}
	
	def limpiarCarrito(){
		pasajesComprados.empty
	}
	
	def comprarPasaje(){
		carritoDeCompras.tickets.forEach[ticket  | pasajesComprados.add(new Pasaje(ticket.vuelo, ticket.asiento, ticket.costo, LocalDate.now))]
	}
	
	def agregarAmigo(Usuario usuario){
		amigos.add(usuario)
	}
	
	def removerAmigo(Usuario usuario){
		amigos.remove(usuario)
	}
	
	def cambiarPassword(String pass){
		password = pass
	}
	
	def cambiarEdad(int ed){
		edad = ed
	}
	
	def agregarSaldo(double din){
		dinero += din
	}
	
	def removerSaldo(double din){
		dinero -= din
	}
}