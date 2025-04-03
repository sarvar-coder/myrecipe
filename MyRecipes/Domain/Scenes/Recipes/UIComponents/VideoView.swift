//
//  VideoView.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 01/04/25.
//

import Foundation
import UIKit
import AVKit

class VideoView: UIView {
    
    var videoID: String
    
     init(videoID: String, frame: CGRect) {
        self.videoID = videoID
        super.init(frame: frame)
        playVideo()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func playVideo() {
        guard let url = URL(string: videoID) else { return }
        let player = AVPlayer(url: url)
        
        let playerViewController = AVPlayerViewController()
        
        playerViewController.player = player
        
        player.play()
    }
}
