package Serializer

import org.eclipse.xtend.lib.annotations.Accessors
import com.fasterxml.jackson.databind.ser.std.StdSerializer
import Clases.Asiento
import com.fasterxml.jackson.databind.SerializerProvider
import com.fasterxml.jackson.core.JsonGenerator
import java.io.IOException
import java.util.Set
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.module.SimpleModule
import Parsers.ParserStringToLong

@Accessors
class AsientoSerializer extends StdSerializer<Asiento>{
	
	new(Class<Asiento> s){
		super(s)
	}
	
	override serialize(Asiento value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("id", value.ID);
		gen.writeStringField("claseAsiento", value.claseDeAsiento);
		gen.writeBooleanField("ventanilla", value.ventana);
		gen.writeNumberField("precioAsiento", value.precio)
		gen.writeEndObject();
	}
	
	static def String toJson(Set<Asiento> asientos) {
		if(asientos === null || asientos.empty){return "[ ]"}
		mapper().writeValueAsString(asientos)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Asiento, new AsientoSerializer(Asiento))
		mapper.registerModule(module)
		mapper
	}
}