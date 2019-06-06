//
//  MasterDetailsAPISearchTests.swift
//  MasterDetailsAPISearchTests
//
//  Created by ToqaMohsen on 6/3/19.
//  Copyright © 2019 Toqa. All rights reserved.
//

import XCTest
@testable import MasterDetailsAPISearch

class MasterDetailsAPISearchTests: XCTestCase {

    var sortedlist = SortList()
    var masterVC: MasterViewController!
    
    // Given
    let movie1 = movies(title: "test1", year: 2018, cast: ["toqa1","toqa2"], genres: ["comedy","drama"], rating: 5)
    let movie2 = movies(title: "test2", year: 2019, cast: ["toqa9","toqa4"], genres: ["comedy","drama"], rating: 4)
    let movie3 = movies(title: "test3", year: 2018, cast: ["toqa3","toqa4"], genres: ["comedy","drama"], rating: 4)
    let movie4 = movies(title: "test4", year: 2017, cast: ["toqa5","toqa6"], genres: ["comedy","drama"], rating: 2)
   
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
//        super.setUp()
//
//        masterVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("MasterViewController") as! MasterViewController
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
    }
    
    func testApplyingSearch() {
     
         let moviesList = [movie1 , movie2 , movie3 , movie4]
        // When
       let resultDic = MasterPresenter.search(objectResponse: moviesList, title: "test")
        // Then
      
        XCTAssertEqual(resultDic?.count, 3)
    }
    
    func testApplyingGrouping() {
        // Given
        let moviesList = [movie1 , movie2 , movie3 , movie4]
        
        // When
        let resultDic = MasterPresenter.search(objectResponse: moviesList, title: "test")
        // Then

        XCTAssertEqual(resultDic?[2018]!.count, 2)
    }
    
    func testApplyingSorting() {
        // Given
        let moviesList = [movie1 , movie2 , movie3 , movie4]
        
        // When
        let resultDic = MasterPresenter.search(objectResponse: moviesList, title: "test")
        
        // Then

        let subList = resultDic?[2018]?.first
        XCTAssertEqual(subList?.rating, 5)

        let subList2 = resultDic?[2017]?.first
        XCTAssertEqual(subList2?.rating, 2)
    }
    
    func testMergeSorting() {
        // Given
        let moviesList = [movie1 , movie2 , movie3 , movie4]
        
        // When
          let mergedList = sortedlist.mergeSort(moviesList)
        // Then
        
        let subList = mergedList.first
        XCTAssertEqual(subList?.rating, 5)
        
        let subList2 = mergedList[1]
        XCTAssertEqual(subList2.rating, 4)
    }


}
