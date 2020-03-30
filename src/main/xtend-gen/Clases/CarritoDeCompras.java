package Clases;

import Clases.Asiento;
import Clases.Ticket;
import Clases.Vuelo;
import com.google.common.base.Objects;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class CarritoDeCompras {
  private List<Ticket> tickets = new ArrayList<Ticket>();
  
  public void agregarTicketAlCarrito(final Ticket ticket) {
    this.tickets.add(ticket);
    ticket.reservar();
  }
  
  public void removerTicketDelCarrito(final Vuelo vuelo, final Asiento asiento) {
    final Ticket ticket = this.buscarTicket(vuelo, asiento);
    this.tickets.remove(ticket);
    ticket.cancelarReserva();
  }
  
  public Ticket buscarTicket(final Vuelo vuelo, final Asiento asiento) {
    final Function1<Ticket, Boolean> _function = new Function1<Ticket, Boolean>() {
      public Boolean apply(final Ticket it) {
        return Boolean.valueOf((Objects.equal(it.getVuelo(), vuelo) && Objects.equal(it.getAsiento(), asiento)));
      }
    };
    return IterableExtensions.<Ticket>findFirst(this.tickets, _function);
  }
  
  public void limpiarCarritoDeCompras() {
    this.tickets.clear();
  }
  
  public Double costoTotalDelCarrito() {
    final Function2<Double, Ticket, Double> _function = new Function2<Double, Ticket, Double>() {
      public Double apply(final Double acum, final Ticket ticket) {
        double _costo = ticket.costo();
        return Double.valueOf(((acum).doubleValue() + _costo));
      }
    };
    return IterableExtensions.<Ticket, Double>fold(this.tickets, Double.valueOf(0.0), _function);
  }
  
  @Pure
  public List<Ticket> getTickets() {
    return this.tickets;
  }
  
  public void setTickets(final List<Ticket> tickets) {
    this.tickets = tickets;
  }
}
