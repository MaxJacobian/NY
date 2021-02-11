//
//  FavoriteViewController.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import UIKit
import CoreData

class FavoriteViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
    
    var article: [Article] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        do {
            article = try context.fetch(fetchRequest)
            tableView.reloadData()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let index = tableView.indexPath(for: cell) {
            guard segue.identifier == "Second" else { return }
            guard let vc = segue.destination as? SecondViewController else { return }
            
            DispatchQueue.main.async {
                vc.textLabel.text = self.article[index.row].title ?? ""
                
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
        return article.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Favorite", for: indexPath)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = "\(article[indexPath.row].title ?? "")"
        
        
        return cell
    }
    
}

