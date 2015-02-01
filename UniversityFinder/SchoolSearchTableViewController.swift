//
//  CandyTableViewController.swift
//  CandySearch
//
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit

class SchoolSearchTableViewController : UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var tv: UITableView!
    
    
    var searched = false
    var schools = [School]()
    var filteredSchools = [School]()
    var currentSchool:School?
    let csvArray = NSArray(
        contentsOfCSVURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("1", ofType: "csv")!),
        options: CHCSVParserOptions.SanitizesFields
    )
    override func viewDidLoad() {
        // Sample Data for candyArray
        var i = 0
            for (i = 1;i < self.csvArray.count;i++){
                if let collegeInfo = self.csvArray[i] as? [NSString]{
                    let name = collegeInfo[0]
                    let logoURL = collegeInfo[3]
                    let location = collegeInfo[4]
                    let info = collegeInfo[5]
                    let applicationDeadline = collegeInfo[6]
                    let percentOfAdmitted = collegeInfo[7]
                    let SATT = collegeInfo[8]
                    let SATR = collegeInfo[9]
                    let SATM = collegeInfo[10]
                    let ACTC = collegeInfo[12]
                    let ACTE = collegeInfo[13]
                    let ACTM = collegeInfo[14]
                    let tuition = collegeInfo[15]
                    let in_state = collegeInfo[16]
                    let out_state = collegeInfo[17]
                    let room = collegeInfo[18]
                    let book = collegeInfo[19]
                    let undergraduate = collegeInfo[20]
                    let category = collegeInfo[21]
                    let setting = collegeInfo[22]
                    let student_faculty = collegeInfo[23]
                    let percentOfWomen = collegeInfo[24]
                    let latitude = collegeInfo[1].doubleValue
                    let longitude = collegeInfo[2].doubleValue
                    let school = School(name: name, logoURL: logoURL, location: location, info: info, applicationDeadline: applicationDeadline, percentOfAdmitted: percentOfAdmitted, SATT: SATT, SATR: SATR, SATM: SATM, ACTC: ACTC, ACTE: ACTE, ACTM: ACTM, tuition: tuition, in_state: in_state, out_state: out_state, room: room, book: book, undergraduate: undergraduate, category: category, setting: setting, student_faculty: student_faculty, percentOfWomen: percentOfWomen, latitude: latitude, longitude: longitude)
                    self.schools.append(school)
                }
                
            }
        
        
        
        // Reload the table
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredSchools.count
        } else {
            return self.schools.count
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell

        var school : School
        // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
        if tableView == self.searchDisplayController!.searchResultsTableView {
            school = filteredSchools[indexPath.row]
        } else {
            school = schools[indexPath.row]
        }

        // Configure the cell
        cell.textLabel!.text = school.name
        cell.detailTextLabel!.text = school.location
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        
        
        

//too slow
//        dispatch_async(dispatch_get_main_queue()) {
//            if let ima = school.logoURL{
//                let url = NSURL(string:ima)
//                let data_1 = NSData(contentsOfURL: url!)
//                cell.imageView?.image = UIImage(data: data_1!)
//            }
//        }
        
            
        

        
        
        return cell
    }

    func filterContentForSearchText(searchText: String, scope: String = "All") {
        self.filteredSchools = self.schools.filter({( school : School) -> Bool in
            var categoryMatch = (scope == "All")
            var stringMatch = school.name.rangeOfString(searchText)
            self.searched = true
            return categoryMatch && (stringMatch != nil)
            })
        
    }

    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        let scopes = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
        let selectedScope = scopes[self.searchDisplayController!.searchBar.selectedScopeButtonIndex] as String
        self.filterContentForSearchText(searchString, scope: selectedScope)
        self.searched = true
        return true
    }
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath){
        cell.layer.transform=CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
    }

    func searchDisplayController(controller: UISearchDisplayController!,
        shouldReloadTableForSearchScope searchOption: Int) -> Bool {
            let scope = self.searchDisplayController!.searchBar.scopeButtonTitles as [String]
            self.filterContentForSearchText(self.searchDisplayController!.searchBar.text, scope: scope[searchOption])
            return true
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if searched {
            self.currentSchool = filteredSchools[indexPath.row]
        } else {
            self.currentSchool = schools[indexPath.row]
        }
        
        self.performSegueWithIdentifier("schoolDetail", sender: tableView)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "schoolDetail" {
            let viewController = segue.destinationViewController as SchoolDetailViewController
            viewController.currentSchool = currentSchool
        }
        
    }}
