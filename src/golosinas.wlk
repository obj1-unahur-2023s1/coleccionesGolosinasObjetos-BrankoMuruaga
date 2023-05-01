import sabores.*

object bombon {
	var peso = 15
	
	method sabor() = frutilla
	
	method contieneGluten() = true
	
	method precio() = 5
	
	method peso() = peso
	
	method recibirMordisco(){
		peso = (peso * 0.8) - 1
	}
	
}

object alfajor {
	var peso = 300
	
	method sabor() = chocolate
	
	method contieneGluten() = false
	
	method precio() = 12
	
	method peso() = peso
	
	method recibirMordisco(){
		peso *= 0.8
	}
}

object caramelo {
	var peso = 5
	
	method sabor() = frutilla
	
	method contieneGluten() = true
	
	method precio() = 1
	
	method peso() = peso
	
	method recibirMordisco(){
		peso --
	}
}

object chupetin {
	var peso = 7
	
	method sabor() = naranja
	
	method contieneGluten() = true
	
	method precio() = 2
	
	method peso() = peso
	
	method recibirMordisco(){
		peso = 2.max(peso * 0.9)
	}
}

object oblea {
	var peso = 250
	
	method sabor() = vainilla
	
	method contieneGluten() = false
	
	method precio() = 5
	
	method peso() = peso
	
	method recibirMordisco(){
		if(peso > 70){
			peso *= 0.5
		}
		else{
			peso *= 0.75 
		}
	}
}

object chocolatin {
	var pesoActual
	var pesoInicial
	
	method sabor() = chocolate
	
	method contieneGluten() = false
	
	method peso(nuevoPeso){
		pesoActual = nuevoPeso
		if(pesoInicial == null){
			pesoInicial = nuevoPeso
		}
	}
	
	method peso() = pesoActual
	
	method precio() = pesoInicial/2
	
	
	method recibirMordisco(){
		pesoActual -= 2
	}
}

object pastillaTuttiFrutti {
	var property contieneGluten
	var property peso = 5
	var property sabor = frutilla
	const sabores = [frutilla, chocolate, naranja]
	var posicionDelSabor = 0
	
	method precio(){
		if(contieneGluten){
			return 10
		}
		else{
			return 7
		}
	}
	
	
	method recibirMordisco(){
		posicionDelSabor++
		self.sabor(sabores.get(posicionDelSabor % sabores.size()))
	}
}

object golosinaBaniada {
	var property golosinaBase
	var mordiscos = 2
	
	method sabor() = golosinaBase.sabor()
	
	method contieneGluten() = golosinaBase.contieneGluten()
	
	
	method peso() = golosinaBase.peso() + (mordiscos * 2)
	
	method precio() = golosinaBase.precio() + 2
	
	
	method recibirMordisco(){
		golosinaBase.recibirMordisco()
		mordiscos--
	}
}

