//
//  ViewController.swift
//  Button_animation_test2
//
//  Created by Danny Dharumasena on 18/9/17.
//  Copyright © 2017 Danny Dharumasena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var shakeButton: UIButton!
    
    @IBOutlet weak var bounceButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
   
}

    @IBAction func shakeButton(_ sender: UIButton) {
        sender.shake()
    }
    
    @IBAction func bounceButton(_ sender: UIButton) {
        sender.bounce()
    }

}

extension UIButton {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x-4, y: self.center.y))
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x+4, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
    
    func bounce() {
        self.transform = CGAffineTransform(scaleX: 0.90, y: 0.90)
        UIView.animate(withDuration: 0.5, delay: 0,
                       usingSpringWithDamping: 0.4,
                       initialSpringVelocity: 0,
                       options: UIViewAnimationOptions.allowUserInteraction, animations: {
                        self.transform = .identity
        }) { (success) in
        }
    }
}






