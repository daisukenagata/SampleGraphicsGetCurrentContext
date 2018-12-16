//
//  ViewController.swift
//  SampleGraphicsGetCurrentContext
//
//  Created by 永田大祐 on 2018/12/16.
//  Copyright © 2018年 永田大祐. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vc = GradientView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.black
        self.view.addSubview(vc.vc2)
        self.view.addSubview(vc.vc)
    }

    @IBAction func bt(_ sender: Any) {
        if vc.vc.isHidden == false {
            vc.vc.isHidden = true
            vc.vc2.isHidden = false
        } else {
            vc.vc.isHidden = false
            vc.vc2.isHidden = true
        }
    }
}

class GradientView:  UIView {

    let vc = DrawRadialGradientView()
    let vc2 = DrawLinearGradientView()

    override init(frame: CGRect) {
        super.init(frame: .zero)

        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)

        vc.frame = self.frame
        vc2.frame = self.frame
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class DrawRadialGradientView : UIView {

    let screenWidth = UIScreen.main.bounds.width

    override init(frame: CGRect) {
        super.init(frame: .zero)

        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        let ref = UIGraphicsGetCurrentContext()
        let colors = [UIColor.white.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.blue.cgColor,UIColor.red.cgColor] as CFArray
        let colorSpc:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient:CGGradient = CGGradient(colorsSpace: colorSpc, colors: colors, locations: nil)!

        ref!.drawRadialGradient(gradient, startCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), startRadius: 0, endCenter: CGPoint(x:self.frame.size.width/2,y: self.frame.size.height/2), endRadius: self.frame.size.width/2, options: CGGradientDrawingOptions(rawValue:0))
    }
}

class DrawLinearGradientView : UIView {

    let screenWidth = UIScreen.main.bounds.width

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        let ref = UIGraphicsGetCurrentContext()
        let colors = [UIColor.white.cgColor,UIColor.green.cgColor,UIColor.yellow.cgColor,UIColor.blue.cgColor,UIColor.red.cgColor] as CFArray
        let colorSpc:CGColorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient:CGGradient = CGGradient(colorsSpace: colorSpc, colors: colors, locations: nil)!
        ref!.drawLinearGradient(gradient, start: CGPoint(x: 0, y: 0), end: CGPoint(x: self.frame.size.width, y: self.frame.size.height), options: CGGradientDrawingOptions(rawValue:0))
    }
}
