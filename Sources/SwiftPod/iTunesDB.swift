import Clibgpod

/// Swift wrapper around libgpod's Itdb_iTunesDB.
///
/// Owns the underlying C struct and frees it on deinitialization.
public final class iTunesDB: @unchecked Sendable {
    internal let pointer: UnsafeMutablePointer<Itdb_iTunesDB>

    /// Parse an iPod database from a mount point.
    ///
    /// - Parameter mountpoint: Path to the iPod mount point (e.g. "/Volumes/iPod").
    /// - Returns: A parsed `iTunesDB` instance.
    /// - Throws: `GPodError` if parsing fails.
    public static func parse(mountpoint: String) throws -> iTunesDB {
        let ptr: UnsafeMutablePointer<Itdb_iTunesDB> = try withGError { error in
            itdb_parse(mountpoint, error)
        }
        return iTunesDB(pointer: ptr)
    }

    /// Parse an iTunesDB from a specific file path.
    ///
    /// - Parameter path: Path to the iTunesDB file.
    /// - Returns: A parsed `iTunesDB` instance.
    /// - Throws: `GPodError` if parsing fails.
    public static func parseFile(_ path: String) throws -> iTunesDB {
        let ptr: UnsafeMutablePointer<Itdb_iTunesDB> = try withGError { error in
            itdb_parse_file(path, error)
        }
        return iTunesDB(pointer: ptr)
    }

    /// Create a new empty database.
    public init() {
        self.pointer = itdb_new()
    }

    internal init(pointer: UnsafeMutablePointer<Itdb_iTunesDB>) {
        self.pointer = pointer
    }

    deinit {
        itdb_free(pointer)
    }

    /// Write the database back to the iPod at its mount point.
    ///
    /// - Throws: `GPodError` if writing fails.
    public func write() throws {
        try withGErrorBool { error in
            itdb_write(self.pointer, error)
        }
    }

    /// Write the database to a specific file path.
    ///
    /// - Parameter path: Destination file path.
    /// - Throws: `GPodError` if writing fails.
    public func write(toFile path: String) throws {
        try withGErrorBool { error in
            itdb_write_file(self.pointer, path, error)
        }
    }

    /// The mount point of the iPod, if set.
    public var mountpoint: String? {
        get {
            guard let mp = itdb_get_mountpoint(pointer) else { return nil }
            return String(cString: mp)
        }
        set {
            itdb_set_mountpoint(pointer, newValue)
        }
    }

    /// Number of tracks in the database.
    public var trackCount: UInt32 {
        itdb_tracks_number(pointer)
    }

    /// All tracks in the database.
    public var tracks: [Track] {
        var result: [Track] = []
        var node = pointer.pointee.tracks
        while let current = node {
            if let data = current.pointee.data {
                let trackPtr = data.assumingMemoryBound(to: Itdb_Track.self)
                result.append(Track(pointer: trackPtr, db: self))
            }
            node = current.pointee.next
        }
        return result
    }

    /// All playlists in the database.
    public var playlists: [Playlist] {
        var result: [Playlist] = []
        var node = pointer.pointee.playlists
        while let current = node {
            if let data = current.pointee.data {
                let plPtr = data.assumingMemoryBound(to: Itdb_Playlist.self)
                result.append(Playlist(pointer: plPtr, db: self))
            }
            node = current.pointee.next
        }
        return result
    }

    /// The database version number.
    public var version: UInt32 {
        pointer.pointee.version
    }

    /// The database ID.
    public var id: UInt64 {
        pointer.pointee.id
    }
}
