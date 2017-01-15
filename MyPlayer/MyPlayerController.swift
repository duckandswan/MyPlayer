//
//  MyPlayerController.swift
//  MyPlayer
//
//  Created by Song Bo on 15/01/2017.
//  Copyright © 2017 Song Bo. All rights reserved.
//

import UIKit
import AVFoundation

class MyPlayerController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame.size.height = UIScreen.main.bounds.height / 2
        view.frame.size.width = UIScreen.main.bounds.width
        view.backgroundColor = UIColor.green
        addPlayer()
    }
    
    func addPlayer(){
        let url: URL = Bundle.main.url(forResource: "sample", withExtension: "mp4")!
        //create player and player layer
        let player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        //set player layer frame and attach it to our view
        playerLayer.frame = view.bounds
        view.layer.addSublayer(playerLayer)
        //play the video
        player.play()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
