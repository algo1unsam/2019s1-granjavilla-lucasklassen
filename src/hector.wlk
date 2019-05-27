import wollok.game.*
import plantas.*

object hector{
	var property position = game.at(7,5)
	var plantas=[]
	var plantasParaVender=[]
	var monedas=0
	
	method image() = "player.png"	
	method move(nuevaPosicion)=self.position(nuevaPosicion)
	method monedas(){
		monedas+=plantasParaVender.sum{ planta => planta.valor() }
		return monedas
		
	}
	method sacarPlanta(unaPlanta){ plantas.remove(unaPlanta) }
	method agregarPlanta(unaPlanta){ plantas.add(unaPlanta) }
	method agregarPlantaParaVender(unaPlanta){ plantasParaVender.add(unaPlanta) }
	method hayPlanta() = plantas.any{ planta => planta.position() == position }
	method quePlantaHay() = plantas.find{planta => planta.position() ==position}
	method sembrar(planta) {
		if(self.hayPlanta()) self.error("Ya hay una planta!")
		self.agregarPlanta(planta)
		planta.position(position)
		return game.addVisual(planta)
	}		
	method regar() {
		if(!self.hayPlanta()) self.error("No hay nada para regar!")
		self.quePlantaHay().regar()
	}
	method cosechar() {
		if(!self.hayPlanta()) self.error("No hay nada para cosechar!")
		self.quePlantaHay().cosechar()
	}
	
	method vender(){
		self.monedas()
		plantasParaVender=[]
	}
	method decir(){
		game.say(self,monedas)
	}
}
