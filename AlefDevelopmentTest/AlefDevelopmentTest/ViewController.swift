//
//  ViewController.swift
//  AlefDevelopmentTest
//
//  Created by Женя  on 9.03.22.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var listTableView: UITableView!
    
    
    var childrenArray: [String] = []
    
    var childrenCount = "Child"

    var score = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTitle()
        setTableView()
    }
    
    
    private func setTitle() {
        title = "Персональные данные"
       navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    func reload() {
        listTableView.reloadData()
    }
    
    @IBAction func addChild(_ sender: Any) {
        childrenArray.append(childrenCount + String(score))
        score += 1
        listTableView.reloadData()
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childrenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 184
    }
}




