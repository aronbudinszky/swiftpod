import Clibgpod

/// Swift wrapper around libgpod's Itdb_Playlist.
///
/// Does not own the underlying C struct — the parent `iTunesDB` manages its lifecycle.
public final class Playlist: @unchecked Sendable {
    internal let pointer: UnsafeMutablePointer<Itdb_Playlist>
    private let db: iTunesDB  // prevent premature dealloc

    internal init(pointer: UnsafeMutablePointer<Itdb_Playlist>, db: iTunesDB) {
        self.pointer = pointer
        self.db = db
    }

    public var name: String? {
        get { pointer.pointee.name.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.name)
            pointer.pointee.name = newValue.flatMap { g_strdup($0) }
        }
    }

    public var id: UInt64 { pointer.pointee.id }
    public var isMaster: Bool { pointer.pointee.type == 1 }
    public var isSmartPlaylist: Bool { pointer.pointee.is_spl != 0 }
    public var isPodcast: Bool { pointer.pointee.podcastflag != 0 }
    public var trackCount: Int32 { pointer.pointee.num }

    /// The tracks in this playlist.
    public var tracks: [Track] {
        var result: [Track] = []
        var node = pointer.pointee.members
        while let current = node {
            if let data = current.pointee.data {
                let trackPtr = data.assumingMemoryBound(to: Itdb_Track.self)
                result.append(Track(pointer: trackPtr, db: db))
            }
            node = current.pointee.next
        }
        return result
    }
}
