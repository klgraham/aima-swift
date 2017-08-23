//
//  SimpleProblemSolvingAgent.swift
//  aimaSwiftPackageDescription
//
//  Created by Kenneth Graham on 8/23/17.
//
// The simple problem solving agent from Section 3.1.1, Figure 3.1
//

public class SimpleProblemSolvingAgent<State>: Agent {
    // MARK: - Properties
    fileprivate var actionSequence = [Action]()
    fileprivate var state: State?
    fileprivate var goal: State?
    fileprivate var problem: Problem!
    
    // MARK: - Search Functions
    fileprivate var updateState: (State, Percept) -> State
    fileprivate var formulateGoal: (State) -> State
    fileprivate var formulateProblem: (State, State) -> Problem
    fileprivate var search: (Problem) -> [Action]?
    
    public func run(given percept: Percept) -> Action? {
        guard let previousState = state else { return nil }
        
        let newState = updateState(previousState, percept)
        
        if actionSequence.isEmpty {
            let goal = formulateGoal(newState)
            problem = formulateProblem(newState, goal)
            
            guard let actionSeq = search(problem) else {
                return nil
            }
            actionSequence = actionSeq
        }
        
        return actions.popFirst()
    }
}
