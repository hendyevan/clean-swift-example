//
//  ListMovieConfigurator.swift
//  Clean Swift
//
//  Created by Fabianus Hendy Evan on 22/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import Foundation

/**
 Class to build view controller's dependency tree. Makes and links ViewController, Interactor, and Presenter objects.
 */
class ListMovieConfigurator {
    static let sharedInstance = ListMovieConfigurator()
    
    func configure(viewController: ListMovieViewController) {
        let router = ListMovieRouter()
        router.viewController = viewController
        
        let presenter = ListMoviePresenter()
        presenter.output = viewController
        
        let interactor = ListMovieInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
