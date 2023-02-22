//
//  ViewController.swift
//  CSCI181.03Lab1
//
//  Created by Kyra Hung on 2/22/23.
//

import UIKit

struct Restaurant {
    var imageName: String
    var name: String
}

class ViewController: UITableViewController {
    
    private static let reuseIdentifier = "food"
    
    var restaurants = [
        Restaurant(imageName: "jollibeeImage", name: "Jolibee"),
        Restaurant(imageName: "mcdoPic", name: "McDonald's"),
        Restaurant(imageName: "Wendys", name: "Wendy's"),
        Restaurant(imageName: "tacoBelll", name: "Taco Bell"),
        Restaurant(imageName: "kFc", name: "KFC"),
        Restaurant(imageName: "burgerKing", name: "Burger King"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            TableViewCell.self,
            forCellReuseIdentifier: ViewController.reuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.reuseIdentifier, for: indexPath) as? TableViewCell
        else {
            return UITableViewCell()
        }
        
        let restaurant = restaurants[indexPath.row]
        cell.restaurantName.text = restaurant.name
        cell.restaurantImageView.image = UIImage(named: restaurant.imageName)
        return cell
    }
    
    /**
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let restaurant = restaurants[indexPath.row]
        goToDetailsViewController(restaurant: restaurant)
    }
    
    func goToDetailsViewController(restuarant: Restaurant) {
        let storyboard = UIStoryboard(name: "DetailsViewController", bundle: nil)
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "detailsVCIdentifier") as? DetailsViewController else {return}
        detailsViewController.restuarant = restaurant
    }
     */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }


}

