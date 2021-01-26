//
//  PlayViewController.swift
//  Catch_Flowers_game
//
//  Created by SAM on 01/06/2019.
//  Copyright © 2019 SAM. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    @IBOutlet var timelbl: UILabel!
    @IBOutlet var scorelbl: UILabel!
    @IBOutlet var basket: UIImageView!
    var score: Int = 0
    var timer1: Timer!
    var seconds: Int = 30
   
    override func viewWillAppear(_ animated: Bool) {
        
        
        self.basket.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(PlayViewController.move(_:))))
        self.view.addSubview(basket)
        self.view.addSubview(scorelbl)
        self.view.addSubview(timelbl)

        
        Timer.scheduledTimer(withTimeInterval: 1.5
        , repeats: true) { (t1) in
            
            let randomnumber = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100)))+1)
            
            var flower = UIImageView()
            flower.image = UIImage(named: "flower.png")
            flower.frame = CGRect(x: randomnumber + 30, y: 30,width: 30,height: 30)
            self.view.addSubview(flower)
      
            Timer.scheduledTimer(withTimeInterval: 0.007
            , repeats: true) { (t2) in
                flower.center.y += 1
                
                if(self.basket.frame.intersects(flower.frame)){
                    self.score += 1
                    self.scorelbl.text = String(self.score)
                    flower.center.y = -10000000
                }
                
//                if(flower.center.x - 15 > self.basket.center.x - 25 && flower.center.x + 15 < self.basket.center.x
//                     + 25 && flower.center.y - 15 > self.basket.center.y - 25){
//                    self.score += 1
//                    self.scorelbl.text = String(self.score)
//                    flower.center.y = -10000000
//                }
                
                
//                
//                if(flower.center.y > self.basket.center.y + 25){
//                    t1.invalidate()
//                    t2.invalidate()
//                    let alert = UIAlertController(title: "Game Over", message: "", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//                        let main = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MainViewController
//                        
//                        self.present(main, animated: true, completion: nil)
//                    }))
//                    self.present(alert, animated: true, completion: nil)
//                }
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: 3
        , repeats: true) { (t1) in
            
            let randomnumber = Int(arc4random_uniform(UInt32((Int)(UIScreen.main.bounds.size.width-100)))+1)
            
            var octopus = UIImageView()
            octopus.image = UIImage(named: "octopus.png")
            octopus.frame = CGRect(x: randomnumber + 30, y: 30,width: 30,height: 30)
            self.view.addSubview(octopus)
            Timer.scheduledTimer(withTimeInterval: 0.009
            , repeats: true) { (t2) in
                octopus.center.y += 2
                
                if(self.basket.frame.intersects(octopus.frame)){
                    t1.invalidate()
                    t2.invalidate()
                    let alert = UIAlertController(title: "Game Over", message: "Octopus kills you", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Menu", style: .default, handler: { (action) in
                        let main = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MainViewController
                        
                        self.present(main, animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                
                
//                if(octopus.center.x - 15 > self.basket.center.x - 25 && octopus.center.x + 15 < self.basket.center.x
//                    + 25 && octopus.center.y - 15 > self.basket.center.y - 25 && octopus.center.y + 15 > self.basket.center.y + 25){
//                    t1.invalidate()
//                    t2.invalidate()
//                    let alert = UIAlertController(title: "Game Over", message: "", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
//                        let main = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MainViewController
//
//                        self.present(main, animated: true, completion: nil)
//                    }))
//                    self.present(alert, animated: true, completion: nil)
//                }
                
                
        }
    }
    }
    
    @objc func move(_ recognizer: UIPanGestureRecognizer){
        let translation: CGPoint = recognizer.translation(in: self.view)
        recognizer.view?.center = CGPoint(x: recognizer.view!.center.x + translation.x
            , y: recognizer.view!.center.y)
        recognizer.setTranslation(CGPoint(x: 0
            , y: 0
        ), in: self.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        runTimer()
//        let jeremyGif = UIImage.gifImageWithName("bg")
//        let imageView = UIImageView(image: jeremyGif)
//        imageView.frame = self.view.frame
//        view.addSubview(imageView)
    }
    func runTimer() {
        timer1 = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(PlayViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        if seconds < 1 {
            timer1.invalidate()
            
            let alert = UIAlertController(title: "Game Over", message: "Time's up", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Menu", style: .default, handler: { (action) in
                let main = self.storyboard?.instantiateViewController(withIdentifier: "Menu") as! MainViewController
                
                self.present(main, animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
            
        } else {
            seconds -= 1
            timelbl.text = String(seconds)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
