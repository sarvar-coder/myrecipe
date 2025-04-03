//
//  File.swift
//  MyRecipes
//
//  Created by Sarvar Boltaboyev on 03/04/25.
//

import Foundation
import UIKit
import CoreData

class FavouritesViewController: UIViewController {
    
    let tableView = UITableView()
    var managedObjectContext: NSManagedObjectContext!
    
    lazy var fetchResultsController: NSFetchedResultsController<FavouriteRecipe> = {
        let fetchRequest = NSFetchRequest<FavouriteRecipe>(entityName: "FavouriteRecipe")
        
        let sort1 = NSSortDescriptor(key: "name", ascending: true)
//        let sort2 = NSSortDescriptor(key: "category", ascending: true)
        fetchRequest.sortDescriptors = [sort1]
        
        fetchRequest.fetchBatchSize = 20
        
        let fetchResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: managedObjectContext,
            sectionNameKeyPath: nil,
            cacheName: "FavouriteRecipe")
        
        fetchResultsController.delegate = self
        return fetchResultsController
    }()
    
    deinit {
        fetchResultsController.delegate = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        performFectch()
    }
    
    func style() {
        title = "Favourites"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}

// MARK: - Table View Delegate and Data Source
extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return fetchResultsController.sections?.count ?? 0
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchResultsController.sections?[section]
        return sectionInfo?.numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        var content = cell.defaultContentConfiguration()
        
        content.text = fetchResultsController.object(at: indexPath).name
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        let sectionInfo = fetchResultsController.sections?[section]
//        return sectionInfo?.name
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let recipe = fetchResultsController.object(at: indexPath)
        let favRecipeView = FavouriteRecipeView(recipe: recipe)
        present(favRecipeView, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, 
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favrecipe = fetchResultsController.object(at: indexPath)
            managedObjectContext.delete(favrecipe)
            do {
                try managedObjectContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
// MARK: - Fetch Results Controller Delegate
extension FavouritesViewController: NSFetchedResultsControllerDelegate {
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("*** controllerWillChangeContent")
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, 
                    didChange anObject: Any,
                    at indexPath: IndexPath?,
                    for type: NSFetchedResultsChangeType,
                    newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            print("Inserting foo")
            tableView.insertRows(at: [indexPath!], with: .bottom)
        case .delete:
            print("deleting foo")            
            tableView.deleteRows(at: [indexPath!], with: .right)
        case .move:
            tableView.deleteRows(at: [indexPath!], with: .fade)
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .update:
            print("in my context is needless foo")
        @unknown default:
            print("Unknown type foo")
        }
    }
    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, 
//                    didChange sectionInfo: NSFetchedResultsSectionInfo,
//                    atSectionIndex sectionIndex: Int,
//                    for type: NSFetchedResultsChangeType) {
//        switch type {
//        case .insert:
//            let indexSet = IndexSet(integer: sectionIndex)
//            tableView.insertSections(indexSet, with: .automatic)
//        case .delete:
//            let indexSet = IndexSet(integer: sectionIndex)
//            tableView.deleteSections(indexSet, with: .automatic)
//        case .move:
//            print("moving")
//        case .update:
//            print("updating")
//        @unknown default:
//            print("unknown foo")
//        }
//    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        print("ending of update foo")
        tableView.endUpdates()
    }
}

// MARK: - Helper Functions

extension FavouritesViewController {
    private func performFectch() {
        do {
            try fetchResultsController.performFetch()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
