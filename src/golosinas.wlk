import sabores.*

object bombon {
	var peso = 15
	
	method sabor() = frutilla
	
	method contieneGluten() = false
	
	method precio() = 5
	
	method peso() = peso
	
	method recibirMordisco(){
		peso = (peso * 0.8) - 1
	}
	
}

object alfajor {
	var peso = 300
	
	method sabor() = chocolate
	
	method contieneGluten() = true
	
	method precio() = 12
	
	method peso() = peso
	
	method recibirMordisco(){
		peso *= 0.8
	}
}

object caramelo {
	var peso = 5
	
	method sabor() = frutilla
	
	method contieneGluten() = false
	
	method precio() = 1
	
	method peso() = peso
	
	method recibirMordisco(){
		peso = 0.max(peso - 1)
	}
}

object chupetin {
	var peso = 7
	
	method sabor() = naranja
	
	method contieneGluten() = false
	
	method precio() = 2
	
	method peso() = peso
	
	method recibirMordisco(){
		peso = 2.max(peso * 0.9)
	}
}

object oblea {
	var peso = 250
	
	method sabor() = vainilla
	
	method contieneGluten() = true
	
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
	
	method contieneGluten() = true
	
	method peso(nuevoPeso){
		pesoActual = nuevoPeso
		if(pesoInicial == null){
			pesoInicial = nuevoPeso
		}
	}
	
	method peso() = pesoActual
	
	method precio() = pesoInicial/2
	
	
	method recibirMordisco(){
		pesoActual = 0.max(pesoActual - 2)
	}
}

object pastillaTuttiFrutti {
	var property contieneGluten
	var property peso = 5
	const sabores = [frutilla, chocolate, naranja]
	var posicionDelSabor = 0
	
	method precio() = if(contieneGluten) 10 else 7
	
	method sabor() = sabores.get(posicionDelSabor % sabores.size())
	
	method recibirMordisco(){
		posicionDelSabor++
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
		mordiscos = 0.max(mordiscos - 1)
	}
}

