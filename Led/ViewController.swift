//
//  ViewController.swift
//  Led
//
//  Created by Pham Ngoc Hai on 11/8/16.
//  Copyright © 2016 Mystudio. All rights reserved.
//

import UIKit

var n = 9
var margin: CGFloat = 30

class ViewController: UIViewController {
    
    @IBAction func ac_Draw(_ sender: AnyObject) {

        n = Int(Tf_SoBong.text!)!
        
        for index in 1...n {
         for indexCot in 1...n{
            
            let ball = UIImageView(image: #imageLiteral(resourceName: "Image"))
            ball.center = CGPoint(x: margin + CGFloat(index-1)*SpaceBetweenBall(), y: (margin * 2)
                + CGFloat(indexCot-1)*SpaceBetweenRow())
            self.view.addSubview(ball)
        }
        }

        
    }
    
    
    @IBOutlet weak var Tf_SoBong: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
            }
    
    func  SpaceBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.width - margin * 2)/CGFloat(n-1)
        return space
    }
    func SpaceBetweenRow() -> CGFloat{
        let row = (self.view.bounds.height - margin * 3)/CGFloat(n-1)
        return row
    }
    
}

