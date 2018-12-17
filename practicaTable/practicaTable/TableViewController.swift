//
//  TableViewController.swift
//  practicaTable
//
//  Created by Ronald Ajila on 28/11/2018.
//  Copyright © 2018 Ronald Ajila. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var _btnItemAdd: UIBarButtonItem!
    @IBOutlet var _btnItemEdit: UIBarButtonItem!
    
    var _dataProvincias = ["Albacete", "Alicante/Alacant", "Almería", "Araba/Álava", "Asturias", "Ávila", "Badajoz", "Balears, Illes", "Barcelona", "Bizkaia", "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón/Castelló", "Ciudad Real", "Córdoba", "Coruña, A", "Cuenca", "Gipuzkoa", "Girona", "Granada", "Guadalajara", "Huelva", "Huesca", "Jaén", "León", "Lleida", "Lugo", "Madrid", "Málaga", "Murcia", "Navarra", "Ourense", "Palencia", "Palmas, Las", "Pontevedra", "Rioja, La", "Salamanca", "Santa Cruz de Tenerife", "Segovia", "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo", "Valencia/València", "Valladolid", "Zamora", "Zaragoza", "Ceuta", "Melilla"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if ((UserDefaults.standard.object(forKey: "_dataProvincias")) != nil)
        {
            _dataProvincias = UserDefaults.standard.object(forKey: "_dataProvincias") as! [String]
        }else {
            UserDefaults.standard.set(_dataProvincias, forKey: "_dataProvincias")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return _dataProvincias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellProvincias", for: indexPath)
        cell.textLabel!.text = _dataProvincias[indexPath.row]
        // Configure the cell...

        return cell
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        /*UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
        if editingStyle == .delete
        {
            _dataProvincias.remove(at: indexPath.row)
            UserDefaults.standard.set(_dataProvincias, forKey: "_dataProvincias")
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let _provincia : String = _dataProvincias.remove(at: fromIndexPath.row)
        _dataProvincias.insert(_provincia, at: to.row)
        UserDefaults.standard.set(_dataProvincias, forKey: "_dataProvincias")
    }
 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let d = segue.destination as! DetailsProvincia
        let pos = tableView.indexPathForSelectedRow?.row
        let provincia = _dataProvincias[pos!]
        d.provincia = provincia
    }
    
    @IBAction func toggleEdit(_ sender: UIBarButtonItem) {
        if isEditing {
            setEditing(false, animated: true)
            sender.title = "Edit"
        }
        else {
            setEditing(true, animated: true)
            sender.title = "Done"
        }
    }
    
    @IBAction func actionAdd(_ sender: Any)
    {
        let _popupAlert = UIAlertController(title: "Add provincia", message: "Ingrese una provincia", preferredStyle: .alert)
        
        _popupAlert.addTextField { textField -> Void in
            textField.placeholder = "Provincia"
        }
        
        let _actionPopupAlert = UIAlertAction(title: "Añadir", style: .default, handler: { action in
            self._dataProvincias.append(_popupAlert.textFields![0].text!)
            let _listProvincias : [String] = self._dataProvincias
            UserDefaults.standard.set(_listProvincias, forKey: "_dataProvincias")
            self.tableView.reloadData()
        })
        
        let _actionCancel = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        
        _popupAlert.addAction(_actionCancel)
        _popupAlert.addAction(_actionPopupAlert)
        self.present(_popupAlert, animated: true)
    }
}
