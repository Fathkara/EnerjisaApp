//
//  CustomAlert.swift
//  EnerjisaCase
//
//  Created by Fatih on 7.08.2023.
//

import UIKit
import UIKit

class Alert {
    static func showCustomAlert(title: String, message: String, viewController: UIViewController,alert:UITextField) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
 
