package Clases;

import Clases.Asiento;
import Clases.Reserva;
import Clases.Vuelo;
import Repositorio.Entidad;
import java.util.HashSet;
import java.util.Set;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Usuario implements Entidad {
  private String id;
  
  private String nombre;
  
  private String apellido;
  
  private int edad;
  
  private double dinero;
  
  private Set<Usuario> amigos = new HashSet<Usuario>();
  
  private Set<Reserva> reservas = new HashSet<Reserva>();
  
  @Override
  public String getID() {
    return this.id;
  }
  
  @Override
  public String setID(final String idd) {
    return this.id = idd;
  }
  
  public boolean comprarPasaje(final Vuelo vuelo, final Asiento asiento) {
    Reserva _reserva = new Reserva(vuelo, asiento);
    return this.reservas.add(_reserva);
  }
  
  public boolean addAmigo(final Usuario usuario) {
    return this.amigos.add(usuario);
  }
  
  public boolean removerAmigo(final Usuario usuario) {
    return this.amigos.remove(usuario);
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
  public Set<Usuario> getAmigos() {
    return this.amigos;
  }
  
  public void setAmigos(final Set<Usuario> amigos) {
    this.amigos = amigos;
  }
  
  @Pure
  public Set<Reserva> getReservas() {
    return this.reservas;
  }
  
  public void setReservas(final Set<Reserva> reservas) {
    this.reservas = reservas;
  }
}
