/*
 See Section 2.4, Figure 2.8, reflex vacuum agent
 */

public enum VacuumAction: String {
    case suck, turnRight, turnLeft
    
    var action: Action {
        return Action(name: self.rawValue)
    }
}

public enum Location {
    case a, b
}

public enum VacuumWorldStatus {
    case clean, dirty
}

public struct VacuumEnvironmentState: Percept {
    let location: Location
    let status: VacuumWorldStatus
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

public let vacuumRuleMatcher: (VacuumEnvironmentState) -> Action = { envState in
    switch (envState.location, envState.status) {
    case (_, .dirty): return VacuumAction.suck.action
    case (.a, .clean): return VacuumAction.turnRight.action
    case (.b, .clean): return VacuumAction.turnLeft.action
    }
}

public typealias ReflexVacuumAgent = SimpleReflexAgent<VacuumEnvironmentState>
public let vacuumAgent = ReflexVacuumAgent(interpreter: interpreter, ruleMatch: vacuumRuleMatcher)
