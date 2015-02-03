//
//  RankingDetailTableViewController.swift
//  UniversityFinder
//
//  Created by Gelei Chen on 15/2/2.
//  Copyright (c) 2015年 Succeed America. All rights reserved.
//

import UIKit

class RankingDetailTableViewController: UITableViewController {

    let titles = ["Sand Harbor, Lake Tahoe - California","Beautiful View of Manhattan skyline.","Watcher in the Fog","Great Smoky Mountains National Park, Tennessee","Most beautiful place"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return titles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.titles[indexPath.row % 5]
        let curr = indexPath.row % 5  + 1
        let imgName = "pin\(curr).jpg"
        cell.imageView?.image = UIImage(named: imgName)

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "schoolDetail" {
            let viewController = segue.destinationViewController as SchoolDetailViewController
            viewController.currentSchool = School(name: "Stanford University", logoURL: "http://z2.cheggcdn.com/sites/default/files/imagecache/175wide/2011/09/12/stanford.gif", location: "Stanford, CA", info: "Stanford is recognized as one of the world's leading universities. Our renowned professors offer students a remarkable range of academic courses that are paired with an extraordinary breadth of extracurricular activities and opportunities for research, independent study and public service......", applicationDeadline: "Regular Decision: Jan 1, 2015Early Action: Nov 1, 2014", percentOfAdmitted: "7%of Applicants Admitted", SATT: "2080-2350 SAT Total", SATR: "680-780 SAT Reading", SATM: "700-790 SAT Math", ACTC: "31-34 ACT Composite", ACTE: "32-35 ACT English", ACTM: "31-35 ACT Math", tuition: "$57,871Annual tuition, fees, books, supplies, room and board", in_state: "In-State Tuition: $41,250", out_state: "Out-of-State Tuition: $41,250", room: "Room and Board: $2,400", book: "Books & Supplies: $1,500", undergraduate: "8,264number of undergraduates", category: "private-non-profit", setting: "Setting: suburban", student_faculty: "Student/Faculty ratio: 12:1", percentOfWomen: "20% Women",latitude:37.4300, longitude: -122.1700)
        }
        
    }

}
