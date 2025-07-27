//
//  MakeUseCaseMacro.swift
//  CleanArchitecture
//
//  Created by Oscar De Moya on 10/12/24.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

struct MakeUseCaseMacro: DeclarationMacro {
    typealias Property = (name: String, type: String)
    
    // Define a struct to hold the generic arguments result
    struct GenericArgumentsResult {
        let repositoryTypes: GenericArgumentSyntax
        let useCaseType: String
        let additionalDependencies: [GenericArgumentSyntax]
    }
    
    static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Validate and extract generic arguments
        guard let genericArguments = extractGenericArguments(from: node, context: context) else {
            return []
        }
        
        // Parse repository dependencies
        guard let repositoryProperties = parseRepositoryProperties(
            from: genericArguments.repositoryTypes,
            context: context,
            node: node
        ) else {
            return []
        }
        
        // Parse additional dependencies
        let useCaseProperties = parseAdditionalDependencies(from: genericArguments.additionalDependencies)
        
        // Generate factory function
        let factoryFunction = generateFactoryFunction(
            useCaseType: genericArguments.useCaseType,
            repositoryProperties: repositoryProperties,
            useCaseProperties: useCaseProperties
        )
        
        return [factoryFunction]
    }
    
    // MARK: - Helper Methods
    
    private static func extractGenericArguments(
        from node: some FreestandingMacroExpansionSyntax,
        context: some MacroExpansionContext
    ) -> GenericArgumentsResult? {
        guard let arguments = node.genericArgumentClause?.arguments,
              arguments.count >= 2 else {
            context.diagnose(Diagnostic(node: node, message: MakeUseCaseDiagnostic.invalidArguments))
            return nil
        }
        
        return GenericArgumentsResult(
            repositoryTypes: arguments.first!,
            useCaseType: arguments.dropFirst().first!.argument.description.trimmed,
            additionalDependencies: Array(arguments.dropFirst(2))
        )
    }
    
    private static func parseRepositoryProperties(
        from repositoryTypes: GenericArgumentSyntax,
        context: some MacroExpansionContext,
        node: some FreestandingMacroExpansionSyntax
    ) -> [Property]? {
        var properties = [Property]()
        
        if let composition = repositoryTypes.argument.as(CompositionTypeSyntax.self) {
            let types = composition.elements.compactMap { $0.type.description.trimmed }
            properties = types.map { (name: $0.asVariableName, type: $0) }
        } else if let argument = repositoryTypes.argument.as(IdentifierTypeSyntax.self) {
            let type = argument.description.trimmed
            properties = [(name: type.asVariableName, type: type)]
        } else if let argument = repositoryTypes.argument.as(SomeOrAnyTypeSyntax.self) {
            let name = argument.constraint.description.asVariableName
            let type = argument.description.trimmed
            properties = [(name: name, type: type)]
        }
        
        guard !properties.isEmpty else {
            context.diagnose(Diagnostic(node: node, message: MakeUseCaseDiagnostic.noRepositoryProtocol))
            return nil
        }
        
        return properties
    }
    
    private static func parseAdditionalDependencies(from dependencies: [GenericArgumentSyntax]) -> [Property] {
        return dependencies.map { dependency in
            let type = dependency.argument.description.trimmed
            return (name: type.asVariableName, type: type)
        }
    }
    
    private static func generateFactoryFunction(
        useCaseType: String,
        repositoryProperties: [Property],
        useCaseProperties: [Property]
    ) -> DeclSyntax {
        // Generate initialization code
        let repositoryInits = generateRepositoryInits(from: repositoryProperties)
        let useCaseInits = generateUseCaseInits(from: useCaseProperties)
        let allProperties = repositoryProperties + useCaseProperties
        
        // Generate function body
        let factoryDecl = """
        public func make\(useCaseType)() -> \(useCaseType) {
            \(generateCombinedInits(repositoryInits: repositoryInits, useCaseInits: useCaseInits))
            return \(useCaseType)(
                \(generateFunctionArguments(from: allProperties))
            )
        }
        """
        
        return DeclSyntax(stringLiteral: factoryDecl)
    }
    
    private static func generateRepositoryInits(from properties: [Property]) -> String {
        return properties
            .map { "let \($0.name) = repositoryFactory.make\($0.type)()" }
            .joined(separator: "\n    ")
    }
    
    private static func generateUseCaseInits(from properties: [Property]) -> String {
        return properties
            .map { "let \($0.name) = make\($0.type)()" }
            .joined(separator: "\n    ")
    }
    
    private static func generateCombinedInits(repositoryInits: String, useCaseInits: String) -> String {
        var allInits = [String]()
        if !repositoryInits.isEmpty { allInits.append(repositoryInits) }
        if !useCaseInits.isEmpty { allInits.append(useCaseInits) }
        return allInits.joined(separator: "\n    ")
    }
    
    private static func generateFunctionArguments(from properties: [Property]) -> String {
        return properties
            .map { "\($0.name): \($0.name)" }
            .joined(separator: ",\n        ")
    }
}
