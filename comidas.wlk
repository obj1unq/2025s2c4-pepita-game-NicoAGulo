import wollok.game.*

object manzana {
  const property position = game.center()
  var property bocadosRestantes = 2
  var madurez = 1
  const base= 100

  
	method image(){
		return "manzana-" + self.estado() + ".png"
	}

  	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

  	method estado(){
    	return if (self.bocadosRestantes() == 2){"base"}
			else if(self.bocadosRestantes() == 1){"mordida"}
			else {"terminada"}
 	}

  	method comer(){
    	bocadosRestantes-=1
  	}

  	method energiaQueOtorga() {
		return base * madurez	
	}

	method redibujarse(){
	  game.removeVisual(self)
	  game.addVisual(self)
	}

	method andate(){
		if (bocadosRestantes==0){
			game.removeVisual(self)
		}
	}
}

object alpiste {

	method energiaQueOtorga() {
		return 20
	} 

}

