//
//  InjectableMacro.swift
//  CleanArchitecture
//
//  Created by Oscar De Moya on 2025/7/12.
//

import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics

struct InjectableMacro: MemberMacro {
    typealias PropertyInfo = (name: String, type: String)
    
    static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        // Extract generic argument
        guard let genericArgument = extractGenericArgument(from: node, context: context) else {
            return []
        }
        
        // Extract dependency properties from generic argument
        let dependencyProperties = extractDependencyProperties(from: genericArgument)
        
        guard !dependencyProperties.isEmpty else {
            let diagnostic = Diagnostic(
                node: node,
                message: InjectableDiagnostic.noInitTypes
            )
            context.diagnose(diagnostic)
            return []
        }
        
        // Extract existing properties from the struct/class
        let existingProperties = extractExistingProperties(from: declaration)
        
        // Generate declarations and init method
        return generateDeclarations(dependencyProperties: dependencyProperties, 
                                    existingProperties: existingProperties)
    }
    
    // MARK: - Helper Methods
    
    private static func extractGenericArgument(
        from node: AttributeSyntax,
        context: some MacroExpansionContext
    ) -> GenericArgumentSyntax? {
        guard let identifier = node.attributeName.as(IdentifierTypeSyntax.self),
              let genericArgument = identifier.genericArgumentClause?.arguments.first else {
            let diagnostic = Diagnostic(
                node: node,
                message: InjectableDiagnostic.noInitTypes
            )
            context.diagnose(diagnostic)
            return nil
        }
        return genericArgument
    }
    
    private static func extractDependencyProperties(
        from genericArgument: GenericArgumentSyntax
    ) -> [PropertyInfo] {
        var dependencyProperties = [PropertyInfo]()
        
        if let composition = genericArgument.argument.as(CompositionTypeSyntax.self) {
            let types = composition.elements.compactMap { $0.type.description.trimmed }
            dependencyProperties = types.map { (name: $0.asVariableName, type: $0) }
        } else if let argument = genericArgument.argument.as(IdentifierTypeSyntax.self) {
            let type = argument.description.trimmed
            dependencyProperties = [(name: type.asVariableName, type: type)]
        } else if let argument = genericArgument.argument.as(SomeOrAnyTypeSyntax.self) {
            let name = argument.constraint.description.asVariableName
            let type = argument.description.trimmed
            dependencyProperties = [(name: name, type: type)]
        }
        
        return dependencyProperties
    }
    
    private static func extractExistingProperties(
        from declaration: some DeclGroupSyntax
    ) -> [PropertyInfo] {
        var existingProperties = [PropertyInfo]()
        
        for member in declaration.memberBlock.members {
            if let variableDecl = member.decl.as(VariableDeclSyntax.self),
               variableDecl.bindingSpecifier.tokenKind == .keyword(.let) {
                
                for binding in variableDecl.bindings {
                    if let identifier = binding.pattern.as(IdentifierPatternSyntax.self),
                       let typeAnnotation = binding.typeAnnotation?.type {
                        let propertyName = identifier.identifier.text
                        let propertyType = typeAnnotation.description.trimmed
                        existingProperties.append((name: propertyName, type: propertyType))
                    }
                }
            }
        }
        
        return existingProperties
    }
    
    private static func generateDeclarations(
        dependencyProperties: [PropertyInfo],
        existingProperties: [PropertyInfo]
    ) -> [DeclSyntax] {
        // Create the dependency properties as private let declarations
        var declSyntaxList = dependencyProperties.map {
            DeclSyntax(stringLiteral: "private let \($0.name): \($0.type)")
        }
        
        // Create the init method
        let initDecl = generateInitMethod(dependencyProperties: dependencyProperties,
                                         existingProperties: existingProperties)
        declSyntaxList.append(initDecl)
        
        return declSyntaxList
    }
    
    private static func generateInitMethod(
        dependencyProperties: [PropertyInfo],
        existingProperties: [PropertyInfo]
    ) -> DeclSyntax {
        let allInitProperties = dependencyProperties + existingProperties
        
        let initArgs = allInitProperties.map { 
            "\($0.name): \($0.type)" 
        }.joined(separator: ",\n    ")
        
        let initAssignments = allInitProperties.map { 
            "self.\($0.name) = \($0.name)" 
        }.joined(separator: "\n    ")
        
        let initCode = """
        public init(
            \(initArgs)
        ) {
            \(initAssignments)
        }
        """
        
        return DeclSyntax(stringLiteral: initCode)
    }
}
