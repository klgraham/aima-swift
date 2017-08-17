import XCTest
@testable import aima_swift

class AgentTests: XCTestCase {
    func simpleReflexAgentTests() {
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


    static var allTests = [
        ("Simple Reflex Agent Agent", simpleReflexAgentTests),
//        ("Model-Based Reflex Agent", modelBasedAgentTest)
    ]
}
