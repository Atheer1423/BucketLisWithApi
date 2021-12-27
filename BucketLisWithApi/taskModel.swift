//
//  taskModel.swift
//  BucketLisWithApi
//
//  Created by admin on 27/12/2021.
//

import Foundation
class taskModel{
static func getAllTasks(completionHandler: @escaping(_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
    
    let url = URL(string: "http://127.0.0.1:8080/tasks")
    
       let session = URLSession.shared
       let task = session.dataTask(with: url!, completionHandler: completionHandler)
       task.resume()
   }
}
