//
//  Constants.swift
//  CoordinatorExample
//
//  Created by Nathan Hancock on 5/10/18.
//  Copyright © 2018 NateHancock. All rights reserved.
//

import Foundation

enum CEOperator {
    
    case add
    case divide
    case subtract
    case multiply
    
    var description: String {
        switch self {
        case .add:
            return "+"
        case .divide:
            return "/"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        }
    }
}
