import golosinas.*
import sabores.*

object mariano {
	const property bolsaDeGolosinas = []
	var ultimaGolosinaComprada
	var ultimaGolosinaDesechada
	
	method comprar(unaGolosina){
		bolsaDeGolosinas.add(unaGolosina)
		ultimaGolosinaComprada = unaGolosina
	}
	
	method desechar(unaGolosina) {
		bolsaDeGolosinas.remove(unaGolosina)
		ultimaGolosinaDesechada = unaGolosina
	}
	
	method cantidadDeGolosinas() = bolsaDeGolosinas.size()
	
	method tieneLaGolosina(unaGolosina) = bolsaDeGolosinas.contains(unaGolosina)
	
	method probarGolosinas() {
		bolsaDeGolosinas.forEach({g => g.recibirMordisco()})
	}
	
	method hayGolosinaSinTACC() = bolsaDeGolosinas.any({g => !g.contieneGluten()})
	
	method preciosCuidados() = bolsaDeGolosinas.all({g => g.precio() <= 10})
	
	method golosinaDeSabor(unSabor) = bolsaDeGolosinas.find({g => g.sabor() == unSabor})
	
	method golosinasDeSabor(unSabor) = bolsaDeGolosinas.filter({g => g.sabor() == unSabor})
	
	method sabores() = bolsaDeGolosinas.map({g => g.sabor()}).asSet()
	
	method golosinaMasCara() = bolsaDeGolosinas.max({g => g.precio()})
	
	method pesoGolosinas() = bolsaDeGolosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(bolsaDeGolosinas.asSet())
	
	method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(self.sabores())
	
	method gastoEn(sabor) = bolsaDeGolosinas.filter({g => g.sabor() == sabor}).sum({g => g.precio()})
	
	method saborMasPopular() {
		const conjuntosDeSabores = #{self.golosinasDeSabor(vainilla), self.golosinasDeSabor(chocolate), self.golosinasDeSabor(frutilla), self.golosinasDeSabor(naranja)}
		
		return conjuntosDeSabores.max({c => c.size()}).asList().first().sabor()
	}
	
	method saborMasPesado() = bolsaDeGolosinas.max({g => g.peso()}).sabor()
	
	method comproYDesecho(golosina) = ultimaGolosinaComprada == golosina && ultimaGolosinaDesechada == golosina
	}
