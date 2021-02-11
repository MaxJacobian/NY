//
//  EmailedViewController.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import UIKit

class EmailedViewController: UITableViewController, SendDataProtocol {
    
    var emailed: PurpleData?

    override func viewDidLoad() {
        super.viewDidLoad()
        let loader = LoadedData()
        loader.delegate = self
        loader.loadedEmailed()
    }
    func sendData(data: PurpleData) {
        emailed = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) {
            guard segue.identifier == "Emailed" else { return }
            guard let vc = segue.destination as? ViewController else { return }
            
            DispatchQueue.main.async {
                vc.titileName = self.emailed?.results[index.row].title ?? ""
                vc.titleLabel?.text = self.emailed?.results[index.row].title ?? ""
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
        return emailed?.results.count ?? 1
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Emailed", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(emailed?.results[indexPath.row].title ?? "")"
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
