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

@Accessors
class PasajeSerializer extends StdSerializer<Pasaje>{
	new(Class<Pasaje> s){
		super(s)
	}
	
	override serialize(Pasaje value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("ciudadDeOrigen", value.vuelo.ciudadDeOrigen);
		gen.writeStringField("ciudadDeDestino", value.vuelo.ciudadDeDestino);
		gen.writeStringField("aerolinea", value.vuelo.aerolinea.nombre);
		gen.writeNumberField("precioPasaje", value.costo)
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