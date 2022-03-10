//
//  TableViewCell.swift
//  AlefDevelopmentTest
//
//  Created by Женя  on 9.03.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController else { return }
        
        
        print("delete")
        
        
    }
    
}
