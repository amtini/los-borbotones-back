package Serializer

import com.fasterxml.jackson.databind.ser.std.StdSerializer
import Clases.Usuario
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.SerializerProvider
import java.io.IOException
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.module.SimpleModule
import java.util.Set
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AmigoSerializer extends StdSerializer<Usuario>{
	new(Class<Usuario> s){
		super(s)
	}
	
	override serialize(Usuario value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("id", value.ID);
		gen.writeStringField("nombre", value.nombre);
		gen.writeStringField("apellido", value.apellido);
		gen.writeNumberField("edad", value.edad);	

		gen.writeEndObject();
	}
	
	static def String toJson(Set<Usuario> usuarios) {
		if(usuarios === null || usuarios.empty){return "[ ]"}
		mapper().writeValueAsString(usuarios)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Usuario, new AmigoSerializer(Usuario))
		mapper.registerModule(module)
		mapper
	}
}