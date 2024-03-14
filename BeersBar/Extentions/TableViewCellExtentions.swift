//
//  TableViewCellExtentions.swift
//  BeersBar
//
//  Created by Balashekar Vemula on 17/02/24.
//

import Foundation
import UIKit
extension UITableViewCell{
    static var nib:UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var identifier:String{
        return String(describing: self)
    }
}
