//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Jim Madden on 8/14/23.
//

import AVFoundation
import UIKit

class PlaySoundsViewController: UIViewController {
  @IBOutlet var snailButton: UIButton!
  @IBOutlet var chipmunkButton: UIButton!
  @IBOutlet var rabbitButton: UIButton!
  @IBOutlet var vaderButton: UIButton!
  @IBOutlet var echoButton: UIButton!
  @IBOutlet var reverbButton: UIButton!
  @IBOutlet var stopButton: UIButton!

  var recordedAudioURL: URL!
  var audioFile: AVAudioFile!
  var audioEngine: AVAudioEngine!
  var audioPlayerNode: AVAudioPlayerNode!
  var stopTimer: Timer!

  enum ButtonType: Int {
    case slow = 0, fast, chipmunk, vader, echo, reverb
  }

  @IBAction func playSoundForButton(_ sender: UIButton) {
    print("Play Sound Button Pressed")
    switch ButtonType(rawValue: sender.tag)! {
      case .slow:
        playSound(rate: 0.5)
      case .fast:
        playSound(rate: 1.5)
      case .chipmunk:
        playSound(pitch: 1000)
      case .vader:
        playSound(pitch: -1000)
      case .echo:
        playSound(echo: true)
      case .reverb:
        playSound(reverb: true)
    }

    configureUI(.playing)
  }

  @IBAction func stopButtonPressed(_ sender: AnyObject) {
    stopAudio()
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupAudio()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configureUI(.notPlaying)
  }
}
