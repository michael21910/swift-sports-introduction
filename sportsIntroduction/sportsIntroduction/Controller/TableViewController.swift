//
//  TableViewController.swift
//  foodpin
//
//  Created by Tsuen Hsueh on 2021/11/1.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet weak var prefer: UILabel!
    var sports:[Sport] = []
    let color = UIColor(red: 133/255, green: 107/255, blue: 90/255, alpha: 1.0)
    
    //MARK: - UITableView Life Cycle
    
    lazy var dataSource = configureDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize restaurant array
        Sport.generateData( sourceArray: &sports )
        
        tableView.dataSource = dataSource
        
        //Create the snapshot
        var snapshot = NSDiffableDataSourceSnapshot<Section, Sport>()
        snapshot.appendSections([.all])
        snapshot.appendItems(sports, toSection: .all)
        
        dataSource.apply(snapshot, animatingDifferences: false)
        // set navigation bar font title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        prefer.numberOfLines = 0
        prefer.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    // MARK: - UITableView Diffable Data Source
    
    func configureDataSource() -> DiffableDataSource {
        let cellIdentifier = "datacell"
        
        let dataSource = DiffableDataSource (
            tableView: tableView,
            cellProvider: {  tableView, indexPath, sport in
                let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
                
                cell.nameLabel?.text = sport.name
                cell.thumbnailImageView?.image = UIImage(named: sport.image)
                cell.competition?.text = sport.competition
                cell.desc?.text = sport.players
                cell.accessoryType = sport.isFavorite ? .checkmark : .none
                
                var addingSports: String = ""
                var counter: Int = 0
                for sport in self.sports {
                    if(sport.isFavorite == true) {
                        addingSports += sport.name + " "
                        counter += 1
                    }
                }
                if(counter > 0) {
                    cell.prefer?.text = "I like: " + addingSports
                }
                else {
                    cell.prefer?.text = "You don't like any sports!"
                }
                
                return cell
            }
        )
        return dataSource
    }
    
    //MARK: - swipe to right action / leading swipe
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Mark as favorite action
        let favoriteAction = UIContextualAction(style: .destructive, title: "") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            //update source array
            self.sports[indexPath.row].isFavorite = false
            
            //update data source of the tableview
            var snapshot = NSDiffableDataSourceSnapshot<Section, Sport>()
            snapshot.appendSections([.all])
            snapshot.appendItems(self.sports, toSection: .all)
            self.dataSource.apply(snapshot, animatingDifferences: false)
            
            //update cell
            cell.accessoryType = self.sports[indexPath.row].isFavorite ? .checkmark : .none
            
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        // Change the action's color and icon
        favoriteAction.backgroundColor = color
        favoriteAction.image = UIImage(systemName: "heart.slash.fill")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
        
        return swipeConfiguration
    }
    
    //MARK: - swipe to left action / trailing swipe
    
    //delete causes the constraint problem: top margin priority to 750
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // Mark as favorite action
        let favoriteAction = UIContextualAction(style: .destructive, title: "") { (action, sourceView, completionHandler) in
            
            let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
            //update source array
            self.sports[indexPath.row].isFavorite = true
            
            //update data source of the tableview
            var snapshot = NSDiffableDataSourceSnapshot<Section, Sport>()
            snapshot.appendSections([.all])
            snapshot.appendItems(self.sports, toSection: .all)
            self.dataSource.apply(snapshot, animatingDifferences: false)
            
            //update cell
            cell.accessoryType = self.sports[indexPath.row].isFavorite ? .checkmark : .none
            
            
            // Call completion handler to dismiss the action button
            completionHandler(true)
        }
        
        // Change the action's color and icon
        favoriteAction.backgroundColor = color
        favoriteAction.image = UIImage(systemName: "heart.fill")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [favoriteAction])
        
        return swipeConfiguration
        
    }
    
    //MARK: - for segue function
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                destinationController.sportImageName = sports[indexPath.row].poster
            }
        }
    }
    
}
