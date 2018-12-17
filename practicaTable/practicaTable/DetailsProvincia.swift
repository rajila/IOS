//
//  DetailsProvincia.swift
//  practicaTable
//
//  Created by Ronald Ajila on 28/11/2018.
//  Copyright © 2018 Ronald Ajila. All rights reserved.
//

import UIKit

class DetailsProvincia: UIViewController {

    @IBOutlet var lblProvincia: UILabel!
    @IBOutlet var txtDataProvincia: UITextView!
    var provincia : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblProvincia.text = provincia
        txtDataProvincia.text = UserDefaults.standard.string(forKey: provincia)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.setValue(txtDataProvincia.text, forKey: provincia)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
