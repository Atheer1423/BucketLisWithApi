//
//  ViewController.swift
//  BucketLisWithApi
//
//  Created by admin on 27/12/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var dataArr : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskModel.getAllTasks() {
                   data, response, error in
        
            self.parseData(data:data!)
            }
    }
    
    func parseData(data: Data){
       do {
      
    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
           for task in json {
               dataArr.append(task["tasks"] as! String)
           }

               DispatchQueue.main.async {
                   self.tableView.reloadData()
               }

           }
           
      
    catch {
       print(error.localizedDescription)
   }
}
 
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         
        cell.textLabel?.text = dataArr[indexPath.row]
        
        return cell
    }


}

