package App;

import App.filtrosRequest;
import App.usuarioLogeadoRequest;
import Clases.Asiento;
import Clases.Ticket;
import Clases.Usuario;
import Clases.Vuelo;
import Repositorio.RepositorioAsiento;
import Repositorio.RepositorioUsuario;
import Repositorio.RepositorioVuelo;
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jetty.server.Request;
import org.eclipse.xtext.xbase.lib.Exceptions;
import org.eclipse.xtext.xbase.lib.Extension;
import org.uqbar.commons.model.exceptions.UserException;
import org.uqbar.xtrest.api.Result;
import org.uqbar.xtrest.api.annotation.Body;
import org.uqbar.xtrest.api.annotation.Controller;
import org.uqbar.xtrest.api.annotation.Post;
import org.uqbar.xtrest.json.JSONUtils;
import org.uqbar.xtrest.result.ResultFactory;

@Controller
@SuppressWarnings("all")
public class AterrizarRestAPI extends ResultFactory {
  @Extension
  private JSONUtils _jSONUtils = new JSONUtils();
  
  private RepositorioUsuario repoUsuario;
  
  private RepositorioVuelo repoVuelo;
  
  private RepositorioAsiento repoAsiento;
  
  public AterrizarRestAPI(final RepositorioUsuario repoU, final RepositorioVuelo repoV, final RepositorioAsiento repoA) {
    this.repoUsuario = repoU;
    this.repoVuelo = repoV;
    this.repoAsiento = repoA;
  }
  
