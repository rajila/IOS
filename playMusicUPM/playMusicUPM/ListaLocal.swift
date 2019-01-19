//
//  ListaLocal.swift
//  playMusicUPM
//
//  Created by Ronald Ajila on 18/01/19.
//  Copyright © 2019 Ronald Ajila. All rights reserved.
//

import UIKit
import AVFoundation

class ListaLocal: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {

    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let fm = FileManager.default
    var allfiles : [String]? = nil
    var songs : [Array<Any>]!
    var songsFiltrado :  [String]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(documentsPath.path);
        allfiles = try! fm.contentsOfDirectory(atPath: documentsPath.path)
        allfiles = allfiles?.filter(){
            $0.contains(".mp3")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allfiles!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSongsLocal", for: indexPath)
        
        // Configure the cell...
        //cell.textLabel?.text = allfiles![indexPath.row]
        
        let soundpathURL = documentsPath.appendingPathComponent(allfiles![indexPath.row])
        let playerItem = AVPlayerItem(url: soundpathURL)
        let metadataList = playerItem.asset.commonMetadata
        var artist:String!
        var title:String!
        
        for item in metadataList {
            if let stringValue = item.value as? String {
                //print(item.commonKey!)
                if item.commonKey!.rawValue == "title" {
                    //print("Title: " + stringValue)
                    title = stringValue
                }
                if item.commonKey!.rawValue == "artist" {
                    //print("Artist: " + stringValue)
                    artist = stringValue
                }
                if item.commonKey!.rawValue == "albumName" {
                    //print("Album: " + stringValue)
                }
            }
        }
        cell.detailTextLabel?.text = artist
        cell.textLabel?.text = title
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let reproductor = segue.destination as! ViewController
        let pos = tableView.indexPathForSelectedRow?.row
        let name = allfiles![pos!]
        
        reproductor.posicion = pos!
        reproductor.allfiles = allfiles
        reproductor.songName = name
    }
}
