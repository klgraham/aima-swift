// see Section 3.2.1

public enum VacuumWorldLocation {
    case right, left
}

public struct VacuumWorldState {
    let agentLocation: VacuumWorldLocation
    let statusA: VacuumWorldStatus
    let statusB: VacuumWorldStatus
}

public class VacuumWorldProblem: Problem {
    public typealias State = VacuumWorldState
    public typealias CostType = Int
    
    public var initialState: VacuumWorldState
    
    init(initialState: VacuumWorldState) {
        self.initialState = initialState
    }
    
    public func actions(given state: VacuumWorldState) -> Set<Action> {
        return Set([VacuumAction.suck.action, VacuumAction.turnLeft.action, VacuumAction.turnRight.action])
    }
    
    public func result(of action: Action, given state: VacuumWorldState) -> VacuumWorldState {
        var newLocation = state.agentLocation
        var newAStatus = state.statusA
        var newBStatus = state.statusB
        
        switch (state.agentLocation, action) {
        case (.right, VacuumAction.suck.action):
            newAStatus = .clean
        case (.left, VacuumAction.suck.action):
            newBStatus = .clean
        case (.right, VacuumAction.turnLeft.action):
            newLocation = .left
        case (.left, VacuumAction.turnRight.action):
            newLocation = .right
        default:
            return state
        }
        
        return VacuumWorldState(agentLocation: newLocation, statusA: newAStatus, statusB: newBStatus)
    }
    
    public func haveReachedGoal(state: VacuumWorldState) -> Bool {
        switch (state.statusA, state.statusB) {
        case (.clean, .clean):
            return true
        default:
            return false
        }
    }
    
    public func costOf(action: Action, from state1: VacuumWorldState, to state2: VacuumWorldState, given costSoFar: Int) -> Int {
        return costSoFar + 1
    }
}


