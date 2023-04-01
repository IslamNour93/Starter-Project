//
//  Extensions.swift
//  Starter Project
//
//  Created by Islam NourEldin on 31/03/2023.
//

import UIKit


extension UIViewController{
    func showAlertError(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
