//
//  LaunchViewController.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 15/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import UIKit
import AVFoundation

class LaunchViewController: UIViewController {

    @IBOutlet weak var animation: LauncView!
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic(filename: "introMusic.mp3")
        animation.addUntitledAnimation()
    }
  
  override func viewWillDisappear(_ animated: Bool) {
    backgroundMusicPlayer.stop()
  }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  var backgroundMusicPlayer: AVAudioPlayer!
  func playBackgroundMusic(filename: String) {
    let resourceUrl = Bundle.main.url(forResource: filename, withExtension: nil)
    guard let url = resourceUrl else {
      print("Could not find file: \(filename)")
      return
    }
    do {
      try backgroundMusicPlayer = AVAudioPlayer(contentsOf: url)
      backgroundMusicPlayer.numberOfLoops = 0
      backgroundMusicPlayer.prepareToPlay()
      backgroundMusicPlayer.play()
    } catch {
      print("Could not create audio player!")
      return
    }
  }
}
