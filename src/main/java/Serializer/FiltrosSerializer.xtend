package Serializer

import com.fasterxml.jackson.databind.ser.std.StdSerializer
import org.eclipse.xtend.lib.annotations.Accessors
import Filtros.FiltrosVuelo
import com.fasterxml.jackson.core.JsonGenerator
import com.fasterxml.jackson.databind.SerializerProvider
import java.io.IOException
import java.util.Set
import com.fasterxml.jackson.databind.ObjectMapper
import com.fasterxml.jackson.databind.module.SimpleModule
import java.time.format.DateTimeFormatter
import java.time.LocalDate

@Accessors
class FiltrosSerializer extends StdSerializer<FiltrosVuelo>{
	
	new(Class<FiltrosVuelo> s){
		super(s)
	}
	
	static val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
	
	static def getStringDateFromLocalDate(LocalDate date) { 	date.format(formatter) 	}
	
	override serialize(FiltrosVuelo value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("id", value.ID.toString);
		gen.writeStringField("origen", value.origen);
		gen.writeStringField("destino", value.destino);
		gen.writeStringField("desde", getStringDateFromLocalDate(value.desde));
		if(value.hasta !== null){
			gen.writeStringField("hasta", getStringDateFromLocalDate(value.hasta))
		}
		gen.writeBooleanField("ventanilla", value.ventanilla)
		gen.writeStringField("claseAsiento", value.claseAsiento)
		gen.writeEndObject();
	}
	
	static def String toJson(Set<FiltrosVuelo> filtrosVuelo) {
		if(filtrosVuelo === null || filtrosVuelo.empty){return "[ ]"}
		mapper().writeValueAsString(filtrosVuelo)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(FiltrosVuelo, new FiltrosSerializer(FiltrosVuelo))
		mapper.registerModule(module)
		mapper
	}
}