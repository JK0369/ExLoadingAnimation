//
//  Plugins.swift
//  
//
//  Created by 김종권 on 2023/09/10.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros

@main
struct ExNumberPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        StringifyMacro.self,
        ToDouble.self
    ]
}
