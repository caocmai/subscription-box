//
//  ViewController.swift
//  tableViewXib
//
//  Created by Cao Mai on 2/10/20.
//  Copyright © 2020 Make School. All rights reserved.
//

import UIKit

class ListOfBoxesVC: UIViewController{
    

//    let treeArray : [String] = ["Hello 1", "Hello2"]
    
    var testBoxes = [Box]()

    let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTable()
        getData()
//        self.navigationItem.title = "BOXES"
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
    
    func getData() {
        let box = Box(date: "MAR", items:[], image: "test2")
        testBoxes.append(box)
        let box2 = Box(date: "FEB", items:[], image: "test1")
        testBoxes.append(box2)
        let box3 = Box(date: "JAN", items:[], image: "test1")
        testBoxes.append(box3)
        
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
        return testBoxes.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellStuff", for: indexPath) as! TableViewCellStuff
//        cell.textLabel?.text = "\(indexPath.row) \(testBoxes[indexPath.row].date)"
        cell.setContents(box:testBoxes[indexPath.row])
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


class PopulateTable: UIView {
    
    var message: String!
    var imageName: String!
    var color: UIColor!
    
    
    required init(message: String, imageName: String, color: UIColor) {
        super.init(frame: .zero)
        self.message = message
        self.imageName = imageName
        self.color = color
        self.setup()
    }
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        return stackView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 20)
        label.textColor = UIColor(white: 1.0, alpha: 0.8)
        return label
    }()
    
    let continueButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(UIColor.orange, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.backgroundColor = UIColor(white: 1.0, alpha: 0.9)
        return button
    }()
    
   
    
    //Required, just because
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    //Required, just becase
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        self.backgroundColor = color
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(messageLabel)
        
        stackView.widthAnchor.constraint(equalTo: self.layoutMarginsGuide.widthAnchor, multiplier: 0.65).isActive = true
        stackView.heightAnchor.constraint(equalTo: self.layoutMarginsGuide.heightAnchor, multiplier: 0.5).isActive = true
        stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        imageView.image = UIImage(named: self.imageName)
        // Not needed
//        self.addSubview(imageView)
        //Give it a height so stackview knows how to divide
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.6).isActive = true
        // Not needed
//        self.addSubview(messageLabel)
        messageLabel.text = message
    }
    


}
