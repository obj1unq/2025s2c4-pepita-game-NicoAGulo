import extras.*
import direcciones.*

object pepita {
	var property position = game.at(0,1) 
	var property energia = 100

	const joules = 9

	const predador= silvestre
	const hogar = nido

	method text()= "Energia \n" + energia
	method textColor()= "20a8ee"

	method image(){
		return "pepita-" + self.estado() + ".png"
	}

	method estado(){
		return if (self.esAtrapada() || !self.puedeMover()){"gris"}
			else if(self.enHogar()){"grande"}
			else {"base"}
	}

	method estaSobre(alguien) = position == alguien.position()

	method esAtrapada()= self.estaSobre(predador)
	method enHogar() = self.estaSobre(hogar)
	
	method puedeMover() = energia>= self.energiaNecesaria(1) && not self.esAtrapada()

	method energiaNecesaria(km){
		return km*joules
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia -= self.energiaNecesaria(kms)
		
	}
	
	method mover(direccion){
		if (self.puedeMover()){
			self.volar(1)
			position=direccion.siguiente(position)
		}else{
			self.perder()
			//Cuando se queda sin energia, no pierde hasta que realice un mov mas
		}
	}

	// method loQueHayAca()=game.uniqueCollider(self)

	// method comerAca(){
	// 	const comida = self.loQueHayAca()
	// 	self.comer(comida)
	// 	comida.andate()
	// }

	method perder() {
		game.say(self, "Perdi!")
		game.schedule(2000, {game.stop()})
	}
}