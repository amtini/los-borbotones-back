package Serializer

import Clases.Vuelo
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.SerializerProvider
import com.fasterxml.jackson.databind.module.SimpleModule
import com.fasterxml.jackson.databind.ser.std.StdSerializer
import java.io.IOException
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import java.time.format.DateTimeFormatter
import java.time.LocalDate

@Accessors
class VueloSerializer extends StdSerializer<Vuelo>{
	new(Class<Vuelo> s){
		super(s)
	}
	
	static val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
	
	static def getStringDateFromLocalDate(LocalDate date) { 	date.format(formatter) 	}
	
	override serialize(Vuelo value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("id", value.ID);
		gen.writeStringField("ciudadDeOrigen", value.ciudadDeOrigen);
		gen.writeStringField("ciudadDeDestino", value.ciudadDeDestino);
		gen.writeStringField("aerolinea", value.aerolinea.nombre);
		gen.writeNumberField("duracionDeVuelo", value.duracionDeVuelo);	
		gen.writeNumberField("escalas", value.cantidadEscalas);
		gen.writeNumberField("precioMinimoPasaje", value.precioMinimoPasaje)
		gen.writeStringField("horarioDePartida", getStringDateFromLocalDate(value.horarioDePartida))
		gen.writeEndObject();
	}
	
	static def String toJson(Set<Vuelo> vuelos) {
		if(vuelos === null || vuelos.empty){return "[ ]"}
		mapper().writeValueAsString(vuelos)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Vuelo, new VueloSerializer(Vuelo))
		mapper.registerModule(module)
		mapper
	}
}