// The simple problem solving agent from Section 3.1.1, Figure 3.1

public class SimpleProblemSolvingAgent<State, SimpleProblem: Problem>: Agent {
    // MARK: - Properties
    fileprivate var actionSequence = [Action]()
    fileprivate var state: State
    fileprivate var goal: State?
    fileprivate var problem: SimpleProblem!

    // MARK: - Functions
    fileprivate var updateState: (State, Percept) -> State
    fileprivate var formulateGoal: (State) -> State
    fileprivate var formulateProblem: (State, State) -> SimpleProblem
    fileprivate var search: (SimpleProblem) -> [Action]?

    init(initialState: State, goalState: State,
         updateState: @escaping (State, Percept) -> State,
         formulateProblem: @escaping (State, State) -> SimpleProblem,
         formulateGoal: @escaping (State) -> State,
         search: @escaping (SimpleProblem) -> [Action]?) {
        self.state = initialState
        self.goal = goalState
        self.updateState = updateState
        self.formulateGoal = formulateGoal
        self.formulateProblem = formulateProblem
        self.search = search
    }

    public func run(given percept: Percept) -> Action? {
        let previousState = state
        let newState = updateState(previousState, percept)

        if actionSequence.isEmpty {
            let goal = formulateGoal(newState)
            problem = formulateProblem(newState, goal)

            guard let actionSeq = search(problem) else {
                return nil
            }
            actionSequence = actionSeq
        }

        return actionSequence.removeFirst()
    }
}

