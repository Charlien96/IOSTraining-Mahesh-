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
    var viewModel: ViewModel!
    
    override func setUpWithError() throws {
        let controller =  ViewController()
        viewModel = ViewModel(delegate: controller)
        mockNetwork = MockNetworkManager()
        viewModel.networkManager = mockNetwork

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetImages() {
        // GIVEN
        
         let searchText = "dog"
        
        
        // When
        
        XCTAssertEqual(viewModel.data.count, 0)

        viewModel.getImage(searchText: searchText)
        
        // Then
        
        XCTAssertEqual(viewModel.data.count, 100)
        
        
        XCTAssertEqual(viewModel.data[14].title, "TANGO")
    }
    

}
