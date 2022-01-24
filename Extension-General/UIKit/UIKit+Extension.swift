//
//  UIKit+Extension.swift
//  Extension-General
//
//  Created by hardip gajera on 25/01/22.
//

import UIKit

extension UIStoryboard {
    static let main = UIStoryboard(name: "Main", bundle: nil)
    
    func instantiateViewController<T: UIViewController>(_ viewControllerType: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: viewControllerType.self)) as? T else {
            fatalError("Unexpected view controller type for \(String(describing: viewControllerType.self))")
        }
        
        return viewController
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        let name = String(describing: cellType)
        let nib = UINib(nibName: name, bundle: nil)
        register(nib, forCellReuseIdentifier: name)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: cellType), for: indexPath) as? T else {
            fatalError("\(T.self) is expected to have reusable identifier: \(String(describing: cellType))")
        }
        
        return cell
    }
}

