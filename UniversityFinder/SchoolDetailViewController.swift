//
//  LibraryDetailViewController.swift
//  Purdue
//
//  Created by George Lo on 12/21/14.
//  Copyright (c) 2014 Purdue University. All rights reserved.
//

import UIKit

class SchoolDetailViewController: UITableViewController {
    
    var titles = ["Name", "LOCATION", "Percent of Admitted","ACTM","Percent of Women","Introduction","SATR","Application Deadline","In-state-tuition","Out-of-state-tuition","Tuition","Room","Book","Number Of undergraduate students","Category","Setting","Student/faculty ratio"]
    var currentSchool: School?
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = currentSchool?.name
        
        if let ima = currentSchool!.logoURL{
            let url = NSURL(string:ima)
            let data = NSData(contentsOfURL: url!)
            let imageView = UIImageView(image:UIImage(data: data!))
            //imageView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.width * 0.5)
            self.tableView.tableHeaderView = imageView
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return titles.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIdentifier = "CellIdentifier"
        var cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier) as? UITableViewCell

        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: CellIdentifier)
            

        }
        
        cell?.textLabel?.font = UIFont(name: "Avenir-Heavy", size: 17)
        cell?.textLabel?.text = titles[indexPath.row]
        
        cell?.detailTextLabel?.font = UIFont(name: "Avenir-Book", size: 14)
        if indexPath.row == 0 {
            cell?.detailTextLabel?.text = currentSchool?.name
        } else if indexPath.row == 1 {
            cell?.detailTextLabel?.text = currentSchool?.location
        } else if indexPath.row == 2 {
            cell?.detailTextLabel?.text = currentSchool?.percentOfAdmitted
        } else if indexPath.row == 3 {
            cell?.detailTextLabel?.text = currentSchool?.ACTM
        } else if indexPath.row == 4 {
            cell?.detailTextLabel?.text = currentSchool?.percentOfWomen
        } else if indexPath.row == 5 {
            cell?.detailTextLabel?.text = currentSchool?.info
        } else if indexPath.row == 6 {
            cell?.detailTextLabel?.text = currentSchool?.SATR
        } else if indexPath.row == 7 {
            cell?.detailTextLabel?.text = currentSchool?.applicationDeadline
        } else if indexPath.row == 8 {
            cell?.detailTextLabel?.text = currentSchool?.in_state
        } else if indexPath.row == 9 {
            cell?.detailTextLabel?.text = currentSchool?.out_state
        } else if indexPath.row == 10 {
            cell?.detailTextLabel?.text = currentSchool?.tuition
        } else if indexPath.row == 11 {
            cell?.detailTextLabel?.text = currentSchool?.room
        } else if indexPath.row == 12 {
            cell?.detailTextLabel?.text = currentSchool?.book
        } else if indexPath.row == 13 {
            cell?.detailTextLabel?.text = currentSchool?.undergraduate
        } else if indexPath.row == 14 {
            cell?.detailTextLabel?.text = currentSchool?.category
        } else if indexPath.row == 15 {
            cell?.detailTextLabel?.text = currentSchool?.setting
        } else if indexPath.row == 16 {
            cell?.detailTextLabel?.text = currentSchool?.student_faculty
        }
        

        return cell!
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 85
        } else if indexPath.row == 1 {
            return 85
        } else if indexPath.row == 2 {
            return 85
        } else if indexPath.row == 3 {
            return 85
        } else if indexPath.row == 4 {
            return 85
        } else if indexPath.row == 5 {
            return 85
        } else if indexPath.row == 6 {
            return 85
        } else if indexPath.row == 7 {
            return 85
        } else if indexPath.row == 8 {
            return 85
        } else if indexPath.row == 9 {
            return 85
        } else if indexPath.row == 10 {
            return 85
        } else if indexPath.row == 11 {
            return 85
        } else if indexPath.row == 12 {
            return 85
        } else if indexPath.row == 13 {
            return 85
        } else if indexPath.row == 14 {
            return 85
        } else if indexPath.row == 15 {
            return 85
        } else if indexPath.row == 16 {
            return 85
        } else if indexPath.row == 17 {
            return 85
        }
        
        return 85
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath){
        cell.layer.transform=CATransform3DMakeScale(0.1, 0.1, 1)
        UIView.animateWithDuration(0.25, animations: {
            cell.layer.transform=CATransform3DMakeScale(1, 1, 1)
        })
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSchoolStreetView" {
            let viewController = segue.destinationViewController as SchoolStreetViewController
            viewController.currentSchool = currentSchool
            
        }
        
    }
}
