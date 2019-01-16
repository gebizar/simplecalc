//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        var empArr = [Int]()
        var returnVal = 0
        for arg in args {
            switch arg {
            case "+":
                returnVal = Int(args[0])! + Int(args[2])!
            case "-":
                returnVal = Int(args[0])! - Int(args[2])!
            case "/":
                returnVal = Int(args[0])! / Int(args[2])!
            case "%":
                var mod = Int(args[0])!
                while mod - Int(args[2])! >= 0 {
                    mod -= Int(args[2])!
                }
                returnVal = mod
            case "*":
                return Int(args[0])! * Int(args[2])!
            case "count":
                return args.count - 1
            case "fact":
                if empArr.count == 1 {
                    var factorial = empArr[0]
                    if factorial > 1 {
                        for ind in 1...(empArr[0] - 1) {
                            factorial *= ind
                            print("FACT:", ind, factorial)
                        }
                    }
                    returnVal = factorial
                } else {
                    returnVal = 0
                }
            case "avg":
                var sum = 0
                for val in empArr {
                    sum += val
                }
                var mean = 0
                if args.count > 1 {
                    mean = sum / (args.count - 1)
                } else {
                     mean = sum
                }
                returnVal = mean
            default:
                empArr.append(Int(arg)!)
            }
            
        }
        return returnVal
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

