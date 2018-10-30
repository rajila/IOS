//
//  ComplexNumber.swift
//  CalcComplex
//
//  Created by XCode on 23/10/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit

public struct ComplexNumber {
    
    var r : Double
    var i : Double
    
    init(r: Double, i: Double) {
        self.r = r
        self.i = i
    }
    
    init(mod: Double, arg: Double) {
        self.r = mod * cos(arg)
        self.i = mod * sin(arg)
    }
    
    var mod : Double {
        get {
            return sqrt(pow(r, 2) + pow(i, 2))
        }
    }
    
    var arg : Double {
        get {
            return atan2(i, r)
        }
    }
    
}

func +(a : ComplexNumber, b : ComplexNumber) -> ComplexNumber {
    let resultado = ComplexNumber(r: a.r + b.r, i: a.i + b.i)
    return resultado
}

func -(a : ComplexNumber, b : ComplexNumber) -> ComplexNumber {
    let resultado = ComplexNumber(r: a.r - b.r, i: a.i - b.i)
    return resultado
}

func *(a : ComplexNumber, b : ComplexNumber) -> ComplexNumber {
    let resultado = ComplexNumber(r: (a.r * b.r) - (a.i * b.i), i: (a.r * b.i) + (a.i * b.r))
    return resultado
}

func /(a : ComplexNumber, b : ComplexNumber) -> ComplexNumber {
    let mod = a.mod / b.mod
    let arg = a.arg - b.arg
    let resultado = ComplexNumber(mod: mod, arg: arg)
    return resultado
}

