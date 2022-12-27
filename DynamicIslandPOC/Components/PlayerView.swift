//
//  PlayerView.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 22.11.2022.
//

import Foundation
import SwiftUI
import AVKit

class UIVideoPlayer: UIView {
    
    var playerLayer = AVPlayerLayer()
    
    convenience init(url: URL) {
        self.init(url: url, frame: CGRect.zero)
    }
    
    init(url: URL, frame: CGRect) {
        super.init(frame: frame)
                
        let player = AVPlayer(url: url)
        player.isMuted = true
        player.play()
      
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspectFill.rawValue)
        
        layer.addSublayer(playerLayer)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

struct PlayerView: UIViewRepresentable {

    private var url: URL

    init(url: URL) {
        self.url = url
    }
    
    func makeUIView(context: Context) -> UIVideoPlayer {
        return UIVideoPlayer(url: url)
    }

    func updateUIView(_ uiView: UIVideoPlayer, context: Context) {
        
    }
}
