//
//  ViewController.swift
//  Localizations
//
//  Created by Benny Davidovitz on 05/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var player : AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let str = Bundle.main.localizedString(forKey: "welcome_vc_label", value: "welcome_vc_label", table: nil)
        label.text = "welcome_vc_label".localized

        let buttonStr = Bundle.main.localizedString(forKey: "welcome_vc_button", value: "welcome_vc_button", table: nil)
        button.setTitle(buttonStr, for: .normal)
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        
        guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else{
            print("file sound.mp3 not found")
            return
        }
        
        self.player = try? AVAudioPlayer(contentsOf: url)
        player?.play()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}