  @Post("/login")
  public Result login(@Body final String body, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final usuarioLogeadoRequest usuarioLogeadoBody = this._jSONUtils.<usuarioLogeadoRequest>fromJson(body, usuarioLogeadoRequest.class);
      try {
        final Usuario usuarioLogeado = this.repoUsuario.verificarLogin(usuarioLogeadoBody.getUsuario(), usuarioLogeadoBody.getPassword());
        return ResultFactory.ok(this._jSONUtils.toJson(usuarioLogeado));
      } catch (final Throwable _t) {
        if (_t instanceof UserException) {
          return ResultFactory.badRequest();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
    } catch (final Throwable _t) {
      if (_t instanceof UnrecognizedPropertyException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/agregarSaldo/:id/:saldo")
  public Result agregarSaldo(final String id, final String saldo, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(id);
      try {
        usuario.agregarSaldo((this._jSONUtils.<Double>fromJson(saldo, Double.class)).doubleValue());
        return ResultFactory.ok("se agrego dinero");
      } catch (final Throwable _t) {
        if (_t instanceof UserException) {
          return ResultFactory.badRequest();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
    } catch (final Throwable _t) {
      if (_t instanceof UnrecognizedPropertyException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/cambiarPassword/:id/:nuevaPassword")
  public Result cambiarPassword(final String id, final String nuevaPassword, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(id);
      try {
        usuario.cambiarPassword(this._jSONUtils.<String>fromJson(nuevaPassword, String.class));
        return ResultFactory.ok("se agrego dinero");
      } catch (final Throwable _t) {
        if (_t instanceof UserException) {
          return ResultFactory.badRequest();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
    } catch (final Throwable _t) {
      if (_t instanceof UnrecognizedPropertyException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/cambiarEdad/:id/:nuevaEdad")
  public Result cambiarEdad(final String id, final String nuevaEdad, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(id);
      try {
        usuario.cambiarEdad((this._jSONUtils.<Integer>fromJson(nuevaEdad, Integer.class)).intValue());
        return ResultFactory.ok("se agrego dinero");
      } catch (final Throwable _t) {
        if (_t instanceof UserException) {
          return ResultFactory.badRequest();
        } else {
          throw Exceptions.sneakyThrow(_t);
        }
      }
    } catch (final Throwable _t) {
      if (_t instanceof UnrecognizedPropertyException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/agregarAmigo/:id/:nombreAmigo")
  public Result agregarAmigo(final String id, final String nombreAmigo, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      this.repoUsuario.agregarAmigo(id, nombreAmigo);
      return ResultFactory.ok("amigo agregado exitosamente");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/eliminarAmigo/:id/:nombreAmigo")
  public Result eliminarAmigo(final String id, final String nombreAmigo, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      this.repoUsuario.agregarAmigo(id, nombreAmigo);
      return ResultFactory.ok("amigo agregado exitosamente");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/reservarVuelo/:idUsuario/:idVuelo/:idAsiento")
  public Result reservarVuelo(final String idUsuario, final String idVuelo, final String idAsiento, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(this._jSONUtils.<String>fromJson(idUsuario, String.class));
      final Vuelo vuelo = this.repoVuelo.searchByID(this._jSONUtils.<String>fromJson(idVuelo, String.class));
      final Asiento asiento = this.repoAsiento.searchByID(this._jSONUtils.<String>fromJson(idAsiento, String.class));
      Ticket _ticket = new Ticket(vuelo, asiento);
      usuario.getCarritoDeCompras().agregarTicketAlCarrito(_ticket);
      return ResultFactory.ok("se ha realizado la reserva");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/cancelarReserva/:idUsuario/:idVuelo/:idAsiento")
  public Result cancelarReserva(final String idUsuario, final String idVuelo, final String idAsiento, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(this._jSONUtils.<String>fromJson(idUsuario, String.class));
      final Vuelo vuelo = this.repoVuelo.searchByID(this._jSONUtils.<String>fromJson(idVuelo, String.class));
      final Asiento asiento = this.repoAsiento.searchByID(this._jSONUtils.<String>fromJson(idAsiento, String.class));
      usuario.getCarritoDeCompras().removerTicketDelCarrito(vuelo, asiento);
      return ResultFactory.ok("se ha cancelado la reserva");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/limpiarCarritoDeCompras/:id")
  public Result limpiarCarritoDeCompras(final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(id);
      usuario.getCarritoDeCompras().limpiarCarritoDeCompras();
      return ResultFactory.ok("carrito de compras limpio");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/usuario/finalizarCompra/:id")
  public Result finalizarCompra(final String id, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final Usuario usuario = this.repoUsuario.searchByID(id);
      usuario.comprarPasajes();
      return ResultFactory.ok("pasajes comprados");
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  @Post("/vuelos")
  public Result dameVuelos(@Body final String body, final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) {
    try {
      final filtrosRequest filtros = this._jSONUtils.<filtrosRequest>fromJson(body, filtrosRequest.class);
      return ResultFactory.ok(this._jSONUtils.toJson(this.repoVuelo.buscarVuelos(filtros.getOrigen(), filtros.getDestino(), filtros.getDesde(), filtros.getHasta())));
    } catch (final Throwable _t) {
      if (_t instanceof UserException) {
        return ResultFactory.badRequest();
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    {
    	Matcher matcher = 
    		Pattern.compile("/login").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = login(body, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/vuelos").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		String body = readBodyAsString(request);
    		
    		// take variables from url
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = dameVuelos(body, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/limpiarCarritoDeCompras/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = limpiarCarritoDeCompras(id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/finalizarCompra/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = finalizarCompra(id, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/agregarSaldo/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		String saldo = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = agregarSaldo(id, saldo, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/cambiarPassword/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		String nuevaPassword = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = cambiarPassword(id, nuevaPassword, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/cambiarEdad/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		String nuevaEdad = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = cambiarEdad(id, nuevaEdad, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/agregarAmigo/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		String nombreAmigo = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = agregarAmigo(id, nombreAmigo, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/eliminarAmigo/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String id = matcher.group(1);
    		String nombreAmigo = matcher.group(2);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = eliminarAmigo(id, nombreAmigo, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/reservarVuelo/(\\w+)/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String idUsuario = matcher.group(1);
    		String idVuelo = matcher.group(2);
    		String idAsiento = matcher.group(3);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = reservarVuelo(idUsuario, idVuelo, idAsiento, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    {
    	Matcher matcher = 
    		Pattern.compile("/usuario/cancelarReserva/(\\w+)/(\\w+)/(\\w+)").matcher(target);
    	if (request.getMethod().equalsIgnoreCase("Post") && matcher.matches()) {
    		// take parameters from request
    		
    		// take variables from url
    		String idUsuario = matcher.group(1);
    		String idVuelo = matcher.group(2);
    		String idAsiento = matcher.group(3);
    		
            // set default content type (it can be overridden during next call)
            response.setContentType("application/json");
    		
    	    Result result = cancelarReserva(idUsuario, idVuelo, idAsiento, target, baseRequest, request, response);
    	    result.process(response);
    	    
    		response.addHeader("Access-Control-Allow-Origin", "*");
    	    baseRequest.setHandled(true);
    	    return;
    	}
    }
    //this.pageNotFound(baseRequest, request, response);
  }
}
