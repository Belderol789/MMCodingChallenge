//
//  Extensions.swift
//  MMCodingChallenge
//
//  Created by Kem Bel on 11/17/21.
//

import Foundation
import UIKit

// MARK: - String
extension String {
    func asURL() -> URL? {
        return URL(string: self)
    }
    
    func asURLRequest() -> URLRequest? {
        guard let url = URL(string: self) else { return nil }
        return URLRequest(url: url)
    }
}

// MARK: - UIViewController
extension UIViewController {
    func showAlertWith(title: String? = nil, message: String? = nil, defaultBtnTitle: String, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultBtnTitle, style: .cancel, handler: nil)
        actions.forEach({
            alertController.addAction($0)
        })
        alertController.addAction(defaultAction) // add the default last so it shows up in the bottom of the alert
        self.present(alertController, animated: false, completion: nil)
    }
    
}

// MARK: - Reusability
protocol Reusable: AnyObject {
    static var className: String { get }
    static var nib: UINib { get }
}

extension Reusable {
    static var className: String {
        return "\(self)"
    }
    static var nib: UINib {
        return UINib(nibName: className, bundle: nil)
    }
}
