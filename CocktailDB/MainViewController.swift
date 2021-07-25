//
//  MainViewController.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/25.
// Test Commit after clone

import Foundation
//
//  ViewController.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/18.
//

import UIKit

class MainViewController: UIViewController //UITableViewDelegate, UITableViewDataSource

{
    
    @IBAction func CocktailPressed(_ sender: Any) {
        performSegue(withIdentifier: "showDetails", sender: sender)
    }
    @IBAction func OrdinaryPressed(_ sender: Any) {
        performSegue(withIdentifier: "showDetails", sender: sender)
    }
    @IBOutlet weak var cocktailButton: UIButton!
    @IBOutlet weak var ordinaryButton: UIButton!

    var choice = ""
    var drinks = [DrinkInfo]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let destination = segue.destination as? ViewController
            //choice = "cocktail"
           // choice = "ordinary"
            destination?.chosenCocktail = choice
            
           if let sender = ordinaryButton {
                choice = "ordinary"
                destination?.chosenCocktail = choice
            }
            if let sender = cocktailButton {
                choice = "cocktail"
                destination?.chosenCocktail = choice
            }
                
                
            }
    }
    

    }



