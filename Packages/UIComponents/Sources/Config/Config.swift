//
//  Config.swift
//  UIComponents
//
//  Created by Oscar De Moya on 14/03/24.
//

public class Config {
    public static let shared = Config()
    public var sizing: Sizing = .regular
    public var isLoggingEnabled = true

    public var color: any ColorConfig = DefaultColorConfig()
    public var font: any FontConfig = DefaultFontConfig()
    public var button: any ButtonConfig = DefaultButtonConfig()
    public var textButton: any TextButtonConfig = DefaultTextButtonConfig()
    public var textField: any TextFieldConfig = DefaultTextFieldConfig()
    public var navigationBar: any NavigationBarConfig = DefaultNavigationBarConfig()
    
    public var customFontFamily: any FontFamily {
        switch font.source {
        case .system: DefaultFontFamily()
        case .custom(let fontFamily): fontFamily
        }
    }
    
    private init() {}
}
