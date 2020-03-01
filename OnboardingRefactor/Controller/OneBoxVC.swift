//
//  OneBoxVC.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/28/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class OneBoxVC: UIViewController {
    
    var currentBox : Box!
    
    var fruitName : [String] = []
    var fruitImage : [String] = []

    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        // Can move to here instead of in the setup function
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = currentBox.date
        //        print("cuurentbox", currentBox!)
        setTable()
        getItems()
    }
    
    func setTable(){
        self.view.addSubview(table)
        view.backgroundColor = .white
        
        table.register(BoxCell.self, forCellReuseIdentifier: "BoxCell")
        
        
        // This has to be here though
        table.delegate = self
        table.dataSource = self
        
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
    
    func getItems() {
        
        let items = currentBox!.items
        print("itemsssssssssss", items)
        
        for item in items {
            fruitName.append(item.name)
            fruitImage.append(item.image)
            
        }
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

extension OneBoxVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentBox.items.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath) as! BoxCell
        
        cell.textLabel?.text = "\(fruitName[indexPath.row])"
        cell.imageView?.image = UIImage(named: "\(fruitImage[indexPath.row])")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alertController = UIAlertController(title: "Fruit Selected", message: "\(fruitName[indexPath.row])", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "COOL", style: UIAlertAction.Style.default) {
                UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
        
        print("Table cell is clicked")
    }
    
}
