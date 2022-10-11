import Foundation

public final class Presentation: NSObject {
    public static var bundle: Bundle {
#if SWIFT_PACKAGE
        return Bundle.module
#else
        return Bundle(for: Presentation.self)
#endif
    }
}
