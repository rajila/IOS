//
//  ViewController.swift
//  alert
//
//  Created by XCode on 30/10/18.
//  Copyright © 2018 XCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var _mensaje: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func _showsheets()
    {
        let _alertW = UIAlertController(title:"Selección", message:"Elija una opción", preferredStyle: .actionSheet)
        
        let _actionOkAlert = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            print("Ok --> \(action)")
            sleep(4)
            print("OkKKK --> \(action)")
        })
        
        let _actioCancelAlert = UIAlertAction(title: "Cancel", style: .destructive, handler: {
            action in
            print("Cancel --> \(action)")
        })
        
        let _actionErrorAlert = UIAlertAction(title: "Error", style: .destructive, handler: {
            action in
            print("Error --> \(action)")
        })
        
        _alertW.addAction(_actionOkAlert)
        _alertW.addAction(_actioCancelAlert)
        _alertW.addAction(_actionErrorAlert)
        
        present(_alertW,animated: true)
    }
    
    @IBAction func _showAlert()
    {
        let _alertW = UIAlertController(title:"Mensaje", message:"Esto es un aviso", preferredStyle: .alert)
        _alertW.addTextField{textFiel -> Void in
            textFiel.textColor = UIColor.red
            textFiel.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
            textFiel.placeholder = "Usuario"
        }
        
        _alertW.addTextField{textFiel -> Void in
            textFiel.textColor = UIColor.blue
            textFiel.isSecureTextEntry = true
            textFiel.placeholder = "Contraseña"
        }
        
        let _actionOkAlert = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            print("Autentificación")
            print(_alertW.textFields![0].text!)
            print(_alertW.textFields![1].text!)
        })
        
        _alertW.addAction(_actionOkAlert)
        present(_alertW,animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Forma 1 de pasar parametros al HIJO
        (segue.destination as! ViewController2)._men = "Mensaje: \(_mensaje.text!)"
        
        // Forma 2 de pasar parametros al HIJO, Crea todas las vistas del proyecto
        /*if segue.destination.view != nil
        {
            let _vista = segue.destination as! ViewController2
            _vista._mensajeHijo.text = "Mensaje: \(_mensaje.text!)"
        }*/
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
