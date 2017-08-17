/*
 See Section 2.4.3, Figure 2.12: Mode-based  Reflex Agent
 
 This agent keeps track of the environment's state, vis a vis the precept history.
 It then selects an action based on the environment state and a percept.
 */

public protocol State {}

public typealias Model = (State, Action) -> State
public typealias StateUpdater = (State, Action, Percept, Model) -> State

public class ModelBasedReflexAgent: Agent {
    
    fileprivate var environmentState: State? = nil
    fileprivate var model: Model
    fileprivate var ruleMatch: (State) -> Action
    fileprivate var mostRecentAction: Action?
    fileprivate var updateState: StateUpdater
    
    public init(model: @escaping Model,
                updateState: @escaping StateUpdater,
                ruleMatch: @escaping (State) -> Action) {
        self.model = model
        self.ruleMatch = ruleMatch
        self.updateState = updateState
    }
    
    public func run(given percept: Percept) -> Action? {
        guard let lastAction = mostRecentAction, let envState = environmentState else {
            return nil
        }
        let state = updateState(envState, lastAction, percept, model)
        return ruleMatch(state)
    }
}
