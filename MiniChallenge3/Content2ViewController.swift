//
//  Content3ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class Content2ViewController: BaseUIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let CellIdentifier = "cell"
    let anim_delay = 0.5
    let anim_cell_delay = 0.10
    
    @IBOutlet weak var tableView: UITableView!
    
    var data:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tableViewWillHideCells()
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
        var embedURL = "<iframe width=\"\(cell.webVideo.frame.width)\" height=\"\(cell.webVideo.frame.height)\" src=\"https://www.youtube.com/embed/mQSVKCmeAQE?list=PLf1lowbdbFIAURvpD8Qy8PqwrMjwx0N64\" frameborder=\"0\" allowfullscreen></iframe>"
        cell.webVideo.scrollView.scrollEnabled = false
        cell.webVideo.scrollView.bounces = false
        cell.webVideo.loadHTMLString(embedURL, baseURL: nil)
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        let delay = didAppear ? 0 : anim_delay + anim_cell_delay * Double(indexPath.row)
        (cell as! BaseAnimatableCell).animateIn(delay, indexPath: indexPath)
    }
    
    func tableViewWillHideCells() {
        let paths = tableView.indexPathsForVisibleRows() as! [NSIndexPath]
        if paths.count > 0 {
            for i:Int in 0...paths.count-1 {
                var path = paths[i]
                var cell = tableView.cellForRowAtIndexPath(path) as! BaseAnimatableCell
                var delay = anim_cell_delay * Double(Int(i / 2))
                cell.animateOut(delay, indexPath: path)
            }
        }
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
