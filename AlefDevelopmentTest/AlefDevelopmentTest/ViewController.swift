//
//  ViewController.swift
//  AlefDevelopmentTest
//
//  Created by Женя  on 9.03.22.
//

import UIKit

protocol DeleteRowDelegate {
    func deleteRowForIndex(at indexPath: IndexPath)
}

class ViewController: UIViewController {
    
    //MARK: - Outlets
    
    @IBOutlet weak var listTableView: UITableView!
    
    @IBOutlet weak var addChildButton: UIButton!
    
    //MARK: - Property
    
    var childrenArray: [Children] = []
    
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    // MARK: - Logic
    private func setTableView() {
        listTableView.dataSource = self
        listTableView.delegate = self
        listTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
    
    private func viewDelete() {
        childrenArray.removeAll()
        listTableView.reloadData()
    }
    
    
    private func presentAlertController() {
        let alertController = UIAlertController(title: "Вы уверены, что хотите очистить список", message: nil, preferredStyle: .actionSheet)
        let alertClear = UIAlertAction(title: "Очистить", style: .default) { _ in
            self.viewDelete()
            self.addChildButton.isHidden = false
        }
        
        let alertCancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(alertClear)
        alertController.addAction(alertCancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    //MARK: - Button Action
    
    
    @IBAction func addChild(_ sender: Any) {
        
        let children = Children(name: nil, age: nil)
        
        childrenArray.append(children)
        listTableView.reloadData()
        
        if childrenArray.count == 5 {
            addChildButton.isHidden = true
        }
        
    }
    
    
    @IBAction func deleteAllList(_ sender: Any) {
        presentAlertController()
    }
    
    
    
}
// MARK: - Extensions UITableView

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childrenArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = listTableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else { return UITableViewCell() }
        
        cell.indexPath = indexPath
        cell.deleteDelegate = self
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}

extension ViewController: DeleteRowDelegate {
    func deleteRowForIndex(at indexPath: IndexPath) {
        childrenArray.remove(at: indexPath.row)
        listTableView.reloadData()
    }
}
