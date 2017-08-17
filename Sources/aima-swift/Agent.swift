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
    // Actuators let agents act on an environment
    var actuators: [Actuator] { get set }
    
    // Sensors let agents perceive an environment
    var sensors: [Sensor] { get set }
    
    // The agent program specifies how an agent interacts with an Environment
    func run() -> Environment
}
