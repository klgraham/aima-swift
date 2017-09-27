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
        
        let actions = states.map { vacuumAgent.run(given: $0)!}
        let expectedActions = [VacuumAction.suck.action, VacuumAction.suck.action, VacuumAction.turnRight.action, VacuumAction.turnLeft.action]
        XCTAssertEqual(actions, expectedActions)
    }
    
    fileprivate func percept(_ location: Location, _ status: VacuumWorldStatus) -> VacuumEnvironmentState {
        return VacuumEnvironmentState(location: location, status: status)
    }
    
    // Uses the vacuum cleaner world example from Section 2.1, Figure 2.3 as a test
    func testTableDrivenVacuumAgent() {
        let perceptHistories: [[VacuumEnvironmentState]] = [
            [percept(.a, .clean)],
            [percept(.a, .dirty)],
            [percept(.b, .clean)],
            [percept(.b, .dirty)],
            [percept(.a, .clean), percept(.a, .clean)],
            [percept(.a, .clean), percept(.a, .dirty)],
            [percept(.a, .clean), percept(.a, .clean), percept(.a, .clean)],
            [percept(.a, .clean), percept(.a, .clean), percept(.a, .dirty)]
        ]
        
        let expectedActions =
            [VacuumAction.turnRight.action, VacuumAction.suck.action, VacuumAction.turnLeft.action,
             VacuumAction.suck.action, VacuumAction.turnRight.action, VacuumAction.suck.action,
             VacuumAction.turnRight.action, VacuumAction.suck.action]
        
        var returnedActions = [Action]()
        
        for history in perceptHistories {
            var action: Action!
            for percept in history {
                action = tableDrivenVacuumAgent.run(given: percept)!
            }
            returnedActions.append(action)
        }
        
        
        XCTAssertEqual(returnedActions, expectedActions)
    }
    
    static var allTests = [
        ("testReflexVacuumAgent", testReflexVacuumAgent),
        ("testTableDrivenVacuumAgent", testTableDrivenVacuumAgent)
    ]
    
}
