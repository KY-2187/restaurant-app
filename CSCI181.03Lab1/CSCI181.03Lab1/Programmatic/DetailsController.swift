//
//  DetailsController.swift
//  CSCI181.03Lab1
//
//  Created by Kyra Hung on 2/22/23.
//

import UIKit

class DetailsController: UIViewController {
    var restaurant: Restaurant?

    @IBOutlet weak var restaurantImage: UIImageView!
    
    @IBOutlet weak var restaurantLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImage.image = UIImage(named: restaurant?.imageName ?? "kFc")
        restaurantLabel.text = restaurant?.name
    }
}
