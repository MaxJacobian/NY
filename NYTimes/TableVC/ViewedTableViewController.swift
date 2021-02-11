//
//  ViewedTableViewController.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import UIKit

class ViewedTableViewController: UITableViewController, SendDataProtocol {
   
    
    
    var viewed: PurpleData?
    override func viewDidLoad() {
        super.viewDidLoad()
        let loaded = LoadedData()
        loaded.delegate = self
        loaded.loadedViewed()
       
    }
    func sendData(data: PurpleData) {
        viewed = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) {
            guard segue.identifier == "Viewed" else { return }
            guard let vc = segue.destination as? ViewController else { return }
            
            DispatchQueue.main.async {
                vc.titileName = self.viewed?.results[index.row].title ?? ""
                vc.titleLabel?.text = self.viewed?.results[index.row].title ?? ""
            }
        }
    }

    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewed?.results.count ?? 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Viewed", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(viewed?.results[indexPath.row].title ?? "")"

        return cell
    }
   

   

}
