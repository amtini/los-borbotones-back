package Clases;

import Clases.Asiento;
import Clases.CarritoDeCompras;
import Clases.Pasaje;
import Clases.Ticket;
import Clases.Vuelo;
import Repositorio.Entidad;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.google.common.base.Objects;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.function.Consumer;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario implements Entidad {
  private String ID;
  
  private String usuario;
  
  private String nombre;
  
  private String apellido;
  
  private String password;
  
  private int edad;
  
  private double dinero;
  
  @JsonIgnore
  private List<Usuario> amigos = new ArrayList<Usuario>();
  
  private CarritoDeCompras carritoDeCompras;
  
  @JsonIgnore
  private Set<Pasaje> pasajesComprados = new HashSet<Pasaje>();
  
  public String getID() {
    return this.ID;
  }
  
  public String setID(final String idd) {
    return this.ID = idd;
  }
  
  public boolean verificarUsuario(final String usuarioLogin, final String passwordLogin) {
    return (Objects.equal(this.usuario, usuarioLogin) && Objects.equal(this.password, passwordLogin));
  }
  
  public boolean limpiarCarrito() {
    return this.pasajesComprados.isEmpty();
  }
  
  public void comprarPasaje() {
    final Consumer<Ticket> _function = new Consumer<Ticket>() {
      public void accept(final Ticket ticket) {
        Vuelo _vuelo = ticket.getVuelo();
        Asiento _asiento = ticket.getAsiento();
        double _costo = ticket.costo();
        LocalDate _now = LocalDate.now();
        Pasaje _pasaje = new Pasaje(_vuelo, _asiento, Double.valueOf(_costo), _now);
        Usuario.this.pasajesComprados.add(_pasaje);
      }
    };
    this.carritoDeCompras.getTickets().forEach(_function);
  }
  
  public boolean agregarAmigo(final Usuario usuario) {
    return this.amigos.add(usuario);
  }
  
  public boolean removerAmigo(final Usuario usuario) {
    return this.amigos.remove(usuario);
  }
  
  public String cambiarPassword(final String pass) {
    return this.password = pass;
  }
  
  public int cambiarEdad(final int ed) {
    return this.edad = ed;
  }
  
  public double agregarSaldo(final double din) {
    double _dinero = this.dinero;
    return this.dinero = (_dinero + din);
  }
  
  public double removerSaldo(final double din) {
    double _dinero = this.dinero;
    return this.dinero = (_dinero - din);
  }
  
  @Pure
  public String getUsuario() {
    return this.usuario;
  }
  
  public void setUsuario(final String usuario) {
    this.usuario = usuario;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public String getApellido() {
    return this.apellido;
  }
  
  public void setApellido(final String apellido) {
    this.apellido = apellido;
  }
  
  @Pure
  public String getPassword() {
    return this.password;
  }
  
  public void setPassword(final String password) {
    this.password = password;
  }
  
  @Pure
  public int getEdad() {
    return this.edad;
  }
  
  public void setEdad(final int edad) {
    this.edad = edad;
  }
  
  @Pure
  public double getDinero() {
    return this.dinero;
  }
  
  public void setDinero(final double dinero) {
    this.dinero = dinero;
  }
  
  @Pure
  public List<Usuario> getAmigos() {
    return this.amigos;
  }
  
  public void setAmigos(final List<Usuario> amigos) {
    this.amigos = amigos;
  }
  
  @Pure
  public CarritoDeCompras getCarritoDeCompras() {
    return this.carritoDeCompras;
  }
  
  public void setCarritoDeCompras(final CarritoDeCompras carritoDeCompras) {
    this.carritoDeCompras = carritoDeCompras;
  }
  
  @Pure
  public Set<Pasaje> getPasajesComprados() {
    return this.pasajesComprados;
  }
  
  public void setPasajesComprados(final Set<Pasaje> pasajesComprados) {
    this.pasajesComprados = pasajesComprados;
  }
}
