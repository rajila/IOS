//
//  ViewController.swift
//  CalcComplex
//
//  Created by XCode on 23/10/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var _numRealOne: UITextField!
    @IBOutlet var _numImagOne: UITextField!
    
    @IBOutlet var _numRealTwo: UITextField!
    @IBOutlet var _numImagTwo: UITextField!
    
    @IBOutlet var _resultR: UITextField!
    @IBOutlet var _resultI: UITextField!
    
    @IBOutlet var _operators: UISegmentedControl!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func operacion()
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        
        let _complexOne = Complex( _numROne!, _numIOne!)
        let _complexTwo = Complex( _numRTwo!, _numITwo!)
        
        var _resultado:Complex
        
        switch _operators.selectedSegmentIndex
        {
            case 0: // Suma
                _resultado = _complexOne + _complexTwo
                _resultR.text = "\(_resultado._valueR)"
                _resultI.text = "\(_resultado._valueI)"
                alert(_resultado)
            case 1: // Resta
                _resultado = _complexOne - _complexTwo
                _resultR.text = "\(_resultado._valueR)"
                _resultI.text = "\(_resultado._valueI)"
                alert(_resultado)
            case 2: // Multiplicación
                _resultado = _complexOne * _complexTwo
                _resultR.text = "\(_resultado._valueR)"
                _resultI.text = "\(_resultado._valueI)"
                alert(_resultado)
            case 3: // División
                _resultado = _complexOne / _complexTwo
                _resultR.text = "\(_resultado._valueR)"
                _resultI.text = "\(_resultado._valueI)"
                alert(_resultado)
            default:
                break;
        }
    }
    
    // Función que muestra el resultado de la operación en forma POLAR
    func alert(_ complex : Complex)
    {
        let alert = UIAlertController(title: "Forma polar", message: "mod = \(complex._polar.0) arg = \(complex._polar.1)", preferredStyle: UIAlertController.Style.alert)
        let cancel = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    
    // Mostrar forma Polar del número complejo ONE
    @IBAction func convertToPolar()
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _complex = Complex( _numROne!, _numIOne!)
        alert(_complex)
    }
    
    // Mostrar forma Polar del número complejo TWO
    @IBAction func convertCardinalToPolarTwo()
    {
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        let _complex = Complex( _numRTwo!, _numITwo!)
        alert(_complex)
    }

    @IBAction func swipeRightSumar(_ sender: Any)
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        let _complexOne = Complex( _numROne!, _numIOne!)
        let _complexTwo = Complex( _numRTwo!, _numITwo!)
        let _resultado = _complexOne + _complexTwo
        
        _resultR.text = "\(_resultado._valueR)"
        _resultI.text = "\(_resultado._valueI)"
        alert(_resultado)
    }
    
    @IBAction func swipeLeftRestar(_ sender: Any)
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        let _complexOne = Complex( _numROne!, _numIOne!)
        let _complexTwo = Complex( _numRTwo!, _numITwo!)
        
        let _resultado = _complexOne - _complexTwo
        
        _resultR.text = "\(_resultado._valueR)"
        _resultI.text = "\(_resultado._valueI)"
        alert(_resultado)
    }
    
    @IBAction func swipeUpMult(_ sender: Any)
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        let _complexOne = Complex( _numROne!, _numIOne!)
        let _complexTwo = Complex( _numRTwo!, _numITwo!)
        
        let _resultado = _complexOne * _complexTwo
        
        _resultR.text = "\(_resultado._valueR)"
        _resultI.text = "\(_resultado._valueI)"
        alert(_resultado)
    }
    
    @IBAction func swipeDownDiv(_ sender: Any)
    {
        let _numROne = Double(_numRealOne.text!)
        let _numIOne = Double(_numImagOne.text!)
        let _numRTwo = Double(_numRealTwo.text!)
        let _numITwo = Double(_numImagTwo.text!)
        let _complexOne = Complex( _numROne!, _numIOne!)
        let _complexTwo = Complex( _numRTwo!, _numITwo!)
        
        let _resultado = _complexOne / _complexTwo
        
        _resultR.text = "\(_resultado._valueR)"
        _resultI.text = "\(_resultado._valueI)"
        alert(_resultado)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
