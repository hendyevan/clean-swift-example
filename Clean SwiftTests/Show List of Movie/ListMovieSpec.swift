//
//  ListMovieSpec.swift
//  Clean SwiftTests
//
//  Created by Fabianus Hendy Evan on 23/04/19.
//  Copyright © 2019 Fabianus Hendy Evan. All rights reserved.
//

import XCTest
import Nimble
import Quick
@testable import Clean_Swift

class ListMovieSpec: QuickSpec {
    
    class OutputMock: ListMovieInteractorInput {
        var movie: MovieModel.Movie2?
        
        func getNowPlayingMovie() {
            
        }
        
        func getListMovie() {
            
        }
        
        func getUpcomingMovie() {
            
        }
        
        func showDetail(movie: MovieModel.Movie2) {
            self.movie = movie
        }
    }
    
    override func spec() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Movie", bundle: bundle)
        var viewController: ListMovieViewController!
        var output: OutputMock!
        
        beforeEach {
            viewController = storyboard.instantiateViewController(withIdentifier: "ListMovieVC") as? ListMovieViewController
            output = OutputMock()
            
            viewController.output = output
        }
        
        describe("The view load") {
            var window: UIWindow!
            
            beforeEach {
                window = UIWindow()
                window.addSubview(viewController.view)
                viewController.beginAppearanceTransition(true, animated: false) // Triggers .viewWillAppear() and .viewDidAppear() events.
                viewController.endAppearanceTransition()
            }
            afterEach {
                viewController.view.removeFromSuperview()
            }
            it("showing list of movie"){
//                expect(output.getUpcomingMovie()).to(eq)
            }
        }
    }
    
}
