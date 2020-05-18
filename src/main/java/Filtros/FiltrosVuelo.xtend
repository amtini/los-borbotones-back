package Filtros

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import Parsers.ParserDate
import org.mongodb.morphia.annotations.Entity
import org.mongodb.morphia.annotations.Id
import org.bson.types.ObjectId
import org.uqbar.commons.model.annotations.Observable
import org.mongodb.morphia.annotations.Transient

@Observable
@Accessors
@Entity(value="FiltrosVuelo")
class FiltrosVuelo {
	
	new(){
	}
	
	@Id ObjectId ID
	
	String idUsuario
	
	String origen
	String destino
	LocalDate desde
	LocalDate hasta
	boolean ventanilla
	String claseAsiento

	new(String _origen, String _destino, String _desde, String _hasta, String _ventanilla, String _claseAsiento, String _idUsuario) {
		origen = _origen
		destino = _destino
		desde = ParserDate.ParseStringToDate(_desde)
		hasta = ParserDate.ParseStringToDate(_hasta)
		ventanilla = Boolean.parseBoolean(_ventanilla)
		claseAsiento = _claseAsiento
		idUsuario = _idUsuario
	}
	
	
	
	
	
}