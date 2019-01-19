//
//  ViewController.swift
//  playMusicUPM
//
//  Created by Ronald Ajila on 18/01/19.
//  Copyright © 2019 Ronald Ajila. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var songID : Int!
    var songName:String = ""
    var player = AVAudioPlayer()
    var i:Int=0
    var allfiles : [String]? = nil
    var posicion : Int = 0
    var trackName:String!
    var trackArtist:String!
    var progressLabel: UILabel?
    var pause : Bool = false
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
    @IBOutlet weak var songProgress: UIProgressView!
    
    @IBOutlet weak var lblIni: UILabel!
    @IBOutlet weak var lblFin: UILabel!
    @IBOutlet weak var lblLyrics: UITextView!
    @IBOutlet weak var imgAlbum: UIImageView!
    
    @IBAction func btnPlay(_ sender: Any) {
        playSong()
    }
    @IBAction func btnNext(_ sender: Any) {
        nextSong()
    }
    @IBAction func btnBack(_ sender: Any) {
        prevSong()
    }
    @IBAction func btnPause(_ sender: Any) {
        pausaSong()
    }
    @IBAction func btnStop(_ sender: Any) {
        stopSong()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgAlbum.isHidden = false
        lblLyrics.isHidden = false
        lblLyrics.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        
        let soundpathURL = documentsPath.appendingPathComponent(songName)
        
        do
        {
            player = try AVAudioPlayer(contentsOf: soundpathURL)
            player.delegate = self
            player.prepareToPlay()
            //player.volume = 20
            player.play()
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateAudioProgressView), userInfo: nil, repeats: true)
            songProgress.setProgress(Float(player.currentTime/player.duration), animated: false)

        }
        catch
        {
            print("An error occurred while trying to extract audio file")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        player.stop()
        dismiss(animated: true, completion: nil)
    }
    
    func playSong(){
        
        if !player.isPlaying{
            player.play()
        }
    }
    func stopSong() {
        player.stop()
        player.currentTime = 0
        songProgress.progress = 0.0
        //player.volume = 20
    }
    
    func nextSong() {
        posicion += 1
        
        if posicion >= (allfiles?.count)! {
            posicion = 0
            let soundname = allfiles![posicion] // reproduce el primero
            let soundpathURL = documentsPath.appendingPathComponent(soundname)
            player = try! AVAudioPlayer(contentsOf: soundpathURL)
            stopSong()
            player.prepareToPlay()
            //volumeSong()
            player.play()
        } else {
        
            if posicion < (allfiles?.count)! {
                let soundname = allfiles![posicion] // reproduce el primero
                let soundpathURL = documentsPath.appendingPathComponent(soundname)
                player = try! AVAudioPlayer(contentsOf: soundpathURL)
                stopSong()
                player.prepareToPlay()
                //volumeSong()
                player.play()
            }
        }
        
        player.delegate = self
        
    }
    
    func prevSong() {
        posicion -= 1
        
        if posicion < 0 {
            posicion = (allfiles?.count)!-1
            let soundname = allfiles![posicion]
            let soundpathURL = documentsPath.appendingPathComponent(soundname)
            player = try! AVAudioPlayer(contentsOf: soundpathURL)
            stopSong()
            player.prepareToPlay()
            //volumeSong()
            player.play()
        } else {
        
            if posicion < (allfiles?.count)! {
                let soundname = allfiles![posicion]
                let soundpathURL = documentsPath.appendingPathComponent(soundname)
                player = try! AVAudioPlayer(contentsOf: soundpathURL)
                stopSong()
                player.prepareToPlay()
                //volumeSong()
                player.play()
            }
        }
        
        player.delegate = self
    }
    
    func pausaSong() {
        player.pause()
        //player.volume = 20
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully: Bool) {
        nextSong()
    }
    
    @objc func updateAudioProgressView()
    {
        if player.isPlaying
        {
            songProgress.setProgress(Float(player.currentTime/player.duration), animated: true)
            lblIni.text = timeString(time: TimeInterval(player.currentTime))
            lblFin.text = timeString(time: TimeInterval(player.duration)-TimeInterval(player.currentTime))
        }
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
   
}

