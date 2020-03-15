package Clases

import java.util.Set

import java.util.HashSet
import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad

@Accessors
class Usuario implements Entidad{
	
	String id
	
	String nombre
	String apellido
	int edad
	double dinero
	
	Set<Usuario> amigos = new HashSet<Usuario>
	
	Set<Reserva> reservas = new HashSet<Reserva>
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
	
	def comprarPasaje(Vuelo vuelo, Asiento asiento){
		reservas.add(new Reserva(vuelo,asiento))
	}
	
	def addAmigo(Usuario usuario){
		amigos.add(usuario)
	}
	
	def removerAmigo(Usuario usuario){
		amigos.remove(usuario)
	}
}