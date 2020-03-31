package Serializer;

import Clases.Vuelo;
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
public class VueloSerializer extends StdSerializer<Vuelo> {
  public VueloSerializer(final Class<Vuelo> s) {
    super(s);
  }
  
  public void serialize(final Vuelo value, final JsonGenerator gen, final SerializerProvider provider) throws IOException {
    gen.writeStartObject();
    gen.writeStringField("id", value.getID());
    gen.writeStringField("ciudadDeOrigen", value.getCiudadDeOrigen());
    gen.writeStringField("ciudadDeDestino", value.getCiudadDeDestino());
    gen.writeStringField("aerolinea", value.getAerolinea().getNombre());
    gen.writeNumberField("duracionDeVuelo", (value.getDuracionDeVuelo()).doubleValue());
    gen.writeNumberField("escalas", value.getCantidadEscalas());
    gen.writeNumberField("precioMinimoPasaje", value.precioMinimoPasaje());
    gen.writeEndObject();
  }
  
  public static String toJson(final Set<Vuelo> vuelos) {
    try {
      String _xblockexpression = null;
      {
        if (((vuelos == null) || vuelos.isEmpty())) {
          return "[ ]";
        }
        _xblockexpression = VueloSerializer.mapper().writeValueAsString(vuelos);
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
      VueloSerializer _vueloSerializer = new VueloSerializer(Vuelo.class);
      module.<Vuelo>addSerializer(Vuelo.class, _vueloSerializer);
      mapper.registerModule(module);
      _xblockexpression = mapper;
    }
    return _xblockexpression;
  }
}
