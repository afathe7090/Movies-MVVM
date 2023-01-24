//
//  NibBased.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import UIKit

protocol NibBased {
    
    // MARK: Static parameters
    static var nibName: String { get }
    
}
extension NibBased {
    
    // MARK: Static parameters
    
    static var nibName: String {
        String(describing: self)
    }
}
extension NibBased where Self: UIView {
    
    // MARK: Static functions
    static func instantiate(owner: Any? = nil) -> Self {
        let nib = UINib(nibName: nibName, bundle: nil)
        let items = nib.instantiate(withOwner: owner, options: nil)
        return (items.first! as? Self)!
    }
    
}

extension NibBased where Self: UIViewController {
    
    // MARK: Static functions
    
    static func instantiate() -> Self {
        Self.init(nibName: self.nibName, bundle: Bundle(for: self))
    }
    
}

extension NibBased where Self: UICollectionViewCell {
    
    // MARK: Static properties
    
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
    
}

extension NibBased where Self: UITableViewCell {
    
    // MARK: Static properties
    
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: nil)
    }
    
}
