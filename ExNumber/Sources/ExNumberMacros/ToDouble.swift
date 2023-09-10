//
//  ToDouble.swift
//
//
//  Created by 김종권 on 2023/09/10.
//

import Foundation
import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

public struct ToDouble: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> ExprSyntax {
        
        guard
            let argument = node.argumentList.first?.expression,
            let segments = argument.as(StringLiteralExprSyntax.self)?.segments,
            segments.count == 1,
            case .stringSegment(let literalSegment)? = segments.first
        else {
            throw CustomError.message("#ToDouble requires a static string literal")
        }
        
        let inputString = literalSegment.content.text
        if inputString.isNumber {
            return "Double(\(argument))!"
        } else {
            throw CustomError.message("is not number: \(argument)")
        }
    }
}

private extension String {
    var isNumber: Bool {
        range(
            of: "^[0-9]*$",
            options: .regularExpression
        ) != nil
    }
}
