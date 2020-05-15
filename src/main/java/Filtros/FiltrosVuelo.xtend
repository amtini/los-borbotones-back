package Filtros

import org.eclipse.xtend.lib.annotations.Accessors
import java.time.LocalDate
import Parsers.ParserDate

@Accessors
class FiltrosVuelo {
	String origen
	String destino
	LocalDate desde
	LocalDate hasta
	boolean ventanilla
	String claseAsiento
	Boolean disponible = true

	new(String _origen, String _destino, String _desde, String _hasta, String _ventanilla, String _claseAsiento) {
		origen = _origen
		destino = _destino
		desde = ParserDate.ParseStringToDate(_desde)
		hasta = ParserDate.ParseStringToDate(_hasta)
		ventanilla = Boolean.parseBoolean(_ventanilla)
		claseAsiento = _claseAsiento
	}
}