import wollok.game.*
import hector.*

class Planta{
	var property position
	method esPlanta() = true
}

class Maiz inherits Planta {
	var property image = "corn_baby.png"
	var esAdulta=false
	
	method valor() = 150
	method regar(){
		if(!esAdulta) {
			image = "corn_adult.png"
			esAdulta=true
		}
	}
	method cosechar(){
		if(esAdulta){
			game.removeVisual(self)
			hector.sacarPlanta(self)
			hector.agregarPlanta(self)
		}
	}
}




class Trigo inherits Planta{
	var property image = "wheat_0.png"
	var estado=0
	
	method valor() = (estado-1)*100
	method regar(){
		estado++
		if(estado==0) image="wheat_0.png"
		if(estado==1) image="wheat_1.png"
		if(estado==2) image="wheat_2.png"
		if(estado==3) image="wheat_3.png"
		if(estado==4) {
			estado=0
			image="wheat_0.png"
			}
		
	}
	method cosechar(){
		if(estado>=2){
			game.removeVisual(self)
			hector.sacarPlanta(self)
			hector.agregarPlanta(self)
		}
	}
}




class Tomaco inherits Planta{
	var property image = "tomaco.png"
	
	method valor() = 80	
	method regar() {
		if(self.position().y()==9) position=game.at(self.position().x(),-1)
		if(self.hayAlgoArriba()) self.error("No se puede regar")
		self.position(self.position().up(1))
	}
	method posicionArriba() = game.at(self.position().x(),(self.position().y()) +1)
	method hayAlgoArriba()= not self.posicionArriba().allElements().isEmpty()
		
	
	method cosechar(){
		game.removeVisual(self)
		hector.sacarPlanta(self)
		hector.agregarPlanta(self)
	}

}
