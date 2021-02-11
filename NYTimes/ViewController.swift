//
//  ViewController.swift
//  NYTimes
//
//  Created by Максим Нечеперунко on 11.02.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var titileName = ""
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
    
    
    @IBAction func addToFavorite(_ sender: Any) {
        guard let entity = NSEntityDescription.entity(forEntityName: "Article", in: context) else {return}
        
        let articleObject = Article(entity: entity, insertInto: context)
        articleObject.title = titileName
        do {
            try context.save()
            
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
        
    }
}

