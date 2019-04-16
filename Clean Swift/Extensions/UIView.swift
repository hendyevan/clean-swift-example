//
//  UIView.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 11/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func round(withRadius radius: CGFloat){
        self.layer.cornerRadius     = radius
        self.layer.masksToBounds    = true
    }
}
