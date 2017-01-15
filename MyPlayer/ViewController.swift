//
//  ViewController.swift
//  MyPlayer
//
//  Created by Song Bo on 17/12/2016.
//  Copyright © 2016 Song Bo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let c = MyPlayerController()
        addChildViewController(c)
        view.addSubview(c.view)
        
//        let url: URL = Bundle.main.url(forResource: "sample", withExtension: "mp4")!
//        //create player and player layer
//        let player = AVPlayer(url: url)
//        let playerLayer = AVPlayerLayer(player: player)
//        //set player layer frame and attach it to our view
//        playerLayer.frame = view.bounds
//        view.layer.addSublayer(playerLayer)
//        //play the video
//        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

