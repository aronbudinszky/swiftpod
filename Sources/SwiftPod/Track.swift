import Foundation
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

    // MARK: - Core Metadata

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

    public var grouping: String? {
        get { pointer.pointee.grouping.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.grouping)
            pointer.pointee.grouping = newValue.flatMap { g_strdup($0) }
        }
    }

    public var subtitle: String? {
        get { pointer.pointee.subtitle.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.subtitle)
            pointer.pointee.subtitle = newValue.flatMap { g_strdup($0) }
        }
    }

    public var fileType: String? {
        get { pointer.pointee.filetype.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.filetype)
            pointer.pointee.filetype = newValue.flatMap { g_strdup($0) }
        }
    }

    // MARK: - Sort Fields

    public var sortTitle: String? {
        get { pointer.pointee.sort_title.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_title)
            pointer.pointee.sort_title = newValue.flatMap { g_strdup($0) }
        }
    }

    public var sortArtist: String? {
        get { pointer.pointee.sort_artist.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_artist)
            pointer.pointee.sort_artist = newValue.flatMap { g_strdup($0) }
        }
    }

    public var sortAlbum: String? {
        get { pointer.pointee.sort_album.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_album)
            pointer.pointee.sort_album = newValue.flatMap { g_strdup($0) }
        }
    }

    public var sortAlbumArtist: String? {
        get { pointer.pointee.sort_albumartist.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_albumartist)
            pointer.pointee.sort_albumartist = newValue.flatMap { g_strdup($0) }
        }
    }

    public var sortComposer: String? {
        get { pointer.pointee.sort_composer.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_composer)
            pointer.pointee.sort_composer = newValue.flatMap { g_strdup($0) }
        }
    }

    // MARK: - TV / Podcast Metadata

    public var tvShow: String? {
        get { pointer.pointee.tvshow.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.tvshow)
            pointer.pointee.tvshow = newValue.flatMap { g_strdup($0) }
        }
    }

    public var tvEpisode: String? {
        get { pointer.pointee.tvepisode.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.tvepisode)
            pointer.pointee.tvepisode = newValue.flatMap { g_strdup($0) }
        }
    }

    public var tvNetwork: String? {
        get { pointer.pointee.tvnetwork.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.tvnetwork)
            pointer.pointee.tvnetwork = newValue.flatMap { g_strdup($0) }
        }
    }

    public var sortTVShow: String? {
        get { pointer.pointee.sort_tvshow.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.sort_tvshow)
            pointer.pointee.sort_tvshow = newValue.flatMap { g_strdup($0) }
        }
    }

    public var category: String? {
        get { pointer.pointee.category.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.category)
            pointer.pointee.category = newValue.flatMap { g_strdup($0) }
        }
    }

    public var description: String? {
        get { pointer.pointee.description.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.description)
            pointer.pointee.description = newValue.flatMap { g_strdup($0) }
        }
    }

    public var podcastURL: String? {
        get { pointer.pointee.podcasturl.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.podcasturl)
            pointer.pointee.podcasturl = newValue.flatMap { g_strdup($0) }
        }
    }

    public var podcastRSS: String? {
        get { pointer.pointee.podcastrss.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.podcastrss)
            pointer.pointee.podcastrss = newValue.flatMap { g_strdup($0) }
        }
    }

    public var keywords: String? {
        get { pointer.pointee.keywords.map { String(cString: $0) } }
        set {
            g_free(pointer.pointee.keywords)
            pointer.pointee.keywords = newValue.flatMap { g_strdup($0) }
        }
    }

    // MARK: - File Path

    public var ipodPath: String? {
        pointer.pointee.ipod_path.map { String(cString: $0) }
    }

    // MARK: - Numeric Properties

    public var id: UInt32 { pointer.pointee.id }
    public var dbid: UInt64 { pointer.pointee.dbid }
    public var size: UInt32 { pointer.pointee.size }
    public var trackLength: Int32 { pointer.pointee.tracklen }
    public var trackNumber: Int32 { pointer.pointee.track_nr }
    public var totalTracks: Int32 { pointer.pointee.tracks }
    public var discNumber: Int32 { pointer.pointee.cd_nr }
    public var totalDiscs: Int32 { pointer.pointee.cds }
    public var bitrate: Int32 { pointer.pointee.bitrate }
    public var sampleRate: UInt16 { pointer.pointee.samplerate }
    public var year: Int32 { pointer.pointee.year }
    public var volume: Int32 { pointer.pointee.volume }
    public var soundcheck: UInt32 { pointer.pointee.soundcheck }
    public var startTime: UInt32 { pointer.pointee.starttime }
    public var stopTime: UInt32 { pointer.pointee.stoptime }
    public var pregap: UInt32 { pointer.pointee.pregap }
    public var postgap: UInt32 { pointer.pointee.postgap }
    public var sampleCount: UInt64 { pointer.pointee.samplecount }
    public var mediaType: UInt32 { pointer.pointee.mediatype }
    public var seasonNumber: UInt32 { pointer.pointee.season_nr }
    public var episodeNumber: UInt32 { pointer.pointee.episode_nr }
    public var artworkCount: UInt16 { pointer.pointee.artwork_count }
    public var artworkSize: UInt32 { pointer.pointee.artwork_size }

    // MARK: - Ratings & Play Stats

    public var rating: UInt32 { pointer.pointee.rating }
    public var appRating: UInt32 { UInt32(pointer.pointee.app_rating) }
    public var playCount: UInt32 { pointer.pointee.playcount }
    public var recentPlayCount: UInt32 { pointer.pointee.recent_playcount }
    public var skipCount: UInt32 { pointer.pointee.skipcount }
    public var recentSkipCount: UInt32 { pointer.pointee.recent_skipcount }
    public var bpm: Int16 { pointer.pointee.BPM }

    // MARK: - Boolean Flags

    public var compilation: Bool { pointer.pointee.compilation != 0 }
    public var checked: Bool { pointer.pointee.checked != 0 }
    public var hasArtwork: Bool { pointer.pointee.has_artwork != 0 }
    public var skipWhenShuffling: Bool { pointer.pointee.skip_when_shuffling != 0 }
    public var rememberPlaybackPosition: Bool { pointer.pointee.remember_playback_position != 0 }
    public var lyricsFlag: Bool { pointer.pointee.lyrics_flag != 0 }
    public var movieFlag: Bool { pointer.pointee.movie_flag != 0 }
    public var markUnplayed: Bool { pointer.pointee.mark_unplayed != 0 }
    public var transferred: Bool { pointer.pointee.transferred != 0 }
    public var explicit: Bool { pointer.pointee.explicit_flag != 0 }
    public var gaplessTrack: Bool { pointer.pointee.gapless_track_flag != 0 }
    public var gaplessAlbum: Bool { pointer.pointee.gapless_album_flag != 0 }

    // MARK: - Timestamps

    /// The date the track was last played, or `nil` if it has never been played.
    public var lastPlayed: Date? {
        let t = pointer.pointee.time_played
        return t == 0 ? nil : Date(timeIntervalSince1970: TimeInterval(t))
    }

    /// The date the track was added to the library.
    public var dateAdded: Date? {
        let t = pointer.pointee.time_added
        return t == 0 ? nil : Date(timeIntervalSince1970: TimeInterval(t))
    }

    /// The date the track was last modified.
    public var dateModified: Date? {
        let t = pointer.pointee.time_modified
        return t == 0 ? nil : Date(timeIntervalSince1970: TimeInterval(t))
    }

    /// The release date of the track.
    public var dateReleased: Date? {
        let t = pointer.pointee.time_released
        return t == 0 ? nil : Date(timeIntervalSince1970: TimeInterval(t))
    }

    /// The date the track was last skipped, or `nil` if it has never been skipped.
    public var lastSkipped: Date? {
        let t = pointer.pointee.last_skipped
        return t == 0 ? nil : Date(timeIntervalSince1970: TimeInterval(t))
    }
}
