//
//  Draw2D.swift
//  assetfuel
//
//  Copyright © 2016 sam. All rights reserved.
//

import UIKit

@IBDesignable
open class Draw2D: UIView {
    
    @IBInspectable open var Ypos: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()  // this statement is extremely important to update the UI after a "set"
        }
    }
    

    @IBInspectable open var Height: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }

    @IBInspectable open var Xpos: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }

    @IBInspectable open var Width: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }

    @IBInspectable open var RectColor_R: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable open var RectColor_G: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }
    @IBInspectable open var RectColor_B: CGFloat = 0{
        didSet {
            self.setNeedsDisplay()
        }
    }

    
    override open func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        let rectangle = CGRect(x: Xpos,y: Ypos,width: Width,height: Height)
        
        context?.addRect(rectangle)
        context?.strokePath()
        context?.setFillColor(UIColor(red: RectColor_R/255, green: RectColor_G/255, blue: RectColor_B/255, alpha: 1).cgColor)
        context?.fill(rectangle)    }

}
