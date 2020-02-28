//
//  ListOfBoxes.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/6/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ListOfBoxes: UIViewController {
    
    
    var testBoxes = [Box]()
    
    //should be equalent to : [Box] = []


    let table: UITableView = {
       let table = UITableView()
       table.translatesAutoresizingMaskIntoConstraints = false
       table.rowHeight = 100
        // Can move to here instead of in the setup function

       return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PAST BOXES"

        setTable()
        getData()
        

        // Do any additional setup after loading the view.
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
    
    func getData() {
        let box = Box(date: "January 2020", items:[], image: "box")
        testBoxes.append(box)
        let box2 = Box(date: "December 2019", items:[], image: "box")
        testBoxes.append(box2)
        let box3 = Box(date: "October 2019", items:[], image: "box")
        testBoxes.append(box3)

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
        return testBoxes.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath) as! BoxCell
//        cell.textLabel?.text = "\(indexPath.row) \(testBoxes[indexPath.row].date)"
        cell.setContents(box: testBoxes[indexPath.row])

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
