

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player: AVAudioPlayer?
    
    let eggTimes = ["Soft":300,"Medium":480,"Hard":720]
    var count = 0
    var totalTime = 0
    var timePasses = 0
    var timer = Timer()
    var prog :Float = 0.0
    
      
      
    
    @IBAction func hardness(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        count = eggTimes[hardness]!
        bar.progress = 0.0
        timePasses = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(UIMenuController.update), userInfo: nil, repeats: true)
    
    
    }
    
    @IBOutlet weak var bar: UIProgressView!
    
    @IBOutlet weak var Label: UILabel!
    
          @objc func update() {
            
               if(count > 0) {
               
                
        Label.text = String("\(count) seconds remaining")
               bar.progress = Float(timePasses) / Float(totalTime);
                              
                count-=1
                timePasses+=1
                
                
    }
            else{
                                     Label.text = String("Congratulation, Enjoy your eggs")
                                          bar.progress = Float(timePasses) / Float(totalTime);
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                player = try! AVAudioPlayer(contentsOf: url!)
                player?.play()
            }
   
   
    }
   

       override func viewDidLoad() {
           super.viewDidLoad()
        
    }

}
