//
//  ViewController.swift
//  BullsEye
//
//  Created by Александра Леонова on 11.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    var targetValue: Int = 0
    var roundValue: Int = 0 {
        didSet {
            labelRound.text = String(roundValue)
        }
    }
    var scoreValue = 0
    
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelRound: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var labelScore: UILabel!
    
    
    @IBOutlet var startOverButton: UIButton! {
        didSet {
            startOverButton.addTarget(self, action: #selector(didTapStartOverButton), for: .touchUpInside)
        }
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
//        let bullImage = UIImage(named: "ox_9179997.png")
//        slider.setThumbImage(bullImage, for: .highlighted)
//        let bullImageNormal = UIImage(named: "ox_9179966.png")
//        slider.setThumbImage(bullImage, for: .normal)

//        labelRound.text = "Round: \(roundValue)"
        startNewRound()
    }
    
    @IBAction func pushedHitMeButton() {
        let alert = UIAlertController(title: "\(varMessage)", message: "You scored \(calculateScore())\nYou tapped on \(currentValue)", preferredStyle: .alert)
        let answer = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.startNewRound()
        })
        alert.addAction(answer)
        present(alert, animated: true, completion: nil)
        scoreValue +=  calculateScore() + bonusPoints

    }
  
    @IBAction func sliderMoved(_ sender: UISlider) {
        currentValue = Int(sender.value.rounded())
    }
    
    @objc func didTapStartOverButton() {
        roundValue = 0
        scoreValue = 0
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 0...100)
        roundValue += 1
        updateLabels()
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        labelOne.text = "Pull the bull's eye as close as you can to: \(targetValue)"
        labelRound.text = String(roundValue)
        labelScore.text = String(scoreValue)

    }
  
    func calculateScore() -> Int {
        let difference = abs(currentValue - targetValue)
        return 100 - difference
    }
    
    var bonusPoints: Int {
        switch calculateScore() {
        case 100:
            return 100
        case 99:
            return 50
        default:
            return 0
        }
    }
    
    var varMessage: String {
        switch calculateScore() {
        case 100:
            return "GREAT, 100 extra points!"
        case 99:
            return "GREAT, 50 extra points!"
        case 90...98:
            return "GREAT!"
        case 80..<90:
            return "Nice try :)"
        case 70..<80:
            return "Well..."
        default:
            return "Better luck next time"
        }
    }
    
}
    



