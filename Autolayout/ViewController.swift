//
//  ViewController.swift
//  Autolayout
//
//  Created by miyamo on 2015/04/17.
//  Copyright (c) 2015年 miyamoto haruna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var test: UIButton!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var pressView: UIImageView!
    @IBOutlet weak var timerlabel: UILabel!
    var pimage:UIImage = UIImage(named: "coffeepress_empty_2.png")!
    var num:Int!
    var countNum = 240
    var ope = 0
    var colorNum:UInt!
    var timer:NSTimer!
    let colorView = UIView()
      @IBAction func brewbtn(sender: UIButton) {
        if ope == 0{
           timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
            ++ope
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        colorView.frame = CGRectMake(0, 0, 420, 1000)
        colorView.backgroundColor = UIColor.brownColor()
        pressView.image = pimage
        self.view.addSubview(pressView)

        self.view.addSubview(colorView)
        self.view.sendSubviewToBack(colorView)
        
        timerlabel.font = UIFont(name: "QUIZ-SHOW", size: 24)

    }
    
    func update() {
        timerlabel.text = String(countNum)
        --countNum
        colorNum = 0xF5785A

        colorView.backgroundColor = UIColorFromRGB(colorNum)
        self.view.addSubview(colorView)
        self.view.sendSubviewToBack(colorView)
        
        if countNum == 0{
            timerlabel.text = String(countNum)
            timer.invalidate()
            countNum = 240
            ope = 0
            colorNum = 0x123456
            self.view.addSubview(colorView)
            self.view.sendSubviewToBack(colorView)
            
        }

        if countNum == 0 && timer.valid == true{
            timer.invalidate()
            countNum = 240
            ope = 0
            colorNum = 0x123456
            self.view.addSubview(colorView)
            self.view.sendSubviewToBack(colorView)
            
        }
 
    }
    
    //UIntに16進で数値をいれるとUIColorが戻る関数
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}