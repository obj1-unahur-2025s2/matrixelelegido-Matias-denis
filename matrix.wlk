import bolichito.bolichito-Matias-denis.objetos.*
object neo {
    var energia = 100
    method energia() = energia
    method esElElegido() = true
    method saltar() { energia = energia / 2 }
    method vitalidad() = energia.div(10)
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)
}

object morfeo {
    var vitalidadActual = 8
    var estaCansado = false

    method estaCansado() = estaCansado

    method saltar() {
        estaCansado = !estaCansado
        vitalidadActual -= 1
    }
    method esElElegido() = false
    method vitalidad() = vitalidadActual.max(0)
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)    
}

object trinity {
    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false
    method subirALaNave() = nave.pasajeros().add(self)
    method bajarDeLaNave() = nave.pasajeros().remove(self)
    
}


object nave {
    const pasajeros = []
    method pasajeros() = pasajeros
    method cantidadDePasajeros() = self.pasajeros().size()
    method pasajeroDeMayorVitalidad() = self.pasajeros().max({p => p.vitalidad()})
    method vitalidades() = self.pasajeros().map({p => p.vitalidad()})
    method estaEquilibradaEnVitalidad() = self.vitalidades().max() <= self.vitalidades().min() * 2
    method elElegidoEstaEnLaNave() = self.pasajeros().any({p => p.esElElegido()})

    method chocar() {
        self.pasajeros().forEach({p => p.saltar()})
        self.pasajeros().clear()

    }

    method acelerar() {
        self.pasajeros().filter({p => !p.esElElegido()}).forEach({p => p.saltar()})
    } 
}

