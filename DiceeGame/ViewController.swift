//
//  ViewController.swift
//  DiceeGame
//
//  Created by ufuk on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var diceImage1: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    let dice:[String]=["dice1","dice2","dice3","dice4","dice5","dice6"]
    
    var period:Int=0
    var score:Int=0
    
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @objc func changeDices(){
        
        let dice1 = Int.random(in: 0..<6)
        let dice2 = Int.random(in: 0..<6)
        
        diceImage1.image = UIImage(named: dice[dice1])
        diceImage2.image = UIImage(named: dice[dice2])
        
        period += 1
        
        if (period>=10){
            
            if (dice1==dice2){
                score += 1
                scoreLabel.text = "Score:\(score)"
            }
            
            rollButton.isEnabled=true
            timer?.invalidate()
            period=0
        }
        
    }
    
 
    
    @IBAction func rollButtomClicked(_ sender: Any) {
        
        period = 0;
        rollButton.isEnabled=false
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(changeDices), userInfo: nil, repeats: true)
        

        
    }
    
    @IBOutlet weak var rollButton: UIButton!
    
}

