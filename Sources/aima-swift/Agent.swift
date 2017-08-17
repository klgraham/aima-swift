/*
 See Section 2.1, Figure 2.1
 
 "Agents interact with environments through sensors and actuators."
 */

public protocol Action {}
public protocol Percept {}
public protocol Environment {}

// Actuator: function that takes an Action and Environment and returns a new Environment
public typealias Actuator = (Action, Environment) -> Environment

// Sensor: function that takes an Environment and returns a Percept
public typealias Sensor = (Environment) -> Percept

public protocol Agent {
    // The agent program specifies how an agent interacts with an Environment
    func run(given precept: Percept) -> Action
    
    // The agent can act on the environment with an Actuator
    func act(on environment: Environment, with action: Action) -> Environment
}
