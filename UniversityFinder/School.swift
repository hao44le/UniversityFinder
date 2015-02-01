//
//  School.swift
//  FrostedSidebar
//
//  Created by Gelei Chen on 15/1/19.
//  Copyright (c) 2015年 Evan Dekhayser. All rights reserved.
//

import Foundation


import UIKit

class School: NSObject {
    var name: String
    var logoURL : NSString?
    var location: NSString?
    var info: NSString?
    var applicationDeadline: NSString?
    var percentOfAdmitted: NSString?
    var SATT : NSString?
    var SATR: NSString?
    var SATM: NSString?
    var ACTC: NSString?
    var ACTE: NSString?
    var ACTM: NSString?
    var tuition: NSString?
    var in_state: NSString?
    var out_state: NSString?
    var room: NSString?
    var book: NSString?
    var undergraduate: NSString?
    var category: NSString?
    var setting: NSString?
    var student_faculty: NSString?
    var percentOfWomen: NSString?
    var longitude : Double
    var latitude : Double
    var ranking : NSString?
    var score : NSString?
    
    init(name: String,logoURL:NSString,location: NSString, info:NSString,applicationDeadline: NSString, percentOfAdmitted : NSString,SATT:NSString,SATR: NSString,SATM: NSString,ACTC: NSString,ACTE: NSString,ACTM: NSString,tuition: NSString,in_state: NSString,out_state: NSString,room: NSString,book: NSString,undergraduate: NSString,category: NSString,setting: NSString,student_faculty: NSString,percentOfWomen: NSString,latitude:Double,longitude:Double) {
        self.name = name
        self.logoURL = logoURL
        self.location = location
        self.info = info
        self.applicationDeadline = applicationDeadline
        self.percentOfAdmitted = percentOfAdmitted
        self.SATT = SATT
        self.SATR = SATR
        self.SATM = SATM
        self.ACTC = ACTC
        self.ACTE = ACTE
        self.ACTM = ACTM
        self.tuition = tuition
        self.in_state = in_state
        self.out_state = out_state
        self.room = room
        self.book = book
        self.undergraduate = undergraduate
        self.category = category
        self.setting = setting
        self.student_faculty = student_faculty
        self.percentOfWomen = percentOfWomen
        self.longitude = longitude
        self.latitude = latitude
    }
    init(name:String,ranking:NSString,score:NSString){
        self.name = name
        self.ranking = ranking
        self.score = score
        self.longitude = 0
        self.latitude = 0
    }
    
        
}


