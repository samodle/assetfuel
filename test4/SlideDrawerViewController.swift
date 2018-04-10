//
//  SlideDrawerViewController.swift
//  assetfuel
//
//  Created by sam on 12/31/15.
//  Copyright © 2015 sam. All rights reserved.
//

import UIKit

class SlideDrawerViewController: UIViewController, SMSegmentViewDelegate {
    
    //MARK: Navigation Prep
    var DidWeJustUnwind: Bool = false
    var SegueToExecute: String = "ShowLossCompass"
    
    @IBAction func returnToLineSelect(_ sender: AnyObject) {
        goHome()
    }
       
    //MARK: Variables
    var isDaySelected: Bool = true
    var isWeekSelected: Bool = false
    var isMonthSelected: Bool = false
    
    func segmentView(_ segmentView: SMBasicSegmentView, didSelectSegmentAtIndex index: Int) {
 
        //TIME PERIOD DEPENDENT SETUP
        switch index{
        case 0:
            print("day selected")
            isDaySelected = true
            isWeekSelected = false
            isMonthSelected = false
   
        case 1:
            print("week selected")
            isDaySelected = false
            isWeekSelected = true
            isMonthSelected = false
       

        case 2:
            print("month selected")
            isDaySelected = false
            isWeekSelected = false
            isMonthSelected = true
     
        default:
            break
        }
    }

    @IBOutlet var MainUICardView: CardView! //new
    @IBOutlet var ContainerViewNew: UIView! //new
    
    @IBOutlet var ScrollView: UIScrollView! //new
    
    @IBOutlet var LossCompassCard: CardView!
    @IBOutlet var TrendsCard: CardView!
    @IBOutlet var SigmaControlCard: CardView!
    @IBOutlet weak var PanoFourCard: CardView!
    
    @IBOutlet var MainMenuSegmentView: SMSegmentView!
 
    //MARK: Initialization
    
    convenience init?(selectedLineName: String){
        self.init()
      //  self.selectedLineName = selectedLineName
    }
    
    convenience init(){
        self.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    //MARK: View Load
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if(DidWeJustUnwind){
            DidWeJustUnwind = false
            performSegue(withIdentifier: SegueToExecute, sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        ManageCardHeights()

        let segmentView = MainMenuSegmentView

        segmentView?.delegate = self
        segmentView?.addSegmentWithTitle("By Category")
        segmentView?.addSegmentWithTitle("Map")
     //   segmentView?.addSegmentWithTitle("Month")
        
        segmentView?.selectSegmentAtIndex(0)
        
    }


    func collectionView(_ collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    
    func goHome() {
        dismiss(animated: true, completion: nil)
    }
   
    
    //MARK: Other
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator)
    {
        DispatchQueue.main.async {
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func ManageCardHeights() {
        
        
        let screenSize: CGRect = UIScreen.main.bounds
        let screenHeight = screenSize.height

        if screenHeight > PublicConstants.BigScreenCutoff
        {
            let LossCompassCardHeight = LossCompassCard.heightAnchor.constraint(equalToConstant: PublicConstants.BigHeightAnchor)
            let TrendsCardHeight = TrendsCard.heightAnchor.constraint(equalToConstant: PublicConstants.BigHeightAnchor)
            let SigmaControlCardHeight = SigmaControlCard.heightAnchor.constraint(equalToConstant: PublicConstants.BigHeightAnchor)
            let PanoFourHeight = PanoFourCard.heightAnchor.constraint(equalToConstant: PublicConstants.BigHeightAnchor)
            let ContainerViewHeight = ContainerViewNew.heightAnchor.constraint(equalToConstant: 1600)
            
            LossCompassCardHeight.isActive = true
            TrendsCardHeight.isActive = true
            SigmaControlCardHeight.isActive = true
            PanoFourHeight.isActive = true
            ContainerViewHeight.isActive = true
        } else
        {
            let LossCompassCardHeight = LossCompassCard.heightAnchor.constraint(equalToConstant: PublicConstants.SmallHeightAnchor)
            let TrendsCardHeight = TrendsCard.heightAnchor.constraint(equalToConstant: PublicConstants.SmallHeightAnchor)
            let SigmaControlCardHeight = SigmaControlCard.heightAnchor.constraint(equalToConstant: PublicConstants.SmallHeightAnchor)
              let PanoFourHeight = PanoFourCard.heightAnchor.constraint(equalToConstant: PublicConstants.SmallHeightAnchor)
            let ContainerViewHeight = ContainerViewNew.heightAnchor.constraint(equalToConstant: 800)
            
            LossCompassCardHeight.isActive = true
            TrendsCardHeight.isActive = true
            SigmaControlCardHeight.isActive = true
            PanoFourHeight.isActive = true
            ContainerViewHeight.isActive = true
        }
        
    }
    
    func showAlert(_ sender: AnyObject) {
    }
}
