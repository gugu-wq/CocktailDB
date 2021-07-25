//
//  DrinkCell.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/18.
//

import UIKit

class DrinkCell: UITableViewCell {
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkTitleLabel: UILabel!
    
    var drink: DrinkInfo?
    
    func setDrink(drink: DrinkInfo) {
        //let data = NSData(contentsOf: NSURL(string: "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg/preview")! as URL)
        //drinkImageView.image = UIImage(data: data! as Data)
        
        drinkTitleLabel.text = drink.strDrink
        drinkImageView.layer.cornerRadius = drinkImageView.frame.size.width/2
    }

}
