package Parsers

import java.time.LocalDate
import java.time.format.DateTimeFormatter
import org.uqbar.commons.model.exceptions.UserException

class ParserDate {
	
	static val DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy")
	
	static def ParseStringToDate(String date){
		try{
			if(!date.nullOrEmpty){
				LocalDate.parse(date,formatter)
			}
		} catch(UserException exception){
			throw new UserException("anda mal")
		}
	}
}