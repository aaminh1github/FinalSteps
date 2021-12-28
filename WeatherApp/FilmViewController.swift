//
//  ViewController.swift
//  WeatherApp
//
//  Created by amnah alhwaiml on 23/05/1443 AH.
//

import UIKit

class FilmTableViewController: UITableViewController {
    var films : [Result]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
     
        JsonStuff.getAllFilms(completionHandler: { // passing what becomes "completionHandler" in the 'getAllPeople' function definition in StarWarsModel.swift
            data, response, error in
            guard let myData = data else { return }
            do{
                let decoder = JSONDecoder()
                let jsonResult = try decoder.decode(FilmModle.self, from: myData)

                self.films = jsonResult.results
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }catch{
                print(error)
            }
        })
        // Do any additional setup after loading the view.
    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return films?.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath)
        cell.textLabel?.text = films?[indexPath.row].title ?? ""

        return cell
    }

}







