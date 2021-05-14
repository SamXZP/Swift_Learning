//
//  Global.swift
//  Shared
//
//  Created by Sam on 2021/5/13.
//

import Foundation
import UIKit

extension UIWindow {
    static var keyWindow: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.filter {$0.isKeyWindow}.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
