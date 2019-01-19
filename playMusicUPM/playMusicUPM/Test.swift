//
//  Test.swift
//  Reproductor
//
//  Created by Eric Guzman on 11/30/17.
//  Copyright © 2017 Eric Guzman. All rights reserved.
//

import UIKit
import MediaPlayer

class Test: UIViewController, MPMediaPickerControllerDelegate {
    
    var song : String!
    var album : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Instantiate a new music player
        print(album)
        let myMediaPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
        //let query = MPMediaQuery.songs()
        let songNameFilter = MPMediaPropertyPredicate(value: song, forProperty: MPMediaItemPropertyTitle, comparisonType: MPMediaPredicateComparison.contains)
        
        /*let albumSongFilter = MPMediaPropertyPredicate(value: album, forProperty: MPMediaItemPropertyAlbumTitle, comparisonType: MPMediaPredicateComparison.equalTo)*/
        
        let myFilterSet: Set<MPMediaPropertyPredicate> = [songNameFilter/*, albumSongFilter*/]
        
        let query = MPMediaQuery(filterPredicates: myFilterSet)
        //query.addFilterPredicate(mm)
        
        // Add a playback queue containing all songs on the device
        //myMediaPlayer.setQueue(with: song!)
        //myMediaPlayer.setQueue(with: MPMediaQuery.songs())
        myMediaPlayer.setQueue(with: query)
        // Start playing from the beginning of the queue
        
        myMediaPlayer.play()
        
        /*let mediaPicker = MPMediaPickerController(mediaTypes: .music)
        mediaPicker.delegate = self
        present(mediaPicker, animated: true, completion: {})*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mediaPicker(mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        //User selected a/an item(s).
        for mpMediaItem in mediaItemCollection.items {
            print("Add \(mpMediaItem) to a playlist, prep the player, etc.")
        }
    }
    
    func mediaPickerDidCancel(mediaPicker: MPMediaPickerController) {
        print("User selected Cancel tell me what to do")
    } 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
