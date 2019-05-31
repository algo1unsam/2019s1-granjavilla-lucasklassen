class Mercado{
	const position
	var monedas=0
	var plantasMercado = []
	
	method image() = "market.png"
	method monedas() = monedas
	method agregarPlantas(plantas) { plantasMercado.add(plantas) } 
	method esPlanta() = false
	method pagar(cantidad) { monedas-=cantidad }
	
}

