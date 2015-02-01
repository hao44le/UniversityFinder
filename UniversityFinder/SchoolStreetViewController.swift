//
//  SchoolStreetViewController.swift
//  Location
//
//  Created by Gelei Chen on 15/1/26.
//  Copyright (c) 2015年 Purdue iOS Club. All rights reserved.
//

import UIKit

class SchoolStreetViewController: UIViewController, GMSMapViewDelegate {

    var currentSchool: School?
    override func viewDidLoad() {
        super.viewDidLoad()
        var panoView = GMSPanoramaView(frame: CGRectZero)
        self.view = panoView
        let latitude : CLLocationDegrees? = currentSchool?.latitude
        let longitude : CLLocationDegrees? = currentSchool?.longitude
        panoView.moveNearCoordinate(CLLocationCoordinate2DMake(latitude!, longitude!))

        // Do any additional setup after loading the view.
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
