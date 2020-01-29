//
//  Guess_which_animal_is_biggerTests.swift
//  Guess_which_animal_is_biggerTests
//
//  Created by slava bily on 23/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import XCTest
@testable import Guess_which_animal_is_bigger

class Guess_which_animal_is_biggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadingAnimals() {
        var model = ProjectDataSource()
        model.prepareQuestion()
        
        XCTAssert(model.count == 6)
    }
    
    func testCorrectAnswer() {
        var model = ProjectDataSource()
        model.prepareQuestion()
        model.prepareAnswer()
        
        XCTAssert(model.correctAnswer == 0)
    }


}
