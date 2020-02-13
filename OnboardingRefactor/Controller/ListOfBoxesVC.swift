//
//  ViewController.swift
//  tableViewXib
//
//  Created by Cao Mai on 2/10/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ListOfBoxesVC: UIViewController{

    let treeArray = [String](repeating: "🌳 planted", count: 10)

    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        // Do any additional setup after loading the view.
    }

    func setTable() {
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self

        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.register(UINib(nibName: "TableViewCellStuff", bundle: nil), forCellReuseIdentifier: "TableViewCellStuff")

    }

}

//extension ListOfBoxesVC: UITableViewDelegate, UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return treeArray.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellStuff", for: indexPath)
//        cell.textLabel?.text = "\(indexPath.row) \(treeArray[indexPath.row])"
//        return cell
//    }
//
//}


extension ListOfBoxesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return treeArray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellStuff", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(treeArray[indexPath.row])"
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Hello", message: "You've tapped in the \(indexPath.row) row, from section \(indexPath.section)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "GO AWAY", style: UIAlertAction.Style.default) {
                UIAlertAction in
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    
}

