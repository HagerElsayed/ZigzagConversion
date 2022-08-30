//
//  ZigzagConvertorViewModel.swift
//  ZigzagConversion
//
//  Created by Hager Elsayed on 29/08/2022.
//

import Foundation

class ZigzagConvertorViewModel: ObservableObject {
    @Published var text: String = ""
    @Published var numRows: String = ""
    @Published var zigzagConversionResult: String = ""
    @Published var message: String = ""
    
    
    func getZigzagText() {
        guard text.count >= 1,
              text.count <= 1000 else {
                  message = "please enter a text between 1 and 1000 letters"
                  return
              }
        
        zigzagConversionResult = ZigzagConvertor.convert(text, Int(numRows) ?? 0)
        message = ""
    }

}
