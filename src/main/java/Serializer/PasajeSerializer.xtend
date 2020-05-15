package Serializer

import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.SerializerProvider
import com.fasterxml.jackson.databind.module.SimpleModule
import com.fasterxml.jackson.databind.ser.std.StdSerializer
import java.io.IOException
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Set
import Clases.Pasaje
import java.time.LocalDate
import java.time.format.DateTimeFormatter

@Accessors
class PasajeSerializer extends StdSerializer<Pasaje>{
	new(Class<Pasaje> s){
		super(s)
	}
	
	static val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
	
	static def getStringDateFromLocalDate(LocalDate date) { 	date.format(formatter) 	}
	
	override serialize(Pasaje value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("ciudadDeOrigen", value.ciudadDeOrigen);
		gen.writeStringField("ciudadDeDestino", value.ciudadDeDestino);
		gen.writeStringField("aerolinea", value.aerolinea);
		gen.writeNumberField("precioPasaje", value.costo)
		gen.writeStringField("horarioDePartida", getStringDateFromLocalDate(value.horarioDePartida))
		gen.writeStringField("comprado", getStringDateFromLocalDate(value.comprado))
		gen.writeEndObject();
	}
	
	static def String toJson(Set<Pasaje> pasajes) {
		if(pasajes === null || pasajes.empty){return "[ ]"}
		mapper().writeValueAsString(pasajes)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Pasaje, new PasajeSerializer(Pasaje))
		mapper.registerModule(module)
		mapper
	}
}