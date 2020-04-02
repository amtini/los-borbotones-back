package Serializer

import Clases.Ticket
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
class TicketSerializer extends StdSerializer<Ticket>{
	new(Class<Ticket> s){
		super(s)
	}
	
	static val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
	
	static def getStringDateFromLocalDate(LocalDate date) { 	date.format(formatter) 	}
	
	override serialize(Ticket value, JsonGenerator gen, SerializerProvider provider) throws IOException {
		gen.writeStartObject();
		gen.writeStringField("asientoId", value.asiento.ID);
		gen.writeStringField("vueloId", value.vuelo.ID);
		gen.writeStringField("ciudadDeOrigen", value.vuelo.ciudadDeOrigen);
		gen.writeStringField("ciudadDeDestino", value.vuelo.ciudadDeDestino);
		gen.writeStringField("aerolinea", value.vuelo.aerolinea.nombre);
		gen.writeStringField("claseDeAsiento", value.asiento.claseDeAsiento.nombre)
		gen.writeNumberField("precioTicket", value.costo)
		gen.writeStringField("horarioDePartida", getStringDateFromLocalDate(value.vuelo.horarioDePartida))
		gen.writeEndObject();
	}
	
	static def String toJson(Set<Ticket> tickets) {
		if(tickets === null || tickets.empty){return "[ ]"}
		mapper().writeValueAsString(tickets)
	}
	
	static def mapper(){
		val ObjectMapper mapper = new ObjectMapper()
		val SimpleModule module = new SimpleModule()
		module.addSerializer(Ticket, new TicketSerializer(Ticket))
		mapper.registerModule(module)
		mapper
	}
}