/*
 See Section 2.4, Figure 2.7
 
 Table-Driven agent
 */

public typealias LookupTable = ([Percept]) -> Action

public class TableDrivenAgent: Agent {
    fileprivate var percepts = [Percept]()
    fileprivate let lookupTable: LookupTable
    
    public init(lookupTable: @escaping LookupTable) {
        self.lookupTable = lookupTable
    }
    
    public func run(given percept: Percept) -> Action? {
        percepts.append(percept)
        return lookup(percepts)
    }
    
    fileprivate func lookup(_ percepts: [Percept]) -> Action {
        return lookupTable(percepts)
    }    
}
