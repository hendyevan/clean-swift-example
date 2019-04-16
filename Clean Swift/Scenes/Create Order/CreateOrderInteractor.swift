//
//  CreateOrderInteractor.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 04/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderInteractorInput {
    func doSomething(_ request: CreateOrderRequest)
}

protocol CreateOrderInteractorOutput {
    func presentSomething(_ response: CreateOrderResponse)
}

class CreateOrderInteractor: CreateOrderInteractorInput {
    var output: CreateOrderInteractorOutput!
    var worker: CreateOrderWorker!
    
    func doSomething(_ request: CreateOrderRequest) {
        worker = CreateOrderWorker()
        worker.doSomeWork()
        
        let response = CreateOrderResponse()
        output.presentSomething(response)
    }
}
