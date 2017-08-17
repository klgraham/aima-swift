//
//  AgentTests.swift
//  aimaSwiftTests
//
//  Created by Kenneth Graham on 8/17/17.
//

import XCTest
@testable import aimaSwift

class AgentTests: XCTestCase {
    
    func testReflexVacuumAgent() {
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
    
    func testTableDrivenVacuumAgent() {
        let output = tableDrivenVacuumAgent.run(given: VacuumEnvironmentState(location: .a, status: .dirty)) as! VacuumAction
        XCTAssertEqual(output, .suck)
    }
    
    static var allTests = [
        ("testReflexVacuumAgent", testReflexVacuumAgent),
        ("testTableDrivenVacuumAgent", testTableDrivenVacuumAgent)
    ]
    
}
