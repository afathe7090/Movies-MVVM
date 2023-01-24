//
//  UITableView+Extenstion.swift
//  Movies
//
//  Created by Ahmed Fathy on 22/01/2023.
//

import UIKit
extension UITableView {
    func registerNib<Cell: UITableViewCell>(cell: Cell.Type) {
        let identifier = String(describing: Cell.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    func registerClass<Cell: UITableViewCell>(cell: Cell.Type) {
        let identifier = String(describing: Cell.self)
        self.register(Cell.self, forCellReuseIdentifier: identifier)
    }
    
    func dequeueCell<Cell: UITableViewCell>(cell: Cell.Type, indexPath: IndexPath) -> Cell {
        let identifier = String(describing: Cell.self)
        return dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? Cell ?? .init()
    }
}
