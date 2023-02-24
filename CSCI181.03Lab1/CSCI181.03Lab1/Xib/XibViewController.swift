//
//  XibViewController.swift
//  CSCI181.03Lab1
//
//  Created by Kyra Hung on 2/24/23.
//

import UIKit

struct XibRestaurant {
    var imageName: String
    var name: String
}

class XibViewController: UITableViewController {
    
    private static let XibReuseIdentifier = "food"
    
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
            UINib(nibName: "XibTableViewCell", bundle: nil),
            forCellReuseIdentifier: XibViewController.XibReuseIdentifier
        )
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: XibViewController.XibReuseIdentifier, for: indexPath) as? XibTableViewCell
        else {
            return UITableViewCell()
        }
        
        let restaurant = restaurants[indexPath.row]
        cell.restaurantLabel.text = restaurant.name
        cell.restaurantImageView.image = UIImage(named: restaurant.imageName)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let restaurant = restaurants[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Details", bundle: nil)
        guard let detailsController = storyboard.instantiateViewController(withIdentifier: "details") as? DetailsController else {return}
        detailsController.restaurant = restaurant
        self.navigationController?.pushViewController(detailsController, animated: true)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }


}
