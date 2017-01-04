//
//  TextToSpeech.swift
//  DGSayMyName
//
//  Created by Dameon Green on 1/3/17.
//  Copyright © 2017 ApptasticVoyage. All rights reserved.
//

import UIKit
import AVFoundation

class TextToSpeech: NSObject {
    
    class func SayText(input : String) {
        let synth : AVSpeechSynthesizer = AVSpeechSynthesizer()
        let utterance : AVSpeechUtterance = AVSpeechUtterance(string: input)
        utterance.rate = (AVSpeechUtteranceMinimumSpeechRate) * 0.25
        utterance.volume = 1
        utterance.pitchMultiplier = 1
        synth.speak(utterance)
    }

}
