//
//  SecondViewController.swift
//  AubreesPizza
//
//  Created by Nate Schreiner on 2/4/18.
//  Copyright © 2018 Nate Schreiner. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellDescripters: [[String]]!
    
    let menu_titles = ["Appetizers", "Salads","Entrees" , "Sandwiches", "Burgers", "Calzones and Rolls","Specialty Pizzas", "Traditional Pizzas", "Desserts", "Gluten Friendly"]
    
    
    @IBOutlet var MenuView: UITableView! {
        didSet {
            MenuView.dataSource = self
            MenuView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        loadCellDescripters()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        printDictionary()
        MenuView.reloadData()
    }
    
    func printDictionary() {
       /*
        *  METHOD IS USED FOR DEBUGGING PURPOSES
        */
    }
    
    func loadCellDescripters() {
        if let path = Bundle.main.path(forResource: "CellDescriptor", ofType: "plist") {
            cellDescripters = NSMutableArray(contentsOfFile: path) as! [[String]]
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return menu_titles[section]
    }
    
    func tableView(_ MenuView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows: Int = cellDescripters[section].count
        return rows
    }
    
    func tableView(_ MenuView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuView.dequeueReusableCell(withIdentifier: "MenuItem", for: indexPath)
        cell.textLabel?.text = cellDescripters[indexPath.section][indexPath.row]
        return cell
    }
    
    func numberOfSections(in MenuView: UITableView) -> Int {
        return menu_titles.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("im here atleast")
        print(indexPath.row)
        
    }

    
}
