package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad
import java.util.ArrayList
import java.util.List
import java.util.HashSet
import java.util.Set

@Accessors
class Usuario implements Entidad{
	
	String id
	
	String usuario
	String nombre
	String apellido
	String password
	int edad
	double dinero
	
	List<Usuario> amigos = new ArrayList<Usuario>
	
	CarritoDeCompras carritoDeCompras
	
	Set<Pasaje> pasajesComprados = new HashSet<Pasaje>
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
	def limpiarCarrito(){
		pasajesComprados.empty
	}
	
	def comprarPasaje(){
		carritoDeCompras.tickets.forEach[ticket  | pasajesComprados.add(new Pasaje(ticket.vuelo, ticket.asiento, ticket.costo))]
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