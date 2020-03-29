package App;

import Clases.Aerolinea;
import Clases.Asiento;
import Clases.Avion;
import Clases.ClaseAsiento;
import Clases.Vuelo;
import Clases.VueloCompuesto;
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
    Boeing747.agregarAsiento(asiento1);
    Boeing747.agregarAsiento(asiento2);
    Boeing747.agregarAsiento(asiento3);
    Vuelo _vuelo_1 = new Vuelo();
    final Procedure1<Vuelo> _function_21 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaJamaica = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_1, _function_21);
    Asiento _asiento_3 = new Asiento();
    final Procedure1<Asiento> _function_22 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento4 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_3, _function_22);
    Asiento _asiento_4 = new Asiento();
    final Procedure1<Asiento> _function_23 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento5 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_4, _function_23);
    Asiento _asiento_5 = new Asiento();
    final Procedure1<Asiento> _function_24 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento6 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_5, _function_24);
    Boeing747.agregarAsiento(asiento4);
    Boeing747.agregarAsiento(asiento5);
    Boeing747.agregarAsiento(asiento6);
    Vuelo _vuelo_2 = new Vuelo();
    final Procedure1<Vuelo> _function_25 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloAFrancia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_2, _function_25);
    Asiento _asiento_6 = new Asiento();
    final Procedure1<Asiento> _function_26 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento7 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_6, _function_26);
    Asiento _asiento_7 = new Asiento();
    final Procedure1<Asiento> _function_27 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento8 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_7, _function_27);
    Asiento _asiento_8 = new Asiento();
    final Procedure1<Asiento> _function_28 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento9 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_8, _function_28);
    Boeing747.agregarAsiento(asiento7);
    Boeing747.agregarAsiento(asiento8);
    Boeing747.agregarAsiento(asiento9);
    Vuelo _vuelo_3 = new Vuelo();
    final Procedure1<Vuelo> _function_29 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaChile = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_3, _function_29);
    Asiento _asiento_9 = new Asiento();
    final Procedure1<Asiento> _function_30 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento10 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_9, _function_30);
    Asiento _asiento_10 = new Asiento();
    final Procedure1<Asiento> _function_31 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento11 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_10, _function_31);
    Asiento _asiento_11 = new Asiento();
    final Procedure1<Asiento> _function_32 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento12 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_11, _function_32);
    Boeing747.agregarAsiento(asiento10);
    Boeing747.agregarAsiento(asiento11);
    Boeing747.agregarAsiento(asiento12);
    Vuelo _vuelo_4 = new Vuelo();
    final Procedure1<Vuelo> _function_33 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaMiami = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_4, _function_33);
    Asiento _asiento_12 = new Asiento();
    final Procedure1<Asiento> _function_34 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento13 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_12, _function_34);
    Asiento _asiento_13 = new Asiento();
    final Procedure1<Asiento> _function_35 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento14 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_13, _function_35);
    Asiento _asiento_14 = new Asiento();
    final Procedure1<Asiento> _function_36 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento15 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_14, _function_36);
    Boeing747.agregarAsiento(asiento13);
    Boeing747.agregarAsiento(asiento14);
    Boeing747.agregarAsiento(asiento15);
    Vuelo _vuelo_5 = new Vuelo();
    final Procedure1<Vuelo> _function_37 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaItalia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_5, _function_37);
    Asiento _asiento_15 = new Asiento();
    final Procedure1<Asiento> _function_38 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento16 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_15, _function_38);
    Asiento _asiento_16 = new Asiento();
    final Procedure1<Asiento> _function_39 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento17 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_16, _function_39);
    Asiento _asiento_17 = new Asiento();
    final Procedure1<Asiento> _function_40 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento18 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_17, _function_40);
    Boeing747.agregarAsiento(asiento16);
    Boeing747.agregarAsiento(asiento17);
    Boeing747.agregarAsiento(asiento18);
    Vuelo _vuelo_6 = new Vuelo();
    final Procedure1<Vuelo> _function_41 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaAustralia = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_6, _function_41);
    Asiento _asiento_18 = new Asiento();
    final Procedure1<Asiento> _function_42 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(turista);
      }
    };
    final Asiento asiento19 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_18, _function_42);
    Asiento _asiento_19 = new Asiento();
    final Procedure1<Asiento> _function_43 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(true);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento20 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_19, _function_43);
    Asiento _asiento_20 = new Asiento();
    final Procedure1<Asiento> _function_44 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento21 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_20, _function_44);
    Boeing747.agregarAsiento(asiento19);
    Boeing747.agregarAsiento(asiento20);
    Boeing747.agregarAsiento(asiento21);
    Vuelo _vuelo_7 = new Vuelo();
    final Procedure1<Vuelo> _function_45 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaInglaterra = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_7, _function_45);
    Asiento _asiento_21 = new Asiento();
    final Procedure1<Asiento> _function_46 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento22 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_21, _function_46);
    Asiento _asiento_22 = new Asiento();
    final Procedure1<Asiento> _function_47 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asiento23 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_22, _function_47);
    Asiento _asiento_23 = new Asiento();
    final Procedure1<Asiento> _function_48 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(primeraClase);
      }
    };
    final Asiento asiento24 = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_23, _function_48);
    Boeing747.agregarAsiento(asiento22);
    Boeing747.agregarAsiento(asiento23);
    Boeing747.agregarAsiento(asiento24);
    Avion _avion_8 = new Avion();
    final Procedure1<Avion> _function_49 = new Procedure1<Avion>() {
      public void apply(final Avion it) {
        it.setNombre("Rapido del Norte");
      }
    };
    final Avion RapidoDelNorte = ObjectExtensions.<Avion>operator_doubleArrow(_avion_8, _function_49);
    Asiento _asiento_24 = new Asiento();
    final Procedure1<Asiento> _function_50 = new Procedure1<Asiento>() {
      public void apply(final Asiento it) {
        it.setVentana(false);
        it.setDisponible(true);
        it.setClaseDeAsiento(bussisnes);
      }
    };
    final Asiento asientoDeRapidoDelNorte = ObjectExtensions.<Asiento>operator_doubleArrow(_asiento_24, _function_50);
    RapidoDelNorte.agregarAsiento(asientoDeRapidoDelNorte);
    VueloCompuesto _vueloCompuesto = new VueloCompuesto();
    final Procedure1<VueloCompuesto> _function_51 = new Procedure1<VueloCompuesto>() {
      public void apply(final VueloCompuesto it) {
        it.setCiudadDeOrigen("Buenos Aires");
        it.setCiudadDeDestino("La Habana");
        it.setHorarioDePartida(LocalDate.of(2020, 11, 23));
        it.setAerolinea(AerolineasArgentinas);
        it.setAvion(RapidoDelNorte);
        it.setPrecioBase(Double.valueOf(45000.0));
      }
    };
    final VueloCompuesto vueloARGaCHILEaCUBA = ObjectExtensions.<VueloCompuesto>operator_doubleArrow(_vueloCompuesto, _function_51);
    Vuelo _vuelo_8 = new Vuelo();
    final Procedure1<Vuelo> _function_52 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloBSaCHILE = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_8, _function_52);
    Vuelo _vuelo_9 = new Vuelo();
    final Procedure1<Vuelo> _function_53 = new Procedure1<Vuelo>() {
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
    final Vuelo vueloCHILEaCUBA = ObjectExtensions.<Vuelo>operator_doubleArrow(_vuelo_9, _function_53);
    vueloARGaCHILEaCUBA.agregarEscala(vueloBSaCHILE);
    vueloARGaCHILEaCUBA.agregarEscala(vueloCHILEaCUBA);
  }
}
