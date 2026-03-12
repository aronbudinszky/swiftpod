import Clibgpod

/// Error type wrapping GLib's GError for libgpod operations.
public struct GPodError: Error, CustomStringConvertible, @unchecked Sendable {
    public let domain: String
    public let code: Int32
    public let message: String

    public var description: String { message }

    init(gerror: UnsafeMutablePointer<GError>) {
        self.domain = String(cString: g_quark_to_string(gerror.pointee.domain))
        self.code = gerror.pointee.code
        self.message = String(cString: gerror.pointee.message)
        g_error_free(gerror)
    }

    init(message: String) {
        self.domain = "libgpod"
        self.code = -1
        self.message = message
    }
}

/// Call a C function that returns a pointer and takes a GError**, throwing on NULL result.
internal func withGError<T>(_ body: (UnsafeMutablePointer<UnsafeMutablePointer<GError>?>) -> T?) throws -> T {
    var error: UnsafeMutablePointer<GError>?
    guard let result = body(&error) else {
        if let error {
            throw GPodError(gerror: error)
        }
        throw GPodError(message: "Unknown error")
    }
    return result
}

/// Call a C function that returns gboolean and takes a GError**, throwing on FALSE result.
internal func withGErrorBool(_ body: (UnsafeMutablePointer<UnsafeMutablePointer<GError>?>) -> gboolean) throws {
    var error: UnsafeMutablePointer<GError>?
    let result = body(&error)
    if result == 0 {
        if let error {
            throw GPodError(gerror: error)
        }
        throw GPodError(message: "Operation failed")
    }
}
