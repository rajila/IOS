//: Playground - noun: a place where people can play
// Autor: Ronald Daniel Ajila

import Cocoa

class Complex {
    
    var _valueR = 0.0 // Parte REAL
    var _valueI = 0.0 // Parte IMAGINARIA
    
    // Contructor de Número complejo: Forma Cartesiana
    init (_ _valueR: Double, _ _valueI: Double)
    {
        self._valueR = _valueR
        self._valueI = _valueI
    }
    
    // Contructor de Número complejo: Forma Polar
    init (mod _mod:Double, arg _arg:Double)
    {
        self._valueR = _mod*cos(_arg)
        self._valueI = _mod*sin(_arg)
    }
    
    // Formato de la Tupla: (mod, arg)
    var _polar : (Double, Double)
    {
        get
        {
            return (sqrt(pow(_valueR, 2)+pow(_valueI,2)), atan2(_valueI, _valueR))
        }
    }
    
    var _description: String
    {
        return "Complex(r,i): (\(_valueR),\(_valueI))"
    }
}

// Función de Suma
func + (a: Complex, b: Complex) -> Complex
{
    return Complex(a._valueR+b._valueR, a._valueI+b._valueI)
}

// Función de Resta
func - (a: Complex, b: Complex) -> Complex
{
    return Complex(a._valueR-b._valueR, a._valueI-b._valueI)
}

// Función de Multiplicación
func * (a: Complex, b: Complex) -> Complex
{
    return Complex((a._valueR*b._valueR)-(a._valueI*b._valueI), (a._valueR*b._valueI)+(a._valueI*b._valueR))
}

// Función de División
func / (a: Complex, b: Complex) -> Complex
{
    // Creamos el Número Complejo usando el Contructor de la Forma Polar
    return Complex(mod: (a._polar.0/b._polar.0), arg: (a._polar.1 - b._polar.1))
}

let _suma = Complex(2.0,2.0)+Complex(3.0,3.0)
let _resta = Complex(4.0,4.0)-Complex(2.0,2.0)
let _multiplicacion = Complex(4.0,4.0)*Complex(2.0,2.0)
let _division = Complex(4.0,4.0)/Complex(2.0,2.0)

print(_suma._description)
print(_resta._description)
print(_multiplicacion._description)
print(_division._description)
