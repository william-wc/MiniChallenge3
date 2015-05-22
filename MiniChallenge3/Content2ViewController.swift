//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content2ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifier = "cell"
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /*
    DataSource / Delegate
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as! Content2Cell
        var embedURL = "<iframe width=\"160\" height=\"90\" src=\"https://www.youtube.com/embed/mQSVKCmeAQE?list=PLf1lowbdbFIAURvpD8Qy8PqwrMjwx0N64\" frameborder=\"0\" allowfullscreen></iframe>"
        cell.webVideo.loadHTMLString(embedURL, baseURL: nil)
        cell.topics.text = "Derivadas"
        return cell
    }

    
//    func vide(){
//        var videoView = UIWebView(frame: self.view.bounds)
//        var videoURL = NSURL(fileURLWithPath:"www.youtube.com/watch?v=MyF7alu35FQ")
//        
//        var youtubeVideoHTML = "<!DOCTYPE html><html><head><style>body{margin:0px 0px 0px 0px; background:#1111}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = \"http://www.youtube.com/player_api\"; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'0.0', height:'0.0', videoId:'\(videoURL)', events: { 'onReady': onPlayerReady, 'onStateChange': onPlayerStateChange } });} function onPlayerReady(event) { event.target.playVideo(); } function onPlayerStateChange(event) {if(event.data === 0) {   event.target.destroy(); }}  </script> </body> </html>"
//        
//        videoView.scalesPageToFit = false
//        videoView.mediaPlaybackRequiresUserAction = false
//        videoView.opaque = false
//        
//        videoView.loadHTMLString(youtubeVideoHTML, baseURL: videoURL)
//        
//        view .addSubview(videoView)
//        
//        
//    }
    
}
