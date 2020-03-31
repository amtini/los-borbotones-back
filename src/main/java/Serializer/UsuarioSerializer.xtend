package Serializer

import Clases.Usuario
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.SerializerProvider
import com.fasterxml.jackson.databind.module.SimpleModule
import com.fasterxml.jackson.databind.ser.std.StdSerializer
import java.io.IOException
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Accessors
class UsuarioSerializer extends StdSerializer<Usuario>{
	new(Class<Usuario> s){
		super(s)
	}
	
	override serialize(Usuario value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("usuario", value.usuario);
		gen.writeStringField("id", value.ID);
		gen.writeStringField("nombre", value.nombre);
		gen.writeStringField("apellido", value.apellido);
		gen.writeStringField("password", value.password);
		gen.writeNumberField("edad", value.edad);	
		gen.writeNumberField("dinero", value.dinero);
		gen.writeEndObject();
	}
	
	static def String toJson(List<Usuario> usuarios) {
		if(usuarios === null || usuarios.empty){return "[ ]"}
		mapper().writeValueAsString(usuarios)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Usuario, new UsuarioSerializer(Usuario))
		mapper.registerModule(module)
		mapper
	}
}