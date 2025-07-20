//
//  Config.swift
//  UIComponents
//
//  Created by Oscar De Moya on 14/03/24.
//

public class Config {
    public static let shared = Config()
    public var isLoggingEnabled = true

    // Tokens
    public var sizing: Sizing = .regular
    public var scaling: any SizeScaling = DefaultSizeScaling()
    public var borderWidth: any BorderWidthConfig = DefaultBorderWidthConfig()
    public var cornerRadius: any CornerRadiusConfig = DefaultCornerRadiusConfig()
    public var padding: any PaddingConfig = DefaultPaddingConfig()
    public var spacing: any SpacingConfig = DefaultSpacingConfig()
    public var color: any ColorConfig = DefaultColorConfig()
    public var colorShade: any ColorShadeConfig = DefaultColorShadeConfig()
    public var shadow: any ShadowConfig = DefaultShadowConfig()
    public var blur: any BlurConfig = DefaultBlurConfig()
    public var opacity: any OpacityConfig = DefaultOpacityConfig()
    public var font: any FontConfig = DefaultFontConfig()
    
    // Components
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
