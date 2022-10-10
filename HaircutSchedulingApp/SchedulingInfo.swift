//
//  SchedulingInfo.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//

import Foundation
import UIKit

var scheduledAppointments = [appointments] ()
var datesScheduled = [Date] ()
var verifiedAppointments = [appointments] ()
class appointments
{
    var time: Date
    var questions: String
    var name: String
    
    init(date: Date, questions: String, name: String)
    {
        self.name = name
        self.questions = questions
        self.time = date
    }
}
