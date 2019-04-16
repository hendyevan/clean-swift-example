//
//  CreateOrderViewController.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 04/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation
import UIKit

protocol CreateOrderViewControllerInput {
    func displaySomething(_ viewModel: CreateOrderViewModel)
}

protocol CreateOrderViewControllerOutput {
    func doSomething(_ request: CreateOrderRequest)
}

class CreateOrderViewController : UITableViewController, CreateOrderViewControllerInput {
    var output: CreateOrderViewControllerOutput!
    var router: CreateOrderRouter!
    
    // MARK: IBOutlet
    // Customer Contact Info
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    // Shipment Address
    @IBOutlet weak var shipmentStreet1TextField: UITextField!
    @IBOutlet weak var shipmentStreet2TextField: UITextField!
    @IBOutlet weak var shipmentCityTextField: UITextField!
    @IBOutlet weak var shipmentStateTextField: UITextField!
    @IBOutlet weak var shipmentZIPTextField: UITextField!
    
    // Shipment Method
    @IBOutlet weak var shipmentSpeed: UITextField!
    
    // Payment Information
    @IBOutlet weak var creditCardNumberTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    
    // Billing Address
    @IBOutlet weak var billingStreet1TextField: UITextField!
    @IBOutlet weak var billingStreet2TextField: UITextField!
    @IBOutlet weak var billingCityTextField: UITextField!
    @IBOutlet weak var billingStateTextField: UITextField!
    @IBOutlet weak var billingZIPTextField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateOrderConfigurator.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomethingOnLoad()
    }
    
    func doSomethingOnLoad(){
        let request = CreateOrderRequest()
        output.doSomething(request)
    }
    
    func displaySomething(_ viewModel: CreateOrderViewModel){
        
    }
}


