package Repositorio

import Clases.CarritoDeCompras
import org.eclipse.xtend.lib.annotations.Accessors
import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig
import redis.clients.jedis.Jedis
import org.uqbar.commons.model.exceptions.UserException
import redis.clients.jedis.exceptions.JedisConnectionException
import org.uqbar.xtrest.json.JSONUtils
import java.util.ArrayList
import Clases.Ticket

class RepositorioCarritoDeCompras extends Repositorio<CarritoDeCompras> {
	
	@Accessors String tipo = "C"
	var JedisPool jedisPool
	Jedis jedis = new Jedis("localhost")
	extension JSONUtils = new JSONUtils
	
	//en el constructor creo el pool de conexiones
	private new() {
		jedisPool = new JedisPool(new JedisPoolConfig, "localhost")
	}
	
	static RepositorioCarritoDeCompras instance

	static def getInstance() {
		if (instance === null) {
			instance = new RepositorioCarritoDeCompras()
		}
		instance
	}
	
	override getTipo() {
		return tipo
	}
	
	override condicionDeBusqueda(CarritoDeCompras cc, String value) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	def create(String id){
		val carritoNuevo = new CarritoDeCompras(id)
		return carritoNuevo
	}
	
	override update(CarritoDeCompras unCarrito){
		if(unCarrito.tickets !== null){
			jedis.set(unCarrito.ID,unCarrito.tickets.toJson)
		 }else{
			val tickets = new ArrayList<Ticket>
			jedis.set(unCarrito.ID,tickets.toJson)
		}
	}
	
	def test(String id){
		println(jedis.get(id))
	}
	
	def searchCarritoDelUsuario(String id) {
		//if(searchByID(id) === null){
			return create(id)
		/*  }else{
			searchByID(id)
		}*/
	}
	
	private def traerValor(String key) {
		return [Jedis jedis|jedis.get(key)]
	}
	
	private def applyOnJedis((Jedis)=>String aBlock) {
		var Jedis jedis
		try {
			jedis = jedisPool.resource
			val value = aBlock.apply(jedis)
			if (value === null) {
				throw new UserException("No hay datos de las monedas solicitadas")
			}
			val returnValue = value.fromJson(CarritoDeCompras)
			jedis.close()
			returnValue //.fromJson(CarritoDeCompras)
		} catch (JedisConnectionException e) {
			throw new UserException("Error de conexión a Redis")
		} finally {
			if (jedis !== null)
				jedis.close()
		}
	}
	
	override searchByID(String id){
		//applyOnJedis(traerValor(id))
		val tickets = jedis.get(id)
		val nuevoCarrito = new CarritoDeCompras(id)
		
		nuevoCarrito.tickets = tickets.fromJson()
		return nuevoCarrito
	}
}
