//
//  ViewController.swift
//  metronomSetudy
//
//  Created by Admin on 15.02.2021.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController {

    private var timer = Timer()
    private var countDownTimer = 2.5 { didSet { countDownTimer = min(10,max(1,countDownTimer))}}
    
    private lazy var player: AVAudioPlayer? = {
        guard let url = Bundle.main.url(forResource: "H", withExtension: "WAV"),
        let player = try? AVAudioPlayer(contentsOf: url)
        else {
        assertionFailure("Failed to setup player")
        return nil
      }
      return player
    }()
    
    @IBOutlet weak var shootLabel: UILabel!
    
    @IBOutlet weak var labelText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = String("\(countDownTimer)")
    }

    @IBAction func startPressButton(_ sender: Any) {
        print("Start")
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: countDownTimer, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
        print(timeFunc())
    }
    @IBAction func stopButtonPressed(_ sender: Any) {
        print("Stop")
        timer.invalidate()
    }
    @IBAction func increaseTimer(_ sender: Any) {
      
        print("+++++")
        countDownTimer += 0.1
        labelText.text = String(countDownTimer)
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: countDownTimer, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
    }
    @IBAction func decreaseTimer(_ sender: Any) {
      
        print("-----")
        countDownTimer -= 0.1
        labelText.text = String(countDownTimer)
        timer.invalidate()
       timer = Timer.scheduledTimer(timeInterval: countDownTimer, target: self, selector: #selector(timeFunc), userInfo: nil, repeats: true)
    }
    
    @objc private func timeFunc() {
        labelText.text = String(countDownTimer)
        print(labelText.text!)
        player?.play()
        
    }

}

