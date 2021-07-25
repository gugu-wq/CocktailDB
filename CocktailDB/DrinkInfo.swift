//
//  DrinkInfo.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/18.
//

import Foundation
import UIKit

struct DrinkInfo: Decodable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
}

enum CodingKeys: String, CodingKey {
    case strDrink, strDrinkThumb, idDrink
}

struct AllDrinks: Decodable {
    let drinks: [DrinkInfo]
}


