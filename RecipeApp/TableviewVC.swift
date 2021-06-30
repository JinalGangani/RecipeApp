//
//  TableviewVC.swift
//  RecipeApp
//
//  Created by DCS on 29/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class TableviewVC: UIViewController {

    var tableView = UITableView()
    var recipeArr = ["Green Pesto Vegitable Soup",
                     "Vegetarian Wonton Soup Indian Chinese",
                     "easy vegetable soup",
                     "Homemade-Vegetable-Soup-Recipe-2-1200",
                     "chicken-soup-recipe-3",
                     "Vegetable-Soup-2",
                     "Healthy-Vegetarian-Cabbage-Soup-Recipe"]
    var recipeDesc = [
                      "1 Small White Onion (chopped), 2 Cups Zucchini (about one med. zucchini, chopped,2-3 Large Stalks Celery (chopped),Olive Oil (for sautéing),4 Cups Vegetable Stock",
                      "8-10 Momos , only filled and shaped, not steamed,1 clove Garlic , finely chopped,1 inch Ginger , grated,1 or 2 Green Chillies , finely chopped, 2 to 3 Spring Onion (Bulb & Greens) , finely chopped with leaves",
                      "1 onion (finely chopped),2 carrots (peeled and chopped),1 celery stick (finely chopped),2 small leeks (finely chopped),2 garlic cloves (crushed)",
                      "3 tablespoons olive oil 2 cups chopped onion (1 medium)  1/2 cups chopped carrot (3 to 4 carrots), 1/2 cups chopped celery (2 to 3 stalks) 2 tablespoons tomato paste",
                      "Creamy Chicken Soup Recipe – Nutritious, easy and big on flavor, this delicious chicken pasta soup",
                      "1/4 cup olive oil,1 yellow onion (, diced),2 stalks celery (, diced),2 cloves garlic (, minced),2 teaspoons kosher salt",
                      "1 tablespoon olive oil,1 medium white onion, peeled and diced,6 cloves garlic, peeled and minced,6 cups vegetable stock, 2 medium carrots, diced"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Recipes"
        setTableView()
        view.backgroundColor = UIColor.white
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setTableView(){
        tableView.frame = self.view.frame
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.clear
        self.view.addSubview(tableView)
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    
    
}


extension TableviewVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.userImage.image = UIImage(named: recipeArr[indexPath.row])
        cell.namelbl.text = recipeArr[indexPath.row]
        //        cell.descriptionlbl.text = recipeDesc[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = DetailVCViewController()
        vc.desc = recipeDesc[indexPath.row]
        vc.image = UIImage(named: recipeArr[indexPath.row])!
        vc.lbl = recipeArr[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        let ip = tableView.indexPathForSelectedRow
    //        let dvc = segue.destination as! DetailVCViewController
    //        dvc.image = UIImage(named: recipeArr[ip!.row])!
    //        dvc.lbl = recipeArr[(ip?.row)!]
    //    }


