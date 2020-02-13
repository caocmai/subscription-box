//
//  ListOfBoxes.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/6/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ListOfBoxes: UIViewController {
    
    let boxArray = [String](repeating: "boxes go here", count: 3)

    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 200
       return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()

        // Do any additional setup after loading the view.
    }
    
    func setTable(){
        self.view.addSubview(table)
        
        table.register(BoxCell.self, forCellReuseIdentifier: "BoxCell")

        table.delegate = self
        table.dataSource = self
        
        table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
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

extension ListOfBoxes: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boxArray.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row) \(boxArray[indexPath.row])"
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
    
}
