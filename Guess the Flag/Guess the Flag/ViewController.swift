//
//  ViewController.swift
//  Guess the Flag
//
//  Created by Alex Paramonov on 17.02.22.
//

import UIKit

class ViewController: UIViewController {
     
     @IBOutlet weak var buttonOne: UIButton!
     @IBOutlet weak var buttonTwo: UIButton!
     @IBOutlet weak var buttonThree: UIButton!
     
     var countries: [String] = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
     var score =  0
     var correctAnswer = 0
     var scoreAnswer = 0
     var titleGameTheEnd = "Game over"
     
     override func viewDidLoad() {
          super.viewDidLoad()
          
          setOptionsButton()
          askQuestion()
     }
     
     private func askQuestion(action: UIAlertAction! = nil ) {
          countries.shuffle()
          
          buttonOne.setImage(UIImage(named: countries[0]), for: .normal)
          buttonTwo.setImage(UIImage(named: countries[1]), for: .normal)
          buttonThree.setImage(UIImage(named: countries[2]), for: .normal)
          
          correctAnswer = Int.random(in: 0...2)
          
          title = "\(countries[correctAnswer].uppercased())  Your score:\(score)"
     }
     
     private func setOptionsButton() {
          buttonOne.layer.borderWidth = 1
          buttonTwo.layer.borderWidth = 1
          buttonThree.layer.borderWidth = 1
          
          buttonOne.setTitle("", for: .normal)
          buttonTwo.setTitle("", for: .normal)
          buttonThree.setTitle("", for: .normal)
          
          buttonOne.layer.borderColor = UIColor.lightGray.cgColor
          buttonTwo.layer.borderColor = UIColor.lightGray.cgColor
          buttonThree.layer.borderColor = UIColor.lightGray.cgColor
     }
     
     @IBAction func buttonTapped(_ sender: UIButton) {
          var title: String
          
          scoreAnswer += 1
          if sender.tag == correctAnswer {
               title = "Correct"
               score += 1
          } else {
               title = "Wrong"
               score -= 1
          }
          
          if scoreAnswer == 10 {
               let alertController = UIAlertController(title: titleGameTheEnd, message: "You answered ten questions Your score \(score).", preferredStyle: .alert)
               alertController.addAction(UIAlertAction(title: "New Game", style: .default, handler: { UIAlertAction in
                    self.score = 0
                    self.scoreAnswer = 0
                    self.askQuestion()
                    
               }))
               present(alertController, animated: true)
               
          } else {
               
               if title == "Wrong" {
                    let alertController = UIAlertController(title: "Incorrect! It's a flag - \(countries[sender.tag].uppercased())", message: "Your score \(score).", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                    present(alertController, animated: true)
               } else {
                    let alertController = UIAlertController(title: title, message: "Your score \(score).", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                    present(alertController, animated: true)
                    
               }
          }
     }
}
