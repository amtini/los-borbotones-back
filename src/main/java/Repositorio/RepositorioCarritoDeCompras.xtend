package Repositorio

import Clases.CarritoDeCompras
import Clases.Ticket
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import java.lang.reflect.Type
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import redis.clients.jedis.Jedis
import redis.clients.jedis.JedisPool
import redis.clients.jedis.JedisPoolConfig

class RepositorioCarritoDeCompras extends Repositorio<CarritoDeCompras> {

	@Accessors String tipo = "C"
	var JedisPool jedisPool
	Jedis jedis

	// en el constructor creo el pool de conexiones
	private new() {
		jedisPool = new JedisPool(new JedisPoolConfig, "localhost")
		jedis = jedisPool.resource
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

	def create(String id) {
		val carritoNuevo = new CarritoDeCompras(id)
		return carritoNuevo
	}

	override update(CarritoDeCompras unCarrito) {
		val gson = new Gson()
		println("los tickets que se guardan en redis " + unCarrito.tickets)
		if (unCarrito.tickets !== null) {
			jedis.set(unCarrito.ID, gson.toJson(unCarrito.tickets))
		} else {
			val tickets = new ArrayList<Ticket>
			jedis.set(unCarrito.ID, gson.toJson(tickets))
		}
	}

	override searchByID(String id) {
		val jsonTickets = jedis.get(id) //Me traigo los tickets de redis como json(String que adentro tiene una lista en json)
		val carrito = new CarritoDeCompras(id) //Creo un carrito para agregarle los tickets que recupero de redis
		//println("que trae de redis " + jsonTickets)
		if(jsonTickets.isNullOrEmpty){ //Si lo que trajo de redis es null o vacio, a la lista de tickets le meto una lista vacia
			carrito.tickets = new ArrayList<Ticket>
		} else {//si no hago el else
			val Type listType = new TypeToken<ArrayList<Ticket>>(){}.getType()//listType se trae el tipo ArrayList<Ticket> esto no seria necesario si en el fromJson te dejara poner ArrayList<Ticket> como tipo de lista
			carrito.tickets = new Gson().fromJson(jsonTickets, listType)// Le asigno la lista de tickets que me traje de redis a 
		}
		return carrito
	}

}
