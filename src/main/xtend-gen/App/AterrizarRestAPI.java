package App;

import App.usuarioLogeadoRequest;
import Clases.Usuario;
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
    //this.pageNotFound(baseRequest, request, response);
  }
}
