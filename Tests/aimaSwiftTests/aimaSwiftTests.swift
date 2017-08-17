import XCTest
@testable import aimaSwift

class aimaSwiftTests: XCTestCase {
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
    
    func tableDrivenVacuumAgentTest() {
        
        let output = tableDrivenVacuumAgent.run(given: VacuumEnvironmentState(location: .a, status: .dirty)) as! VacuumAction
        XCTAssertEqual(1, 1)
        XCTAssertEqual(output, .suck)
    }


    static var allTests = [
        ("simpleReflexAgentTests", simpleReflexAgentTests),
        ("tableDrivenVacuumAgentTest", tableDrivenVacuumAgentTest)
//        ("modelBasedAgentTest", modelBasedAgentTest)
    ]
}
