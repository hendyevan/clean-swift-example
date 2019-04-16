//
//  CreateOrderRouter.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 04/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderRouterInput {
    func navigateToSomewhere()
}

class CreateOrderRouter {
    
    weak var viewController: CreateOrderViewController!
    
    func navigateToSomewhere(){
        
    }
    
    func passDataToNextScene(_ segue: UIStoryboardSegue){
        if segue.identifier == "ShowSomewhereScene" {
            passDataToSomewhereScene(segue)
        }
    }
    
    func passDataToSomewhereScene(_ segue: UIStoryboardSegue){
        
    }
}
