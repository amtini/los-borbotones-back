package App;

import Clases.Aerolinea;
import Clases.Asiento;
import Clases.Avion;
import Clases.ClaseAsiento;
import Clases.Pasaje;
import Clases.Usuario;
import Clases.Vuelo;
import Clases.VueloCompuesto;
import Repositorio.RepositorioAsiento;
import Repositorio.RepositorioUsuario;
import Repositorio.RepositorioVuelo;
import java.time.LocalDate;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;

@SuppressWarnings("all")
public class AterrizarBootstrap {
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
        it.setNombre("Boeing 747");
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
    Aerolinea _aerolinea = new Aerolinea();
    final Procedure1<Aerolinea> _function_11 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Aerolineas Argentinas");
        it.setPrecioAsiento(Double.valueOf(20.0));
      }
    };
    final Aerolinea AerolineasArgentinas = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea, _function_11);
    Aerolinea _aerolinea_1 = new Aerolinea();
    final Procedure1<Aerolinea> _function_12 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Luftansa");
        it.setPrecioAsiento(Double.valueOf(2000.0));
      }
    };
    final Aerolinea Luftansa = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea_1, _function_12);
    Aerolinea _aerolinea_2 = new Aerolinea();
    final Procedure1<Aerolinea> _function_13 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Copa Airlans");
        it.setPrecioAsiento(Double.valueOf(700.0));
      }
    };
    final Aerolinea CopaAirlans = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea_2, _function_13);
    Aerolinea _aerolinea_3 = new Aerolinea();
    final Procedure1<Aerolinea> _function_14 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Varig");
        it.setPrecioAsiento(Double.valueOf(500.0));
      }
    };
    final Aerolinea Varig = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea_3, _function_14);
    Aerolinea _aerolinea_4 = new Aerolinea();
    final Procedure1<Aerolinea> _function_15 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Lan Chile");
        it.setPrecioAsiento(Double.valueOf(300.0));
      }
    };
    final Aerolinea LanChile = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea_4, _function_15);
    Aerolinea _aerolinea_5 = new Aerolinea();
    final Procedure1<Aerolinea> _function_16 = new Procedure1<Aerolinea>() {
      public void apply(final Aerolinea it) {
        it.setNombre("Air France");
        it.setPrecioAsiento(Double.valueOf(1000.0));
      }
    };
    final Aerolinea AirFrance = ObjectExtensions.<Aerolinea>operator_doubleArrow(_aerolinea_5, _function_16);
    Vuelo _vuelo = new Vuelo();
    final Procedure1<Vuelo> _function_17 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Rio de Janeiro");
        it.setHorarioDePartida(LocalDate.of(2020, 9, 1));
        it.setAerolinea(AerolineasArgentinas);
        it.setDuracionDeVuelo(Double.valueOf(5.0));
        it.setAvion(Boeing747);
        it.setPrecioBase(Double.valueOf(8000.0));
      }
    };
    final Vuelo vueloBSaRio = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo, _function_17);
    Asiento _asiento = new Asiento();
    final Procedure1<Asiento> _function_18 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento1 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento, _function_18);
    Asiento _asiento_1 = new Asiento();
    final Procedure1<Asiento> _function_19 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento2 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_1, _function_19);
    Asiento _asiento_2 = new Asiento();
    final Procedure1<Asiento> _function_20 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento3 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_2, _function_20);
    Asiento _asiento_3 = new Asiento();
    final Procedure1<Asiento> _function_21 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento25 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_3, _function_21);
    Boeing747.getAsientos().add(asiento1);
    Boeing747.getAsientos().add(asiento2);
    Boeing747.getAsientos().add(asiento3);
    Vuelo _vuelo_1 = new Vuelo();
    final Procedure1<Vuelo> _function_22 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Kingston");
        it.setHorarioDePartida(LocalDate.of(2020, 7, 9));
        it.setAerolinea(Luftansa);
        it.setDuracionDeVuelo(Double.valueOf(7.0));
        it.setAvion(AirbusA320);
        it.setPrecioBase(Double.valueOf(50000.0));
      }
    };
    final Vuelo vueloBSaJamaica = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_1, _function_22);
    Asiento _asiento_4 = new Asiento();
    final Procedure1<Asiento> _function_23 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento4 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_4, _function_23);
    Asiento _asiento_5 = new Asiento();
    final Procedure1<Asiento> _function_24 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento5 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_5, _function_24);
    Asiento _asiento_6 = new Asiento();
    final Procedure1<Asiento> _function_25 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento6 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_6, _function_25);
    Asiento _asiento_7 = new Asiento();
    final Procedure1<Asiento> _function_26 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento36 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_7, _function_26);
    AirbusA320.getAsientos().add(asiento4);
    AirbusA320.getAsientos().add(asiento5);
    AirbusA320.getAsientos().add(asiento6);
    AirbusA320.getAsientos().add(asiento36);
    Vuelo _vuelo_2 = new Vuelo();
    final Procedure1<Vuelo> _function_27 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Paris");
        it.setHorarioDePartida(LocalDate.of(2020, 7, 1));
        it.setAerolinea(AirFrance);
        it.setDuracionDeVuelo(Double.valueOf(17.0));
        it.setAvion(Tu204);
        it.setPrecioBase(Double.valueOf(80000.0));
      }
    };
    final Vuelo vueloAFrancia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_2, _function_27);
    Asiento _asiento_8 = new Asiento();
    final Procedure1<Asiento> _function_28 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento7 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_8, _function_28);
    Asiento _asiento_9 = new Asiento();
    final Procedure1<Asiento> _function_29 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento8 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_9, _function_29);
    Asiento _asiento_10 = new Asiento();
    final Procedure1<Asiento> _function_30 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento9 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_10, _function_30);
    Asiento _asiento_11 = new Asiento();
    final Procedure1<Asiento> _function_31 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento34 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_11, _function_31);
    Asiento _asiento_12 = new Asiento();
    final Procedure1<Asiento> _function_32 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento35 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_12, _function_32);
    Tu204.getAsientos().add(asiento7);
    Tu204.getAsientos().add(asiento8);
    Tu204.getAsientos().add(asiento9);
    Tu204.getAsientos().add(asiento34);
    Tu204.getAsientos().add(asiento35);
    Vuelo _vuelo_3 = new Vuelo();
    final Procedure1<Vuelo> _function_33 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Santiago");
        it.setHorarioDePartida(LocalDate.of(2020, 7, 14));
        it.setAerolinea(LanChile);
        it.setDuracionDeVuelo(Double.valueOf(3.0));
        it.setAvion(Il96);
        it.setPrecioBase(Double.valueOf(200.0));
      }
    };
    final Vuelo vueloBSaChile = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_3, _function_33);
    Asiento _asiento_13 = new Asiento();
    final Procedure1<Asiento> _function_34 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento10 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_13, _function_34);
    Asiento _asiento_14 = new Asiento();
    final Procedure1<Asiento> _function_35 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento11 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_14, _function_35);
    Asiento _asiento_15 = new Asiento();
    final Procedure1<Asiento> _function_36 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento12 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_15, _function_36);
    Il96.getAsientos().add(asiento10);
    Il96.getAsientos().add(asiento11);
    Il96.getAsientos().add(asiento12);
    Vuelo _vuelo_4 = new Vuelo();
    final Procedure1<Vuelo> _function_37 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Miami");
        it.setHorarioDePartida(LocalDate.of(2020, 8, 1));
        it.setAerolinea(CopaAirlans);
        it.setDuracionDeVuelo(Double.valueOf(12.0));
        it.setAvion(CRJ200);
        it.setPrecioBase(Double.valueOf(15000.0));
      }
    };
    final Vuelo vueloBSaMiami = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_4, _function_37);
    Asiento _asiento_16 = new Asiento();
    final Procedure1<Asiento> _function_38 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento13 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_16, _function_38);
    Asiento _asiento_17 = new Asiento();
    final Procedure1<Asiento> _function_39 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento14 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_17, _function_39);
    Asiento _asiento_18 = new Asiento();
    final Procedure1<Asiento> _function_40 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento15 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_18, _function_40);
    Asiento _asiento_19 = new Asiento();
    final Procedure1<Asiento> _function_41 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento26 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_19, _function_41);
    Asiento _asiento_20 = new Asiento();
    final Procedure1<Asiento> _function_42 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento27 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_20, _function_42);
    CRJ200.getAsientos().add(asiento13);
    CRJ200.getAsientos().add(asiento14);
    CRJ200.getAsientos().add(asiento15);
    CRJ200.getAsientos().add(asiento26);
    CRJ200.getAsientos().add(asiento27);
    Vuelo _vuelo_5 = new Vuelo();
    final Procedure1<Vuelo> _function_43 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Rio de Janeiro");
        it.setHorarioDePartida(LocalDate.of(2021, 6, 1));
        it.setAerolinea(AirFrance);
        it.setDuracionDeVuelo(Double.valueOf(15.0));
        it.setAvion(Boeing777);
        it.setPrecioBase(Double.valueOf(30000.0));
      }
    };
    final Vuelo vueloBSaItalia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_5, _function_43);
    Asiento _asiento_21 = new Asiento();
    final Procedure1<Asiento> _function_44 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento16 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_21, _function_44);
    Asiento _asiento_22 = new Asiento();
    final Procedure1<Asiento> _function_45 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento17 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_22, _function_45);
    Asiento _asiento_23 = new Asiento();
    final Procedure1<Asiento> _function_46 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento18 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_23, _function_46);
    Asiento _asiento_24 = new Asiento();
    final Procedure1<Asiento> _function_47 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento28 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_24, _function_47);
    Asiento _asiento_25 = new Asiento();
    final Procedure1<Asiento> _function_48 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento29 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_25, _function_48);
    Boeing777.getAsientos().add(asiento16);
    Boeing777.getAsientos().add(asiento17);
    Boeing777.getAsientos().add(asiento18);
    Boeing777.getAsientos().add(asiento28);
    Boeing777.getAsientos().add(asiento29);
    Vuelo _vuelo_6 = new Vuelo();
    final Procedure1<Vuelo> _function_49 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Sidney");
        it.setHorarioDePartida(LocalDate.of(2021, 3, 1));
        it.setAerolinea(Luftansa);
        it.setDuracionDeVuelo(Double.valueOf(16.0));
        it.setAvion(Boeing767);
        it.setPrecioBase(Double.valueOf(80000.0));
      }
    };
    final Vuelo vueloBSaAustralia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_6, _function_49);
    Asiento _asiento_26 = new Asiento();
    final Procedure1<Asiento> _function_50 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento19 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_26, _function_50);
    Asiento _asiento_27 = new Asiento();
    final Procedure1<Asiento> _function_51 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento20 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_27, _function_51);
    Asiento _asiento_28 = new Asiento();
    final Procedure1<Asiento> _function_52 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento21 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_28, _function_52);
    Asiento _asiento_29 = new Asiento();
    final Procedure1<Asiento> _function_53 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento30 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_29, _function_53);
    Asiento _asiento_30 = new Asiento();
    final Procedure1<Asiento> _function_54 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento31 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_30, _function_54);
    Boeing767.getAsientos().add(asiento19);
    Boeing767.getAsientos().add(asiento20);
    Boeing767.getAsientos().add(asiento21);
    Boeing767.getAsientos().add(asiento30);
    Boeing767.getAsientos().add(asiento31);
    Vuelo _vuelo_7 = new Vuelo();
    final Procedure1<Vuelo> _function_55 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Londres");
        it.setHorarioDePartida(LocalDate.of(2021, 1, 5));
        it.setAerolinea(Varig);
        it.setDuracionDeVuelo(Double.valueOf(10.0));
        it.setAvion(Boeing757);
        it.setPrecioBase(Double.valueOf(8000.0));
      }
    };
    final Vuelo vueloBSaInglaterra = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_7, _function_55);
    Asiento _asiento_31 = new Asiento();
    final Procedure1<Asiento> _function_56 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento22 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_31, _function_56);
    Asiento _asiento_32 = new Asiento();
    final Procedure1<Asiento> _function_57 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento23 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_32, _function_57);
    Asiento _asiento_33 = new Asiento();
    final Procedure1<Asiento> _function_58 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento24 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_33, _function_58);
    Asiento _asiento_34 = new Asiento();
    final Procedure1<Asiento> _function_59 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento32 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_34, _function_59);
    Asiento _asiento_35 = new Asiento();
    final Procedure1<Asiento> _function_60 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(false);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento33 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_35, _function_60);
    Boeing757.getAsientos().add(asiento22);
    Boeing757.getAsientos().add(asiento23);
    Boeing757.getAsientos().add(asiento24);
    Boeing757.getAsientos().add(asiento32);
    Boeing757.getAsientos().add(asiento33);
    Avion _avion_8 = new Avion();
    final Procedure1<Avion> _function_61 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Rapido del Norte");
      }
    };
    final Avion RapidoDelNorte = ObjectExtensions.<Avion>operator_doubleArrow(_avion_8, _function_61);
    Asiento _asiento_36 = new Asiento();
    final Procedure1<Asiento> _function_62 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asientoDeRapidoDelNorte = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_36, _function_62);
    RapidoDelNorte.getAsientos().add(asientoDeRapidoDelNorte);
    VueloCompuesto _vueloCompuesto = new VueloCompuesto();
    final Procedure1<VueloCompuesto> _function_63 = new Procedure1<VueloCompuesto>() {
      public void apply(final VueloCompuesto it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("La Habana");
        it.setHorarioDePartida(LocalDate.of(2020, 11, 23));
        it.setAerolinea(AerolineasArgentinas);
        it.setAvion(RapidoDelNorte);
        it.setPrecioBase(Double.valueOf(45000.0));
      }
    };
    final VueloCompuesto vueloARGaCHILEaCUBA = ObjectExtensions.<VueloCompuesto>operator_doubleArrow(_vueloCompuesto, _function_63);
    Vuelo _vuelo_8 = new Vuelo();
    final Procedure1<Vuelo> _function_64 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("Santiago de Chile");
        it.setHorarioDePartida(LocalDate.of(2020, 11, 23));
        it.setAerolinea(AerolineasArgentinas);
        it.setDuracionDeVuelo(Double.valueOf(2.0));
        it.setAvion(RapidoDelNorte);
        it.setPrecioBase(Double.valueOf(8000.0));
      }
    };
    final Vuelo vueloBSaCHILE = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_8, _function_64);
    Vuelo _vuelo_9 = new Vuelo();
    final Procedure1<Vuelo> _function_65 = new Procedure1<Vuelo>() {
      public void apply(final Vuelo it) {
        it.setCiudadDeOrigen("Santiago de Chile");
        it.setCiudadDeDestino("La Habana");
        it.setHorarioDePartida(LocalDate.of(2020, 11, 23));
        it.setAerolinea(AerolineasArgentinas);
        it.setDuracionDeVuelo(Double.valueOf(12.0));
        it.setAvion(RapidoDelNorte);
        it.setPrecioBase(Double.valueOf(18000.0));
      }
    };
    final Vuelo vueloCHILEaCUBA = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_9, _function_65);
    vueloARGaCHILEaCUBA.getEscalas().add(vueloBSaCHILE);
    vueloARGaCHILEaCUBA.getEscalas().add(vueloCHILEaCUBA);
    Usuario _usuario = new Usuario();
    final Procedure1<Usuario> _function_66 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("mmorena");
        it.setNombre("Martin");
        it.setApellido("Morena");
        it.setPassword("mmorena");
        it.setEdad(28);
        it.setDinero(25000.0);
      }
    };
    final Usuario MartinMorena = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario, _function_66);
    Usuario _usuario_1 = new Usuario();
    final Procedure1<Usuario> _function_67 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("lperez");
        it.setNombre("Lucas");
        it.setApellido("Perez");
        it.setPassword("lperez");
        it.setEdad(24);
        it.setDinero(155000.0);
      }
    };
    final Usuario LucasPerez = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_1, _function_67);
    Usuario _usuario_2 = new Usuario();
    final Procedure1<Usuario> _function_68 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("ndichiara");
        it.setNombre("Nicolas");
        it.setApellido("Dichiara");
        it.setPassword("ndichiara");
        it.setEdad(25);
        it.setDinero(74856.0);
      }
    };
    final Usuario NicolasDichiara = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_2, _function_68);
    Usuario _usuario_3 = new Usuario();
    final Procedure1<Usuario> _function_69 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("bzerial");
        it.setNombre("Braian");
        it.setApellido("Zerial");
        it.setPassword("bzerial");
        it.setEdad(30);
        it.setDinero(74358.0);
      }
    };
    final Usuario BraianZerial = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_3, _function_69);
    Usuario _usuario_4 = new Usuario();
    final Procedure1<Usuario> _function_70 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("atini");
        it.setNombre("Agustin Mario");
        it.setApellido("Tini");
        it.setPassword("atini");
        it.setEdad(24);
        it.setDinero(148654.0);
      }
    };
    final Usuario AgustinMarioTini = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_4, _function_70);
    Usuario _usuario_5 = new Usuario();
    final Procedure1<Usuario> _function_71 = new Procedure1<Usuario>() {
      public void apply(final Usuario it) {
        it.setUsuario("jlopez");
        it.setNombre("Jorgue");
        it.setApellido("Lopez");
        it.setPassword("jlopez");
        it.setEdad(56);
        it.setDinero(23984.0);
      }
    };
    final Usuario JorgeLopez = ObjectExtensions.<Usuario>operator_doubleArrow(_usuario_5, _function_71);
    AgustinMarioTini.agregarAmigo(NicolasDichiara);
    AgustinMarioTini.agregarAmigo(BraianZerial);
    BraianZerial.agregarAmigo(NicolasDichiara);
    NicolasDichiara.agregarAmigo(BraianZerial);
    LocalDate _of = LocalDate.of(2020, 3, 29);
    final Pasaje pasajeBSaRioMMorena = new Pasaje(vueloBSaRio, asiento25, Double.valueOf(15000.0), _of);
    LocalDate _of_1 = LocalDate.of(2020, 4, 16);
    final Pasaje pasajeBSaCHILEMMorena = new Pasaje(vueloBSaMiami, asiento26, Double.valueOf(36000.0), _of_1);
    MartinMorena.getPasajesComprados().add(pasajeBSaRioMMorena);
    MartinMorena.getPasajesComprados().add(pasajeBSaCHILEMMorena);
    final RepositorioAsiento repoAsiento = new RepositorioAsiento();
    final RepositorioUsuario repoUsuario = new RepositorioUsuario();
    final RepositorioVuelo repoVuelo = new RepositorioVuelo();
    repoVuelo.create(vueloBSaRio);
    repoVuelo.create(vueloBSaJamaica);
    repoVuelo.create(vueloAFrancia);
    repoVuelo.create(vueloBSaChile);
    repoVuelo.create(vueloBSaMiami);
    repoVuelo.create(vueloBSaItalia);
    repoVuelo.create(vueloBSaAustralia);
    repoVuelo.create(vueloBSaInglaterra);
    repoVuelo.create(vueloARGaCHILEaCUBA);
    repoUsuario.create(MartinMorena);
    repoUsuario.create(LucasPerez);
    repoUsuario.create(NicolasDichiara);
    repoUsuario.create(BraianZerial);
    repoUsuario.create(AgustinMarioTini);
    repoUsuario.create(JorgeLopez);
    repoAsiento.create(asiento1);
    repoAsiento.create(asiento2);
    repoAsiento.create(asiento3);
    repoAsiento.create(asiento4);
    repoAsiento.create(asiento5);
    repoAsiento.create(asiento6);
    repoAsiento.create(asiento7);
    repoAsiento.create(asiento8);
    repoAsiento.create(asiento9);
    repoAsiento.create(asiento10);
    repoAsiento.create(asiento11);
    repoAsiento.create(asiento12);
    repoAsiento.create(asiento13);
    repoAsiento.create(asiento14);
    repoAsiento.create(asiento15);
    repoAsiento.create(asiento16);
    repoAsiento.create(asiento17);
    repoAsiento.create(asiento18);
    repoAsiento.create(asiento19);
    repoAsiento.create(asiento20);
    repoAsiento.create(asiento21);
    repoAsiento.create(asiento22);
    repoAsiento.create(asiento23);
    repoAsiento.create(asiento24);
    repoAsiento.create(asiento25);
    repoAsiento.create(asiento26);
    repoAsiento.create(asiento27);
    repoAsiento.create(asiento28);
    repoAsiento.create(asiento29);
    repoAsiento.create(asiento30);
    repoAsiento.create(asiento31);
    repoAsiento.create(asiento32);
    repoAsiento.create(asiento33);
    repoAsiento.create(asiento34);
    repoAsiento.create(asiento35);
    repoAsiento.create(asiento36);
  }
}
