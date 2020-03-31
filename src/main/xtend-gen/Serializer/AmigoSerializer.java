package Serializer;

import Clases.Usuario;
import Serializer.UsuarioSerializer;
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
public class AmigoSerializer extends StdSerializer<Usuario> {
  public AmigoSerializer(final Class<Usuario> s) {
    super(s);
  }
  
  public void serialize(final Usuario value, final JsonGenerator gen, final SerializerProvider provider) throws IOException {
    gen.writeStartObject();
    gen.writeStringField("id", value.getID());
    gen.writeStringField("nombre", value.getNombre());
    gen.writeStringField("apellido", value.getApellido());
    gen.writeNumberField("edad", value.getEdad());
    gen.writeEndObject();
  }
  
  public static String toJson(final Set<Usuario> usuarios) {
    try {
      String _xblockexpression = null;
      {
        if (((usuarios == null) || usuarios.isEmpty())) {
          return "[ ]";
        }
        _xblockexpression = AmigoSerializer.mapper().writeValueAsString(usuarios);
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
      UsuarioSerializer _usuarioSerializer = new UsuarioSerializer(Usuario.class);
      module.<Usuario>addSerializer(Usuario.class, _usuarioSerializer);
      mapper.registerModule(module);
      _xblockexpression = mapper;
    }
    return _xblockexpression;
  }
}
