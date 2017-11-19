//
//  ViewController.swift
//  RadioPlayer
//
//  Created by Benny Davidovitz on 19/11/2017.
//  Copyright © 2017 hackeru. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    enum Station : Int{
        case jerusalem // 0
        case galgalatz // 1
        
        var url : URL{
            switch self {
            case .jerusalem:
                return URL(string: "http://server1.live1.co.il:8004/jrs101fm")!
            case .galgalatz:
                return URL(string: "http://glzwizzlv.bynetcdn.com/glz_mp3")!
            }
        }
        
    }
    
    var station : Station = .jerusalem
    
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    var player : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        volumeSliderAction(volumeSlider)
        //volumeSlider.maximumValueImage = UIImage(named: "my_image")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func refresh(){
        
        guard playPauseButton.isSelected else{
            //pause
            self.player?.pause()
            //release memory of player
            self.player = nil
            
            return
        }
        
        //play...
        
        let url = self.station.url
        
        self.player = AVPlayer(url: url)
        player?.volume = volumeSlider.value
        
        player?.play()
    }
    
    @IBAction func playPauseAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        refresh()
    }
    
    @IBAction func volumeSliderAction(_ sender: UISlider) {
        let str = String(format: "%.0f %%",sender.value * 100)
        volumeLabel.text = str
        
        player?.volume = sender.value
    }
    

    @IBAction func stationChangeAction(_ sender: UISegmentedControl) {
        
        if let s = Station(rawValue: sender.selectedSegmentIndex){
            self.station = s
            refresh()
        } else {
            print("unsupported index \(sender.selectedSegmentIndex)")
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}







