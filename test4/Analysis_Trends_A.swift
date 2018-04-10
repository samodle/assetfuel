//
//  Analysis_Trends_A.swift
//  assetfuel
//
//  Created by sam on 2/9/16.
//  Copyright © 2016 sam. All rights reserved.
//

import UIKit

class Analysis_Trends_A: UIViewController, TKSideDrawerDelegate  {
    
    
    var sideDrawerView: TKSideDrawerView? = nil
    var nextSegue: String = ""

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var chartContainerView: UIView!
    var trendPeriods: IntegerLiteralType = 24
    
    
    //MARK: Initialization
    convenience init?(trendPeriods: IntegerLiteralType){
        self.init()
        self.trendPeriods = trendPeriods
        
    }
    
    convenience init(){
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    //MARK: Chart Stuff
    override func viewDidLoad() {
        super.viewDidLoad()

        let chart = TKChart(frame: CGRectInset(chartContainerView.bounds,0,0))
        chart.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleWidth.rawValue | UIViewAutoresizing.FlexibleHeight.rawValue)
        chartContainerView.addSubview(chart)
        
        var randomNumericData = [TKChartDataPoint]()
        for i in 0..<trendPeriods {
            randomNumericData.append(TKChartDataPoint(x: i, y: Double(arc4random() % 100)))
        }
        
        chart.addSeries(TKChartLineSeries(items: randomNumericData))

        chart.allowTrackball = true
        let color = UIColor.redColor()
        let size = CGSizeMake(20, 20)
        let shape = TKPredefinedShape(type: TKShapeType.Rhombus, andSize: size)
        chart.trackball.line.style.verticalLineStroke = TKStroke(color: color, width: 2.0)
        chart.trackball.line.style.pointShapeFill = TKSolidFill(color: color)
        chart.trackball.line.style.pointShape = shape
        
        chart.xAxis!.allowZoom = true
        chart.yAxis!.allowZoom = true
        chart.xAxis!.allowPan = true
        chart.yAxis!.allowPan = true
        
        chart.allowAnimations = true
        
        /* SIDE DRAWER */
        sideDrawerView = TKSideDrawerView(frame: self.view.bounds)
        self.view.addSubview(sideDrawerView!)
        
        
        
        let navItem = UINavigationItem(title: "Last 24 Hrs")
        let showSideDrawerButton = UIBarButtonItem(title: "Menu", style: UIBarButtonItemStyle.Plain, target: self, action: "showSideDrawer")
        navItem.rightBarButtonItem = showSideDrawerButton
        navigationBar.items = [navItem]
        sideDrawerView!.mainView.addSubview(navigationBar)
        sideDrawerView!.mainView.addSubview(chartContainerView)
        
        /* Content */
        let sectionPrimary = sideDrawerView!.defaultSideDrawer.addSectionWithTitle("Analyses")
        sectionPrimary.addItemWithTitle("Loss Compass")
        sectionPrimary.addItemWithTitle("Sigma Control")
        sectionPrimary.addItemWithTitle("Pit Stop")
        
        sectionPrimary.style.textColor = UIColor(white:1, alpha:1)
        sectionPrimary.items[0].style.textColor = UIColor.whiteColor()
        sectionPrimary.items[1].style.textColor = UIColor.whiteColor()
        sectionPrimary.items[2].style.textColor = UIColor.whiteColor()
        //sectionPrimary.items[3].style.textColor = UIColor.whiteColor()
        
        /* Transitions */
        self.sideDrawerView!.defaultSideDrawer.position = TKSideDrawerPosition.Right
        self.sideDrawerView!.defaultSideDrawer.transition = TKSideDrawerTransitionType.SlideInOnTop
        //self.sideDrawer.transitionDuration = 0.2 //adjust the animation duration
        self.sideDrawerView!.defaultSideDrawer.delegate = self
        self.sideDrawerView!.defaultSideDrawer.fill = TKSolidFill(color: UIColor(red: PublicConstants.SLIDEDRAWER_R/255, green: PublicConstants.SLIDEDRAWER_G/255, blue: PublicConstants.SLIDEDRAWER_B/255 , alpha: 1))
        
        self.sideDrawerView!.defaultSideDrawer.alpha = PublicConstants.SLIDEDRAWER_ALPHA//0.92
        self.sideDrawerView!.defaultSideDrawer.style.dimOpacity = PublicConstants.SLIDEDRAWER_SHADOW//0.08 //makes rest darker if > 0
        /* END SIDE DRAWER */

       let goHomeButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.Plain, target: self, action: "goHome")
        navItem.leftBarButtonItem = goHomeButton
    
    }
  

    
    
    //MARK: Navigation Functions
    func showSideDrawer() {
        self.sideDrawerView!.defaultSideDrawer.show()
    }
    
    func sideDrawer(sideDrawer: TKSideDrawer!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            nextSegue = "ShowLossCompass"
            performSegueWithIdentifier("TrendsAExit", sender: self)
        case (0, 1):
            nextSegue = "ShowSigmaControl"
            performSegueWithIdentifier("TrendsAExit", sender: self)
        case (0, 2):
            nextSegue = "ShowPitStop"
            performSegueWithIdentifier("TrendsAExit", sender: self)            
        default:
            print("didnt make it :(")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "TrendsAExit" { 
            let toolPageViewController = segue.destinationViewController as! SlideDrawerViewController
            toolPageViewController.SegueToExecute = nextSegue
        }
    }
    
    func goHome() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    //MARK: Actions
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
