import wollok.game.*
import hector.*

class Maiz {
	var property position 
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
			hector.agregarPlantaParaVender(self)
		}
	}
}




class Trigo {
	var property image = "wheat_0.png"
	var property position
	var estado=0
	
	method valor() = (estado-1)*100
	method regar(){
		estado++
		if(estado==0) image="wheat_0.png"
		if(estado==1) image="wheat_1.png"
		if(estado==2) image="wheat_2.png"
		if(estado==3){ 
			image="wheat_3.png"
			estado=-1
			}
		
	}
	method cosechar(){
		if(estado>=2){
			game.removeVisual(self)
			hector.sacarPlanta(self)
			hector.agregarPlantaParaVender(self)
		}
	}
}




class Tomaco {
	
	var property position 
	var property image = "tomaco.png"
	
	method valor() = 80	
	method regar() {
		if(self.position().y()==9) position=game.at(self.position().x(),-1)
		self.position(self.position().up(1))
	}
	method cosechar(){
		game.removeVisual(self)
		hector.sacarPlanta(self)
		hector.agregarPlantaParaVender(self)
	}

}
