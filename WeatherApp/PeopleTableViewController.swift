//
//  PeopleTableViewController.swift
//  WeatherApp
//
//  Created by amnah alhwaiml on 24/05/1443 AH.
//

import UIKit

class PeopleTableViewController: UITableViewController {
    var people : [String]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
       

            JsonStuff.getAllPeople(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
                        data, response, error in
                            do {
                                // Try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                                    if let results = jsonResult["results"] as? NSArray {
                                        for person in results {
                                            let personDict = person as! NSDictionary
                                            self.people?.append(personDict["name"]! as! String)
                                        }
                                    }
                                }
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                            } catch {
                                print("Something went wrong")
                            }
                    })
        
        tableView.dataSource = self
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people?.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath)
        cell.textLabel?.text = people?[indexPath.row] ?? ""

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
