//
//  ViewModelTests.swift
//  CollectionViewFlickerTests
//
//  Created by Admin on 15/03/2022.
//

import XCTest
@testable import CollectionViewFlicker

class ViewModelTests: XCTestCase {

    var mockNetwork: MockNetworkManager!
    
    override func setUpWithError() throws {
       mockNetwork = MockNetworkManager()

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetImages() {
        mockNetwork.getImage(searchText: "")
        XCTAssert(mockNetwork.data != nil)
    }
    

}
