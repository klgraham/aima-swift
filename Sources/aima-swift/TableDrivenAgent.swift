/*
 See Section 2.4, Figure 2.7
 
 Table-Driven agent
 */

public typealias LookupTable = ([Percept]) -> Action

public protocol TableDrivenAgent: Agent {
    var percepts: [Percept] { get set }
    var lookupTable: LookupTable { get }
    func runAgent(given percept: Percept) -> Action
    
    func lookup(_ percepts: [Percept]) -> Action
}

extension TableDrivenAgent {
    mutating func runAgent(given percept: Percept) -> Action {
        percepts.append(percept)
        return lookup(percepts)
    }
    
    func lookup(_ percepts: [Percept]) -> Action {
        return lookupTable(percepts)
    }
}
