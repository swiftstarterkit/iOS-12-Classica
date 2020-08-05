//
//  ClassicaModel.swift
//  Classica
//
//  Created by Pao Yu on 2020-08-05.
//

import SwiftUI
import AVFoundation

class ClassicaModel: ObservableObject {
    
    var audioPlayer: AVAudioPlayer?
    
    func loadMusic(fileName: String, fileType: String) {
        
        if let filePath = Bundle.main.path(forResource: fileName, ofType: fileType) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: filePath))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func playMusic() {
        audioPlayer?.play()
        audioPlayer?.numberOfLoops = 0
    }
    
    func loadAndPlay(song: String, fileType: String) {
        self.loadMusic(fileName: song, fileType: fileType)
        self.playMusic()
    }
    
    func pauseMusic() {
        audioPlayer?.pause()
    }
    
    func stopMusic() {
        audioPlayer?.stop()
        audioPlayer = nil
    }
    
}
