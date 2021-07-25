//
//  ViewController.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/18.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    
    var drinks = [DrinkInfo]()
    var chosenCocktail:String?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated:Bool) {
        super.viewWillAppear(animated)
       if chosenCocktail == "cocktail"
        {
            downloadCocktailsJSON {
                self.tableView.reloadData()
            }
        }else {
            downloadOrdinaryDrinksJSON {
                self.tableView.reloadData()
            }
        }

        tableView.delegate = self   /*-------CHECK THAT!--------*/
        tableView.dataSource = self /*-------CHECK THAT!--------*/
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let drink = drinks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrinkCell", for: indexPath) as! DrinkCell
        
        //cell.setDrink(drink: drink)
        cell.drinkTitleLabel.text = drinks[indexPath.row].strDrink
        cell.drinkImageView.imageDownload(from: (drinks[indexPath.row].strDrinkThumb))
        
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }*/
    
    
    func downloadOrdinaryDrinksJSON(completed: @escaping () -> ())
        {
        
        //print("The Query URL is: \(queryURL)")
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Ordinary_Drink")!
            let urlSession = URLSession.shared
            let urlRequest = URLRequest(url: url)

            let task = urlSession.dataTask(with: urlRequest)
            {
                data, urlResponse, error in
                
                if let error = error
                {
                    
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let unwrappedData = data else
                {
                    print("No data")
                    return
                }
                
                
                let jsonDecoder = JSONDecoder()

            do
            {
                self.drinks = try jsonDecoder.decode(AllDrinks.self, from: unwrappedData).drinks
                    DispatchQueue.main.async
                    {
                        completed()
                    }
                } catch {
                    print(error)
                }
            }.resume()
        
        }
    
    func downloadCocktailsJSON(completed: @escaping () -> ())
        {
        
        //print("The Query URL is: \(queryURL)")
        let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")!
            let urlSession = URLSession.shared
            let urlRequest = URLRequest(url: url)

            let task = urlSession.dataTask(with: urlRequest)
            {
                data, urlResponse, error in
                
                if let error = error
                {
                    
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let unwrappedData = data else
                {
                    print("No data")
                    return
                }
                
                
                let jsonDecoder = JSONDecoder()

            do
            {
                self.drinks = try jsonDecoder.decode(AllDrinks.self, from: unwrappedData).drinks
                    DispatchQueue.main.async
                    {
                        completed()
                    }
                } catch {
                    print(error)
                }
            }.resume()
        
        }
    
    /*func downloadCocktailsJSON(completed: @escaping () -> ()) {

            let url = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail")!
            let urlSession = URLSession.shared
            let urlRequest = URLRequest(url: url)
            
            let task = urlSession.dataTask(with: urlRequest) { data, urlResponse, error in
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                guard let unwrappedData = data else {
                    print("No data")
                    return
                }
                
                let jsonDecoder = JSONDecoder()
                do
                {
                    self.drinks = try? jsonDecoder.decode(AllDrinks.self, from: unwrappedData).drinks else
                    {
                        print("JSON Error")
                        return
                    }
                    
                    //print(drinkList)
                   // drinks = drinkList
                    print("Success")
                }
            }
            
            task.resume()
    }*/
}


