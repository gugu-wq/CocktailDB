//
//  DrinkViewController.swift
//  CocktailDB
//
//  Created by Gugu Ndaba on 2021/07/18.
//

import UIKit

/*extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}*/

extension UIImageView
{
    func fetchUIImage(from url: URL, contentMode mode: ContentMode = .scaleToFill) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func imageDownload(from link: String, contentMode mode: ContentMode = .scaleToFill) {
        guard let url = URL(string: link) else { return }
        fetchUIImage(from: url, contentMode: mode)
    }
}

class DrinkViewController: UIViewController {
    
    @IBOutlet weak var cocktailLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var imageViewLabel: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var drink: DrinkInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        idLabel.text = drink?.idDrink
        nameLabel.text = drink?.strDrink
        
        let urlString = (drink?.strDrinkThumb)!
        //let url = URL(string: urlString)
        
        imageViewLabel.imageDownload(from: urlString)
        imageViewLabel.layer.cornerRadius = imageViewLabel.frame.size.width/2
        imageViewLabel.clipsToBounds = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
