//
//  ZigzagConvertor.swift
//  ZigzagConversion
//
//  Created by Hager Elsayed on 29/08/2022.
//

import Foundation

/*
let's think about it like elevator, we will need a flag (isGoingDown) to know if it's going up or down
and also a counter (counter) to know which row we'll add the letter
*/
struct ZigzagConvertor {
    static func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count >= 1,
              s.count <= 1000 else { return "" }
        if numRows == 1 || numRows > s.count { return s }
        var counter = 0
        var isGoingDown = false
        var rows = Array(repeating: [String](), count: numRows)
        
        for(_, char) in Array(s).enumerated() {
            rows[counter].append(String(char))
            
            if counter == 0 || counter == numRows - 1 {
                isGoingDown = !isGoingDown
            }
            
            counter += isGoingDown ? 1 : -1
        }
        
        let output = rows.flatMap { $0 }
        return output.joined(separator: "")
    }
}
