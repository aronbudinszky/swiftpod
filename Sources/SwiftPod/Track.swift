import Clibgpod

/// Swift wrapper around libgpod's Itdb_Track.
///
/// Does not own the underlying C struct — the parent `iTunesDB` manages its lifecycle.
public final class Track: @unchecked Sendable {
    internal let pointer: UnsafeMutablePointer<Itdb_Track>
    private let db: iTunesDB  // prevent premature dealloc

    internal init(pointer: UnsafeMutablePointer<Itdb_Track>, db: iTunesDB) {
        self.pointer = pointer
        self.db = db
    }

    public var title: String? {
        get { pointer.pointee.title.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.title)
            pointer.pointee.title = newValue.flatMap { g_strdup($0) }
        }
    }

    public var artist: String? {
        get { pointer.pointee.artist.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.artist)
            pointer.pointee.artist = newValue.flatMap { g_strdup($0) }
        }
    }

    public var album: String? {
        get { pointer.pointee.album.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.album)
            pointer.pointee.album = newValue.flatMap { g_strdup($0) }
        }
    }

    public var genre: String? {
        get { pointer.pointee.genre.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.genre)
            pointer.pointee.genre = newValue.flatMap { g_strdup($0) }
        }
    }

    public var composer: String? {
        get { pointer.pointee.composer.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.composer)
            pointer.pointee.composer = newValue.flatMap { g_strdup($0) }
        }
    }

    public var comment: String? {
        get { pointer.pointee.comment.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.comment)
            pointer.pointee.comment = newValue.flatMap { g_strdup($0) }
        }
    }

    public var albumArtist: String? {
        get { pointer.pointee.albumartist.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.albumartist)
            pointer.pointee.albumartist = newValue.flatMap { g_strdup($0) }
        }
    }

    public var ipodPath: String? {
        pointer.pointee.ipod_path.map { String(cString: $0) }
    }

    public var id: UInt32 { pointer.pointee.id }
    public var size: UInt32 { pointer.pointee.size }
    public var trackLength: Int32 { pointer.pointee.tracklen }
    public var trackNumber: Int32 { pointer.pointee.track_nr }
    public var totalTracks: Int32 { pointer.pointee.tracks }
    public var discNumber: Int32 { pointer.pointee.cd_nr }
    public var totalDiscs: Int32 { pointer.pointee.cds }
    public var bitrate: Int32 { pointer.pointee.bitrate }
    public var sampleRate: UInt16 { pointer.pointee.samplerate }
    public var year: Int32 { pointer.pointee.year }
    public var rating: UInt32 { pointer.pointee.rating }
    public var playCount: UInt32 { pointer.pointee.playcount }
    public var bpm: Int16 { pointer.pointee.BPM }
    public var compilation: Bool { pointer.pointee.compilation != 0 }
}
