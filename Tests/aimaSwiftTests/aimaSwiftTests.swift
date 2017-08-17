//
//  aimaTests.swift
//  aimaSwiftTests
//
//  Created by Kenneth Graham on 8/17/17.
//

import XCTest
@testable import aimaSwift

class aimaSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let states = [
            VacuumEnvironmentState(location: .a, status: .dirty),
            VacuumEnvironmentState(location: .b, status: .dirty),
            VacuumEnvironmentState(location: .a, status: .clean),
            VacuumEnvironmentState(location: .b, status: .clean)
        ]
        
        let actions = states.map { vacuumAgent.run(given: $0) as! VacuumAction }
        let expectedActions: [VacuumAction] = [.suck, .suck, .turnRight, .turnLeft]
        XCTAssertEqual(actions, expectedActions)
    }
    
    //    func modelBasedAgentTest() {
    //
    //    }
    
//    func tableDrivenVacuumAgentTest() {
//
//        let output = tableDrivenVacuumAgent.run(given: VacuumEnvironmentState(location: .a, status: .dirty)) as! VacuumAction
//        XCTAssertEqual(output, .suck)
//    }
    
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    static var allTests = [
        ("testExample", testExample),
//        ("tableDrivenVacuumAgentTest", tableDrivenVacuumAgentTest)
        //        ("modelBasedAgentTest", modelBasedAgentTest)
    ]
    
}
