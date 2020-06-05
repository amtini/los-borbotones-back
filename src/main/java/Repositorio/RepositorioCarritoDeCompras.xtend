package Repositorio

import Clases.CarritoDeCompras
import org.eclipse.xtend.lib.annotations.Accessors
import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig
import redis.clients.jedis.Jedis
import org.uqbar.commons.model.exceptions.UserException
import redis.clients.jedis.exceptions.JedisConnectionException
import org.uqbar.xtrest.json.JSONUtils

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
	
	override create(CarritoDeCompras unCarrito){
		jedis.set(unCarrito.ID,unCarrito.toJson)
	}
	
	def searchCarritoDelUsuario(String id) {
		if(searchByID(id)===null){
			val carritoNuevo = new CarritoDeCompras(id)
			create(carritoNuevo)
			return carritoNuevo
		}else{
			searchByID(id)
		}
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
			val returnValue = value
			jedis.close()
			returnValue.fromJson(CarritoDeCompras)
		} catch (JedisConnectionException e) {
			throw new UserException("Error de conexión a Redis")
		} finally {
			if (jedis !== null)
				jedis.close()
		}
	}
	
	override searchByID(String id){
		applyOnJedis(traerValor(id))
	}
	
//	override delete(CarritoDeCompras unCarrito) {
//		jedis.del(unCarrito.ID)
//	}//TODO: redefinir el delete

}
