package App;

import Clases.Asiento;
import Clases.Avion;
import Clases.ClaseAsiento;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public class AterrizarApp {
  public static void main(final String[] args) {
    ClaseAsiento _claseAsiento = new ClaseAsiento();
    final Procedure1<ClaseAsiento> _function = new Procedure1<ClaseAsiento>() {
      public void apply(final ClaseAsiento it) {
        it.setPrecioClase(35000);
      }
    };
    final ClaseAsiento primeraClase = ObjectExtensions.<ClaseAsiento>operator_doubleArrow(_claseAsiento, _function);
    ClaseAsiento _claseAsiento_1 = new ClaseAsiento();
    final Procedure1<ClaseAsiento> _function_1 = new Procedure1<ClaseAsiento>() {
      public void apply(final ClaseAsiento it) {
        it.setPrecioClase(22000);
      }
    };
    final ClaseAsiento bussisnes = ObjectExtensions.<ClaseAsiento>operator_doubleArrow(_claseAsiento_1, _function_1);
    ClaseAsiento _claseAsiento_2 = new ClaseAsiento();
    final Procedure1<ClaseAsiento> _function_2 = new Procedure1<ClaseAsiento>() {
      public void apply(final ClaseAsiento it) {
        it.setPrecioClase(10000);
      }
    };
    final ClaseAsiento turista = ObjectExtensions.<ClaseAsiento>operator_doubleArrow(_claseAsiento_2, _function_2);
    Avion _avion = new Avion();
    final Procedure1<Avion> _function_3 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Boeing747");
      }
    };
    final Avion Boeing747 = ObjectExtensions.<Avion>operator_doubleArrow(_avion, _function_3);
    Avion _avion_1 = new Avion();
    final Procedure1<Avion> _function_4 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("AirbusA320");
      }
    };
    final Avion AirbusA320 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_1, _function_4);
    Avion _avion_2 = new Avion();
    final Procedure1<Avion> _function_5 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Tu204");
      }
    };
    final Avion Tu204 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_2, _function_5);
    Avion _avion_3 = new Avion();
    final Procedure1<Avion> _function_6 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Il96");
      }
    };
    final Avion Il96 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_3, _function_6);
    Avion _avion_4 = new Avion();
    final Procedure1<Avion> _function_7 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("CRJ200");
      }
    };
    final Avion CRJ200 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_4, _function_7);
    Avion _avion_5 = new Avion();
    final Procedure1<Avion> _function_8 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Boeing777");
      }
    };
    final Avion Boeing777 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_5, _function_8);
    Avion _avion_6 = new Avion();
    final Procedure1<Avion> _function_9 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Boeing767");
      }
    };
    final Avion Boeing767 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_6, _function_9);
    Avion _avion_7 = new Avion();
    final Procedure1<Avion> _function_10 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Boeing757");
      }
    };
    final Avion Boeing757 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_7, _function_10);
    Avion _avion_8 = new Avion();
    final Procedure1<Avion> _function_11 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("AirbusA380");
      }
    };
    final Avion AirbusA380 = ObjectExtensions.<Avion>operator_doubleArrow(_avion_8, _function_11);
    Asiento _asiento = new Asiento();
    final Procedure1<Asiento> _function_12 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento1 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento, _function_12);
    Asiento _asiento_1 = new Asiento();
    final Procedure1<Asiento> _function_13 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento2 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_1, _function_13);
    Asiento _asiento_2 = new Asiento();
    final Procedure1<Asiento> _function_14 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento3 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_2, _function_14);
  }
}
