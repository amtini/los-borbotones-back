package Serializer

import Clases.Usuario
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.SerializerProvider
import com.fasterxml.jackson.databind.module.SimpleModule
import com.fasterxml.jackson.databind.ser.std.StdSerializer
import java.io.IOException
import org.eclipse.xtend.lib.annotations.Accessors
import Parsers.ParserStringToLong

@Accessors
class UsuarioSerializer extends StdSerializer<Usuario>{
	new(Class<Usuario> s){
		super(s)
	}
	
	static ParserStringToLong parserStringToLong = ParserStringToLong.instance
	
	override serialize(Usuario value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("usuario", value.usuario);
		gen.writeStringField("id", parserStringToLong.parsearDeLongAString(value.ID));
		gen.writeStringField("nombre", value.nombre);
		gen.writeStringField("apellido", value.apellido);
		gen.writeStringField("password", value.password);
		gen.writeNumberField("edad", value.edad);
		gen.writeNumberField("dinero", value.dinero);
		gen.writeEndObject();
	}
	
	static def String toJson(Usuario usuario) {
		if(usuario === null){return "[ ]"}
		mapper().writeValueAsString(usuario)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Usuario, new UsuarioSerializer(Usuario))
		mapper.registerModule(module)
		mapper
	}
}