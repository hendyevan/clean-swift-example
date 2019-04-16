//
//  CreateOrderConfigurator.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 04/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

extension CreateOrderViewController: CreateOrderPresenterOutput {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue)
    }
}

extension CreateOrderInteractor: CreateOrderViewControllerOutput {
    
}

extension CreateOrderPresenter: CreateOrderInteractorOutput {
    
}

class CreateOrderConfigurator {
    
    class var sharedInstance: CreateOrderConfigurator {
        return CreateOrderConfigurator()
    }
    
    func configure(_ viewController: CreateOrderViewController){
        let router = CreateOrderRouter()
        router.viewController = viewController
        
        let presenter = CreateOrderPresenter()
        presenter.output = viewController
        
        let interactor = CreateOrderInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
