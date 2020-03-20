package Clases

import org.eclipse.xtend.lib.annotations.Accessors
import Repositorio.Entidad
import java.util.ArrayList
import java.util.List

@Accessors
class Usuario implements Entidad{
	
	String id
	
	String nombre
	String apellido
	String password
	int edad
	double dinero
	
	List<Usuario> amigos = new ArrayList<Usuario>
	
	List<Vuelo> pasajesComprados = new ArrayList<Vuelo>
	
	override getID() {
		id
	}
	
	override setID(String idd) {
		id  = idd
	}
	
	def comprarPasaje(Vuelo vuelo){
		pasajesComprados.add(vuelo)
	}
	
	def addAmigo(Usuario usuario){
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