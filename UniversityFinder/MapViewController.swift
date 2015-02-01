//
//  ViewController.swift
//  Location
//
//  Created by Gelei Chen on 15/1/8.
//  Copyright (c) 2015 Purdue iOS Club. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {

    
    var currentSchool:School?
    

    let schools: [School] = [
        School(name: "Stanford University", logoURL: "http://z2.cheggcdn.com/sites/default/files/imagecache/175wide/2011/09/12/stanford.gif", location: "Stanford, CA", info: "Stanford is recognized as one of the world's leading universities. Our renowned professors offer students a remarkable range of academic courses that are paired with an extraordinary breadth of extracurricular activities and opportunities for research, independent study and public service......", applicationDeadline: "Regular Decision: Jan 1, 2015Early Action: Nov 1, 2014", percentOfAdmitted: "7%of Applicants Admitted", SATT: "2080-2350 SAT Total", SATR: "680-780 SAT Reading", SATM: "700-790 SAT Math", ACTC: "31-34 ACT Composite", ACTE: "32-35 ACT English", ACTM: "31-35 ACT Math", tuition: "$57,871Annual tuition, fees, books, supplies, room and board", in_state: "In-State Tuition: $41,250", out_state: "Out-of-State Tuition: $41,250", room: "Room and Board: $2,400", book: "Books & Supplies: $1,500", undergraduate: "8,264number of undergraduates", category: "private-non-profit", setting: "Setting: suburban", student_faculty: "Student/Faculty ratio: 12:1", percentOfWomen: "20% Women",latitude:37.4300, longitude: -122.1700),
        School(name: "University of California-Los Angeles (UCLA)", logoURL: "http://z2.cheggcdn.com/sites/default/files/imagecache/175wide/2011/09/12/ucla_sqlogo.jpg", location: "Los Angeles, CA", info: "The University of California, Los Angeles is one of the premier public research universities in the United States.  Founded in 1919, it is the second oldest campus in the University of California system.The school receives more applications than any other school in the country, and has the lowest acceptance rate in the UC system.UCLA is the most successful school in the history of NCAA Division I athletics, having amassed more national championship than any other university, including over 100 team championships.For the 2009-2010 school year, UCLA was .....", applicationDeadline: "Regular Decision: Nov 30, 2014", percentOfAdmitted: "27% of Applicants Admitted", SATT: "1760-2140 SAT Total", SATR: "560-690 SAT Reading", SATM: "610-740 SAT Math", ACTC: "25-31 ACT Composite", ACTE: "25-32 ACT English", ACTM: "26-33 ACT Math", tuition: "$30,460Annual tuition, fees, books, supplies, room and board", in_state: "In-State Tuition: $41,250", out_state: "Out-of-State Tuition: $41,250", room: "Room and Board: $2,400", book: "Books & Supplies: $1,500", undergraduate: "8,264number of undergraduates", category: "private-non-profit", setting: "Setting: suburban", student_faculty: "Student/Faculty ratio: 12:1", percentOfWomen: "20% Women", latitude: 34.0722, longitude: -118.4441),
        School(name: "New York University (NYU)", logoURL: "http://z2.cheggcdn.com/sites/default/files/2010/02/02/1751725_51cdef7488cc2_nyu-icon.jpeg", location: "New York, NY", info: "NYU, founded in 1831, is a private, comprehensive university. Programs are offered through the College of Arts and Sciences; the Schools of Education, Health, Nursing, and Arts Professions; Social Work; and Continuing Education; the Stern School of Business; Tisch School of the Arts; Gallatin School of Individualized Study. Its campus is located in Greenwich Village, New York City.", applicationDeadline: "Regular Decision: Jan 1,2015 Early Decision: Nov 1, 2014", percentOfAdmitted: "35% of Applicants Admitted", SATT: "1890-2180 SAT Total", SATR: "620-710 SAT Reading", SATM: "630-740 SAT Math", ACTC: "28-31 ACT Composite", ACTE: "", ACTM: "", tuition: "$59,081 Annual tuition, fees, books, supplies, room and board", in_state: "In-State_Tuition:_$40,878", out_state: "Out-of-State_Tuition:_$40,878", room: "Room_and_Board:_$1,000", book: "Books_&_Supplies:_$1,070", undergraduate: "26,900number_of_undergraduates", category: "private-non-profit", setting: "Setting:_city", student_faculty: "Student/Faculty_ratio:_11:1", percentOfWomen: "31%_Women", latitude: 40.7300, longitude: -73.9950),
        School(name: "Yale_University", logoURL: "http://z2.cheggcdn.com/sites/default/files/imagecache/175wide/2011/09/12/yale_squarelogo.jpg", location: "New_Haven,_CT", info: "Founded_in_1701,_Yale_is_a_university_with_honored_traditions._In_the_diversity_of_its_students,_its_global_outlook,_and_its_outstanding_research,_it_is_also_a_university_of_compelling_change._Today_Yale_is_one_of_the_world’s_great_research_universities,_with_a_total_student_population_of_more_than_11,000—in_Yale_College_and_thirteen_graduate_and_professional_schools—and_a_faculty_numbering_more_than_2,400._For_all_its_size_and_scope,_Yale_holds_ﬁrmly_to_its_traditional_emphasis_on_undergraduate_teaching._Yale_is_perhaps_best_known_for_the_strength_of_its_college,_where_its_.....", applicationDeadline: "Regular_Decision:_Jan_1 _2015 Early_Action:_Nov_1,_2014", percentOfAdmitted: "6.9% of_Applicants_Admitted", SATT: "2140-2390_SAT_Total", SATR: "710-800_SAT_Reading", SATM: "710-790_SAT_Math", ACTC: "31-35_ACT_Composite", ACTE: "", ACTM: "", tuition: "$63,200 Annual_tuition,_fees,_books,_supplies,_room_and_board", in_state: "In-State_Tuition:_$45,800", out_state: "Out-of-State_Tuition:_$45,800", room: "Room_and_Board:_$14,000", book: "Books_&_Supplies:_$3,400", undergraduate: "5,409number_of_undergraduates", category: "private-non-profit", setting: "Setting:_city", student_faculty: "Student/Faculty_ratio:_6:1", percentOfWomen: "49%_Women", latitude: 41.3111, longitude: -72.9267),
        School(name: "Purdue University", logoURL: "http://z2.cheggcdn.com/sites/default/files/2011/05/16/purdue_logo_1.jpg", location: "West Lafayette, IN", info: "Purdue University is a vast laboratory for discovery. The university is known not only for science, technology, engineering, and math programs, but also for our imagination, ingenuity, and innovation. It’s a place where those who seek an education come to make their ideas real — especially when those transformative discoveries lead to scientific, technological, social, or humanitarian impact. Founded in 1869 in West Lafayette, Indiana, the university proudly serves its state as well as the nation and the world. Academically, Purdue’s role as a major research institution is supported by .....", applicationDeadline: "Regular Decision: Mar 1, 2015 Early Action: Nov 1, 2014", percentOfAdmitted: "60% of Applicants Admitted", SATT: "1570-1920 SAT Total", SATR: "510-620 SAT Reading", SATM: "550-680 SAT Math", ACTC: "24-30 ACT Composite", ACTE: "23-30 ACT English", ACTM: "25-31 ACT Math", tuition: "$40,204 Annual tuition, fees, books, supplies, room and board", in_state: "In-State Tuition: $10,002", out_state: "Out-of-State Tuition: $28,804", room: "Room and Board: $10,030", book: "Books & Supplies: $1,370", undergraduate: "29,440number of undergraduates", category: "public", setting: "Setting: suburban", student_faculty: "Student/Faculty ratio: 13:1", percentOfWomen: "32% Women", latitude: 40.427219, longitude: -86.916675)
        
        
    ]


   
    let mapView = MKMapView(frame: CGRectZero)
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.locationManager.requestWhenInUseAuthorization()
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(38.8833, -96.917633), 5000000, 5000000), animated: true)
        mapView.delegate = self
        mapView.showsUserLocation = true
        self.view = mapView
        
        
        
        for school in schools {
            let annotation = MKPointAnnotation()
            annotation.title = school.name
            annotation.subtitle = school.location
            annotation.coordinate = CLLocationCoordinate2DMake(school.latitude, school.longitude)
            mapView.addAnnotation(annotation)
        }
        
        //The "Find me" button
        let image = UIImage(named: "Location") as UIImage?
        let button = UIButton.buttonWithType(UIButtonType.System) as UIButton
        button.frame = CGRectMake(50, 50, 50, 50)
        button.setImage(image, forState: .Normal)
        button.addTarget(self, action: "buttonAction:", forControlEvents: UIControlEvents.TouchUpInside)
        button.center = CGPointMake(300.0, 500.0)
        self.view.addSubview(button)
        
        
        

    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        var pinAnnotation: MKPinAnnotationView?
        if annotation.isKindOfClass(MKPointAnnotation.classForCoder()) {
            let PinIdentifier = "PinIdentifier"
            pinAnnotation = mapView.dequeueReusableAnnotationViewWithIdentifier(PinIdentifier) as? MKPinAnnotationView
            if pinAnnotation == nil {
                pinAnnotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: PinIdentifier)
            }
            pinAnnotation?.canShowCallout = true
            pinAnnotation?.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
        }
        return pinAnnotation
    }
    
    func mapView(mapView: MKMapView!, annotationView view: MKAnnotationView!, calloutAccessoryControlTapped control: UIControl!) {
        for school in schools {
            if school.name == view.annotation.title {
                self.currentSchool = school
                self.performSegueWithIdentifier("transformToSchoolDetail", sender: self)
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "transformToSchoolDetail" {
            let viewController = segue.destinationViewController as SchoolDetailViewController
            viewController.currentSchool = currentSchool
        }
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func buttonAction(sender:UIButton!)
    {
        let myLocation = mapView.userLocation.coordinate as CLLocationCoordinate2D
        let zoomRegion = MKCoordinateRegionMakeWithDistance(myLocation,500000,500000)
        self.mapView.setRegion(zoomRegion, animated: true)
    }

}

