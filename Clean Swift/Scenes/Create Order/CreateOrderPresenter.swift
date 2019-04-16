//
//  CreateOrderPresenter.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 04/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderPresenterInput {
    func presentSomething(_ response: CreateOrderResponse)
}

protocol CreateOrderPresenterOutput: class {
    func displaySomething(_ viewModel: CreateOrderViewModel)
}

class CreateOrderPresenter: CreateOrderPresenterInput {
    weak var output: CreateOrderPresenterOutput!
    
    func presentSomething(_ response: CreateOrderResponse) {
        let viewModel = CreateOrderViewModel()
        output.displaySomething(viewModel)
    }
}
