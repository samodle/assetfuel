//
//  LineSelectionViewController.swift
//  assetfuel
//
//  Created by sam on 2/6/16.
//  Copyright © 2016 sam. All rights reserved.
//

import UIKit

class LineSelectionViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet var AnalyzeButton: UIButton!
    @IBOutlet weak var LinePickerview: UIPickerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBAction func Analyze(_ sender: AnyObject) {
        AdvanceToLineHome()
        //showAlert(sender)
    }

    var linenameslist = ["Packing Line 1", "Packing Line 2", "Packing Line 3", "Packing Line 4", "Packing Line 5", "Packing Line 6", "Packing Line 7", "Packing Line 8", "Packing Line 9"]

    //MARK: Properties
    
    @IBOutlet weak var LinePickervIew: UIPickerView!
    
    func AdvanceToLineHome(){
        activityIndicator.alpha = 1
        activityIndicator.startAnimating()
        LinePickerview.alpha = 0
        let delay = 0.5 * Double(NSEC_PER_SEC)
        let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "ShowToolHomePage", sender: self)
            self.activityIndicator.alpha = 0
            self.LinePickerview.alpha = 1
        }
        
        
    }

    
    override var shouldAutorotate : Bool {
        return false;
    }
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)

        // Do any additional setup after loading the view.
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowToolHomePage" { //this means we are gonna edit an existing kaizen
       //     let selectedLine = LinePickerview.selectedRow(inComponent: 0)
        //    let toolPageViewController = segue.destination as! SlideDrawerViewController
        }
    }
    
    
    //MARK: Actions
  
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int
    { return 1
    }
  
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return linenameslist.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return linenameslist[row]
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        AnalyzeButton.layer.cornerRadius = 22 // this value vary as per your desire
        AnalyzeButton.clipsToBounds = true
    }
    
    
}
