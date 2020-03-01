//
//  ListOfBoxes.swift
//  OnboardingRefactor
//
//  Created by Cao Mai on 2/6/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ListOfBoxes: UIViewController {
    
    
    var allBoxes = [Box]()
    
    //should be equalent to : [Box] = []
    
    
    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 100
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PAST BOXES"
        
        setTable()
        getData()
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
        let mangoteen = Item(name: "Mangosteens", image: "mangosteen")
        let dragonFruit = Item(name: "Dragonfruit", image: "dragon")
        let starFruit = Item(name: "Starfruit", image: "starfruit")
        let lychee = Item(name: "Lychee", image: "lychee")
        
        let box = Box(date: "January 2020", items:[mangoteen, dragonFruit, starFruit, lychee, lychee, lychee, lychee], image: "box")
        allBoxes.append(box)
        let box2 = Box(date: "December 2019", items:[mangoteen, starFruit, starFruit, lychee, dragonFruit], image: "box")
        allBoxes.append(box2)
        let box3 = Box(date: "October 2019", items:[starFruit, dragonFruit, mangoteen], image: "box")
        allBoxes.append(box3)
        
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
        return allBoxes.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BoxCell", for: indexPath) as! BoxCell
        //        cell.textLabel?.text = "\(indexPath.row) \(allBoxes[indexPath.row].date)"
        cell.setContents(box: allBoxes[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = OneBoxVC()
        nextVC.currentBox = allBoxes[indexPath.row]
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}
