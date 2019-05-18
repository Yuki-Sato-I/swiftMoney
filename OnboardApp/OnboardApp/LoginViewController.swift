//
//  LoginViewController.swift
//  OnboardApp
//
//  Created by 佐藤裕紀 on 2019/05/18.
//  Copyright © 2019 Yuki Sato. All rights reserved.
//

import UIKit
import AVFoundation

class LoginViewController: UIViewController {
    
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "start", ofType: "mov")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player.play()
        
        //動画が再生される画面
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.repeatCount = 0
        playerLayer.zPosition = -1
        
        view.layer.insertSublayer(playerLayer, at: 0)
        
        //無限ループ　終わったらまた0を探して再生
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main){ (notification) in
            self.player.seek(to: .zero)
            self.player.play()
        }

    }

}
