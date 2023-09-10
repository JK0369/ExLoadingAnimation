//
//  CustomError.swift
//  
//
//  Created by 김종권 on 2023/09/10.
//

import Foundation

enum CustomError: Error, CustomStringConvertible {
   case message(String)

   var description: String {
     switch self {
     case .message(let text):
       return text
     }
   }
 }
