//
//  TableViewCell.swift
//  AlefDevelopmentTest
//
//  Created by Женя  on 9.03.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    var deleteDelegate: DeleteRowDelegate?
    var indexPath: IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    
    @IBAction func deleteButton(_ sender: UIButton) {
        if deleteDelegate != nil, let indexPath = indexPath {
            deleteDelegate!.deleteRowForIndex(at: indexPath)
        }
        print("delete")
    }
    
}
