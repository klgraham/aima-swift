/*
 See Section 2.1, Figure 2.3
 
 Table-Driven Vacuum agent
 */

let lookupTable: LookupTable = { (perceptHistory: [Percept]) in
    return vacuumRuleMatcher(perceptHistory[perceptHistory.count - 1] as! VacuumEnvironmentState)
}


let tableDrivenVacuumAgent = TableDrivenAgent(lookupTable: lookupTable)
