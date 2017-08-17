/*
 See Section 2.4, Figure 2.8, reflex vacuum agent
 */

public enum VacuumAction: Action {
    case suck, turnRight, turnLeft
}

public enum Location {
    case a, b
}

public enum Status {
    case clean, dirty
}

public struct VacuumEnvironmentState: Percept {
    let location: Location
    let status: Status
}

extension VacuumEnvironmentState: Hashable {
    public var hashValue: Int {
        return location.hashValue + 3 * status.hashValue
    }
    
    public static func ==(lhs: VacuumEnvironmentState, rhs: VacuumEnvironmentState) -> Bool {
        return lhs.location == rhs.location && lhs.status == rhs.status
    }
}


public let interpreter: (Percept) -> VacuumEnvironmentState = { p in return p as! VacuumEnvironmentState }

public let vacuumRuleMatcher: (VacuumEnvironmentState) -> VacuumAction = { envState in
    switch (envState.location, envState.status) {
    case (_, .dirty): return .suck
    case (.a, .clean): return .turnRight
    case (.b, .clean): return .turnLeft
    }
}

public typealias ReflexVacuumAgent = SimpleReflexAgent<VacuumEnvironmentState>
public let vacuumAgent = ReflexVacuumAgent(interpreter: interpreter, ruleMatch: vacuumRuleMatcher)
