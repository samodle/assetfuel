//
//  Analysis_Trends_C.swift
//  assetfuel
//
//  Created by sam on 2/9/16.
//  Copyright © 2016 sam. All rights reserved.
//

import UIKit

class Analysis_Trends_C: UIViewController {

    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var chartContainerView: UIView!
    var trendPeriods: IntegerLiteralType = 30
    
    
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
        
        
        //Original
        //   let chart = TKChart(frame: CGRectInset(self.view.bounds, 1, 1))
        //   self.view.addSubview(chart)
        //New
        let chart = TKChart(frame: CGRectInset(chartContainerView.bounds,0,0))
        chart.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.FlexibleWidth.rawValue | UIViewAutoresizing.FlexibleHeight.rawValue)
        chartContainerView.addSubview(chart)
        
        
        
        var randomNumericData = [TKChartDataPoint]()
        for i in 0..<trendPeriods {
            randomNumericData.append(TKChartDataPoint(x: i, y: Double(arc4random() % 100)))
        }
        
        chart.addSeries(TKChartLineSeries(items: randomNumericData))
        
        // chart.title.hidden = false
        // chart.title.text = "Chart w/ Random Data"
        // chart.legend.hidden = false
        
        
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
        
        
        chart.allowAnimations = false
    }
    
    
    //MARK: Actions
    
    @IBAction func goHome(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
        
        //navigationController!.popViewControllerAnimated(true)
        
    }
    
    
    
    
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
