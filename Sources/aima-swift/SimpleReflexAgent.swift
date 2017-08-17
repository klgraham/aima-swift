/*
 See Section 2.4, Figure 2.10: Simple Reflex Agent
 
 A simple reflex agent chooses an action based on the current precept, ignoring the precept history.
 */

public class SimpleReflexAgent<State: Hashable>: Agent {
    fileprivate var ruleMatch: (State) -> Action
    fileprivate var interpret: (Percept) -> State
    
    init(interpreter: @escaping (Percept) -> State, ruleMatch: @escaping (State) -> Action) {
        self.interpret = interpreter
        self.ruleMatch = ruleMatch
    }
    
    public func run(given percept: Percept) -> Action? {
        let state = interpret(percept)
        return ruleMatch(state)
    }
}
