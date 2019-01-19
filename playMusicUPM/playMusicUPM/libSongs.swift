//
//  LibrarySongs.swift
//  playMusicUPM
//
//  Created by Ronald Ajila on 18/01/19.
//  Copyright © 2019 Ronald Ajila. All rights reserved.
//

import UIKit
import MediaPlayer

struct Song {
    
    var _albumTitle: String
    var _artistName: String
    var _songTitle:  String
    
    var _songId   :  NSNumber
}

struct Album {
    
    var _albumTitle: String
    var _songs: [Song]
}

class libSongs: NSObject {

    
    func get(songCategory: String) -> [Album] {
        
        var albums: [Album] = []
        let albumsQuery: MPMediaQuery
        if songCategory == "Artist" {
            albumsQuery = MPMediaQuery.artists()
            
        } else if songCategory == "Album" {
            albumsQuery = MPMediaQuery.albums()
            
        } else {
            albumsQuery = MPMediaQuery.albums()
        }
        
        let albumItems: [MPMediaItemCollection] = albumsQuery.collections! as [MPMediaItemCollection]
        
        for album in albumItems {
            
            let albumItems: [MPMediaItem] = album.items as [MPMediaItem]
            
            var songs: [Song] = []
            
            var albumTitle: String = ""
            
            for song in albumItems {
                if songCategory == "Artist" {
                    albumTitle = song.value( forProperty: MPMediaItemPropertyArtist ) as! String
                    
                } else if songCategory == "Album" {
                    albumTitle = song.value( forProperty: MPMediaItemPropertyAlbumTitle ) as! String
                    
                    
                } else {
                    albumTitle = song.value( forProperty: MPMediaItemPropertyAlbumTitle ) as! String
                }
                
                let songInfo: Song = Song(
                    _albumTitle: song.value( forProperty: MPMediaItemPropertyAlbumTitle ) as! String,
                    _artistName: song.value( forProperty: MPMediaItemPropertyArtist ) as! String,
                    _songTitle:  song.value( forProperty: MPMediaItemPropertyTitle ) as! String,
                    _songId:     song.value( forProperty: MPMediaItemPropertyPersistentID ) as! NSNumber
                )
                songs.append( songInfo )
            }
            
            let albumInfo: Album = Album(
                
                _albumTitle: albumTitle,
                _songs: songs
            )
            
            albums.append( albumInfo )
        }
        
        return albums
        
    }
    
    func getItem( songId: NSNumber ) -> MPMediaItem {
        
        let property: MPMediaPropertyPredicate = MPMediaPropertyPredicate( value: songId, forProperty: MPMediaItemPropertyPersistentID )
        
        let query: MPMediaQuery = MPMediaQuery()
        query.addFilterPredicate( property )
        
        var items: [MPMediaItem] = query.items! as [MPMediaItem]
        
        return items[items.count - 1]
        
    }
}
