//
//  UIViewController+Alert.swift
//  HarryPotterSeries
//
//  Created by 곽다은 on 3/28/25.
//

import UIKit

extension UIViewController {
    func showAlert(title: String,
                    message: String,
                    actionTitle: String = AlertActionTitle.check) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: actionTitle, style: .default))
        present(alert, animated: true)
    }
}
