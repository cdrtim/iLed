//
//  ViewController.swift
//  Led
//
//  Created by Pham Ngoc Hai on 11/8/16.
//  Copyright © 2016 Mystudio. All rights reserved.
//

import UIKit

var n = 6
var margin: CGFloat = 30
var lastOnLed = -1
var timer : Timer!
var a = 5
class ViewController: UIViewController {
    
   
    func runningLed()
    {
        
        if (lastOnLed != -1)
        {
            turnOffLed()
        }
        if (lastOnLed != n)
        {
            lastOnLed = lastOnLed + 1
        }
        else
            
        {
            timer.invalidate()
            timer =   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runNguoc), userInfo: nil, repeats: true)
        }
        turnOnLed()
    }
    func runNguoc()
    {
        if (lastOnLed != 1)
        {
            turnOffLed()
           lastOnLed = lastOnLed - 1
        }
        else {
            timer.invalidate()
            timer =   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
        }
        turnOnLed()

    }
    
    
    func turnONledRow()
    {
        if  let ball = self.view.viewWithTag(100 + lastOnLed) as? UIImageView {
        }
    }
    
    
    func turnOnLed()
    {
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView
        {
            ball.image = #imageLiteral(resourceName: "Image")
        }
    }
    
    func turnOffLed()
    {
        
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView
        {
            ball.image = #imageLiteral(resourceName: "Image-1")
        }
        
        
        
    }
    
    
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
     timer =   Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
       
        
        
        for index in 1...n {
            for indexCot in 1...n{
                
                let ball = UIImageView(image: #imageLiteral(resourceName: "Image"))
                ball.center = CGPoint(x: margin + CGFloat(index-1)*SpaceBetweenBall(), y: (margin * 2)
                    + CGFloat(indexCot-1)*SpaceBetweenRow())
                
                ball.tag = index + 100
                self.view.addSubview(ball)
            }
        }
        
        
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

