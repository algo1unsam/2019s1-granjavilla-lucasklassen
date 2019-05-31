import wollok.game.*
import plantas.*
import mercado.*

object hector{
	var property position = game.at(7,5)
	var plantasParaVender=[]
	var monedas=0 
	
	method image() = "player.png"	
	method move(nuevaPosicion) = self.position(nuevaPosicion)
	method sacarPlanta(unaPlanta){ plantasParaVender.remove(unaPlanta) }
	method agregarPlanta(unaPlanta){ plantasParaVender.add(unaPlanta) }
	method hayAlgo() = not (game.colliders(self).isEmpty()) 
	method esPlanta() = game.colliders(self).first().esPlanta()
	method queHay() = game.colliders(self).first()
	
	
	method sembrar(planta) {
		if(self.hayAlgo() ) self.error("No se puede sembrar!")
		self.agregarPlanta(planta)
		planta.position(position)
		return game.addVisual(planta)
	}		
	method regar() {
		if(!self.hayAlgo() or !self.esPlanta()) self.error("No hay nada para regar!")
		self.queHay().regar()
	}
	method cosechar() {
		if(!self.hayAlgo() or !self.esPlanta()) self.error("No hay nada para cosechar!")
		self.queHay().cosechar()
	}

	method monedas() = monedas
	method monedasVenta()= plantasParaVender.sum{ planta => planta.valor() }
	method mercadoNoTieneMonedas()= game.colliders(self).first().monedas() < self.monedasVenta()
	method cobrar(){ 
		monedas+=self.monedasVenta()
		self.queHay().pagar(self.monedasVenta())
	}
	method vender(){
		if(!self.hayAlgo() or self.esPlanta()) self.error("Aca no podes vender")
		if(self.mercadoNoTieneMonedas()) self.error("El mercado no tiene suficientes monedas")
		self.cobrar()
		plantasParaVender=[]
	}
	method cantidadPlantasVenta() = plantasParaVender.size()
	method monedasYCantidadSay(){
		game.say(self,"Tengo  " + monedas + " monedas y "+
		+ self.cantidadPlantasVenta()+" plantas")
	}
}
