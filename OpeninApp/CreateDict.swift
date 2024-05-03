//
//  CreateDict.swift
//  OpeninApp
//
//  Created by Shomil Singh on 02/05/24.
//

import Foundation
import SwiftUI

func createDic(response: Response, dic: inout [Date: Int] , dates : inout [Date]) {
    for link in response.data.recent_links {
        let formattedDate = dateToString(date: link.created_at)
        dic[formattedDate] = link.total_clicks
        dates.append(formattedDate)
    }
    
    for link in response.data.top_links {
        let formattedDate = dateToString(date: link.created_at)
        dic[formattedDate] = link.total_clicks
        dates.append(formattedDate)
    }
}

    func dateToString(date : String)-> Date{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//        dateFormatter.
        if let date = dateFormatter.date(from: date) {
            return date
        } else {
            print("Error parsing date")
        }
        return Date.now
    }

