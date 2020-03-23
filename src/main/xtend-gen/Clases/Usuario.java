package Clases;

import Clases.Vuelo;
import Repositorio.Entidad;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario implements Entidad {
  private String id;
  
  private String nombre;
  
  private String apellido;
  
  private String password;
  
  private int edad;
  
  private double dinero;
  
  private List<Usuario> amigos = new ArrayList<Usuario>();
  
  private List<Vuelo> pasajesComprados = new ArrayList<Vuelo>();
  
  public String getID() {
    return this.id;
  }
  
  public String setID(final String idd) {
    return this.id = idd;
  }
  
  public boolean comprarPasaje(final Vuelo vuelo) {
    return this.pasajesComprados.add(vuelo);
  }
  
  public boolean addAmigo(final Usuario usuario) {
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
  public String getId() {
    return this.id;
  }
  
  public void setId(final String id) {
    this.id = id;
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
  public List<Vuelo> getPasajesComprados() {
    return this.pasajesComprados;
  }
  
  public void setPasajesComprados(final List<Vuelo> pasajesComprados) {
    this.pasajesComprados = pasajesComprados;
  }
}
