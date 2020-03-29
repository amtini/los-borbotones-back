package App;

import Repositorio.RepositorioAsiento;
import Repositorio.RepositorioUsuario;
import Repositorio.RepositorioVuelo;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.eclipse.jetty.server.Request;
import org.uqbar.xtrest.api.annotation.Controller;
import org.uqbar.xtrest.result.ResultFactory;

@Controller
@SuppressWarnings("all")
public class AterrizarRestAPI extends ResultFactory {
  private RepositorioUsuario repoUsuario;
  
  private RepositorioVuelo repoVuelo;
  
  private RepositorioAsiento repoAsiento;
  
  public AterrizarRestAPI(final RepositorioUsuario repoU, final RepositorioVuelo repoV, final RepositorioAsiento repoA) {
    this.repoUsuario = repoU;
    this.repoVuelo = repoV;
    this.repoAsiento = repoA;
  }
  
  public void handle(final String target, final Request baseRequest, final HttpServletRequest request, final HttpServletResponse response) throws IOException, ServletException {
    //this.pageNotFound(baseRequest, request, response);
  }
}
