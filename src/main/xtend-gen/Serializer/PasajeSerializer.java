package Serializer;

import Clases.Pasaje;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import java.io.IOException;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Exceptions;

@Accessors
@SuppressWarnings("all")
public class PasajeSerializer extends StdSerializer<Pasaje> {
  public PasajeSerializer(final Class<Pasaje> s) {
    super(s);
  }
  
  public void serialize(final Pasaje value, final JsonGenerator gen, final SerializerProvider provider) throws IOException {
    gen.writeStartObject();
    gen.writeStringField("ciudadDeOrigen", value.getVuelo().getCiudadDeOrigen());
    gen.writeStringField("ciudadDeDestino", value.getVuelo().getCiudadDeDestino());
    gen.writeStringField("aerolinea", value.getVuelo().getAerolinea().getNombre());
    gen.writeNumberField("precioPasaje", (value.getCosto()).doubleValue());
    gen.writeEndObject();
  }
  
  public static String toJson(final Set<Pasaje> pasajes) {
    try {
      String _xblockexpression = null;
      {
        if (((pasajes == null) || pasajes.isEmpty())) {
          return "[ ]";
        }
        _xblockexpression = PasajeSerializer.mapper().writeValueAsString(pasajes);
      }
      return _xblockexpression;
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public static ObjectMapper mapper() {
    ObjectMapper _xblockexpression = null;
    {
      final ObjectMapper mapper = new ObjectMapper();
      final SimpleModule module = new SimpleModule();
      PasajeSerializer _pasajeSerializer = new PasajeSerializer(Pasaje.class);
      module.<Pasaje>addSerializer(Pasaje.class, _pasajeSerializer);
      mapper.registerModule(module);
      _xblockexpression = mapper;
    }
    return _xblockexpression;
  }
}
