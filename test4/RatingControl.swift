//
//  RatingControl.swift
//  test4
//
//  Created by sam on 12/14/15.
//  Copyright © 2015 sam. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    //MARK: Properties
    
    @objc var rating = 0{
        didSet {
            setNeedsLayout()
        }
    }
    @objc var ratingButtons = [UIButton]()
    @objc var spacing = 5
    @objc var stars = 5
    
    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        for _ in 0..<stars {
            let button = UIButton()
            button.setImage(emptyStarImage, for: UIControlState())
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
          //  button.backgroundColor = UIColor.redColor()
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), for: .touchDown)
            ratingButtons+=[button]
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x:0, y:0, width:buttonSize,height: buttonSize)
        for(index,button) in ratingButtons.enumerated(){
            
            buttonFrame.origin.x = CGFloat(index*(buttonSize+spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()
    }
    
    override var intrinsicContentSize : CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize + spacing) * stars
        return CGSize(width: width, height:buttonSize)
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: Button Action
    @objc func ratingButtonTapped(_ button: UIButton){
        //print("Button pressed 👍")
        rating = ratingButtons.index(of: button)! + 1
        updateButtonSelectionStates()
    }
    
    @objc func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }

}
