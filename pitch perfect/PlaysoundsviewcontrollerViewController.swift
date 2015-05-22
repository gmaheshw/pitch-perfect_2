//
//  PlaysoundsviewcontrollerViewController.swift
//  pitch perfect
//
//  Created by Gautam Maheshwari on 13/05/15.
//  Copyright (c) 2015 Gautam Maheshwari. All rights reserved.
//

import UIKit
import AVFoundation


class PlaysoundsviewcontrollerViewController: UIViewController{
    
    var audioPlayer:AVAudioPlayer!
    var audioEngine:AVAudioEngine!
    var receivedAudio: RecordedAudio!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate=true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    @IBAction func slowSpeed(sender: UIButton) {
        playAudioWithVariableSpeed(0.5)
    }
        
    @IBAction func fastSpeed(sender: UIButton) {
        playAudioWithVariableSpeed(2.0)
    }
    
    func playAudioWithVariableSpeed(speed: Float){
        stopAllAudio()
        audioPlayer.rate = speed
        audioPlayer.play()
    }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        stopAllAudio()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
        
    }
    
    @IBAction func stopaudio(sender: UIButton) {
        stopAllAudio()
    }
    
    func stopAllAudio(){
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        audioEngine.stop()
        audioEngine.reset()
    }
    
}
