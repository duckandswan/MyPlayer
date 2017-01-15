//
//  MyPlayerController.swift
//  MyPlayer
//
//  Created by Song Bo on 15/01/2017.
//  Copyright © 2017 Song Bo. All rights reserved.
//

import UIKit
import AVFoundation

class MyPlayerController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    @IBOutlet weak var playerView: UIView!
    var player:AVPlayer!
    @IBOutlet weak var subtitleTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame.size.height = UIScreen.main.bounds.height
        view.frame.size.width = UIScreen.main.bounds.width
        view.backgroundColor = UIColor.green
        
        subtitleTableView.register(UINib(nibName: "SubtitleCell", bundle: nil), forCellReuseIdentifier: "subtitle")
        subtitleTableView.rowHeight = UITableViewAutomaticDimension
        subtitleTableView.estimatedRowHeight = 100
    }
    
    func addPlayer(){
//        let url: URL = Bundle.main.url(forResource: "sample", withExtension: "mp4")!
        
        let url: URL = Bundle.main.url(forResource: "冰血暴.Fargo.S02E01.中英字幕.WEB-HR.AAC.1024X576.x264", withExtension: "mp4")!
        player = AVPlayer(url: url)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = playerView.bounds
        playerView.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func addSubtitle(){
        let url: URL = Bundle.main.url(forResource: "冰血暴.Fargo.S02E01.中英字幕.WEB-HR.AAC.1024X576.x264", withExtension: "srt")!

        let str = try! String(contentsOf: url, encoding: .utf8)
//        for c in str.characters {
//            if c == "\n"{
//                print("空格")
//            }
//            print(c)
//        }
//        print(str)
        parseString(str: str)
    }
    var strs:[String] = []
    func parseString(str:String){
        let regex = try! NSRegularExpression(pattern: "^\\s+" , options: [.anchorsMatchLines])
        let stop = "SomeStringThatYouDoNotExpectToOccurInSelf"
        let range = NSRange(0..<str.utf16.count)
        let modifiedString = regex.stringByReplacingMatches(in: str, options: [], range: range, withTemplate: stop)
        strs = modifiedString.components(separatedBy: stop)
        print(modifiedString)
//        print(strs)
//        for s in strs{
//            print(s)
//            print("SomeStringThatYouDoNotExpectToOccurInSelf")
//        }

    }
    
    @IBAction func tapPLayerView(_ sender: UITapGestureRecognizer) {
        print("tap")
        if player.rate != 0 {
            player.pause()
        }else{
            player.play()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subtitle", for: indexPath) as! SubtitleCell
        cell.l.text = strs[indexPath.row]
        return cell
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        addPlayer()
        addSubtitle()
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
