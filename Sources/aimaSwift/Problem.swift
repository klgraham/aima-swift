//
//  Problem.swift
//  aimaSwift
//
//  Created by Kenneth Graham on 8/23/17.
//
// Describes a problem that can be solved by a search agent. 
// See Section 3.1.1
//

protocol Problem {
    associatedtype State
    associatedtype CostType
    
    // MARK: - Properties
    
    // initial state the agent starts in
    var initialState: State
    
    // MARK: - Functions
    
    // Possible actions that can be executed in the given state
    func actions(given state: State) -> Set<Action>
 
    // Given a state and an action, returns the state resulting from taking the action
    // This specifies the transition model.
    func result(of action: Action, given state: State) -> State
    
    // Returns true if the input state is the goal
    func haveReachedGoal(state: State) -> Bool
    
    /*!
     Returns the cost to get to state2 from state1, given the action and the cost expended to get to state1
     */
    func costOf(action: Action, from state1: State, to state2: State, given costSoFar: CostType) -> CostType
}
