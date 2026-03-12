#ifndef LIBGPOD_SPM_CONFIG_H
#define LIBGPOD_SPM_CONFIG_H

#define HAVE_ZLIB 1
#define HAVE_LIBXML 1
#define HAVE_STRUCT_TM_TM_GMTOFF 1
#define HAVE_UNISTD_H 1
#define HAVE_LOCALTIME_R 1
#define HAVE_G_INT64_EQUAL 1
#define HAVE_G_INT64_HASH 1

#define PACKAGE "libgpod"
#define VERSION "0.8.0"
#define GETTEXT_PACKAGE "libgpod"
#define LIBGPOD_BLOB_DIR "/usr/local/lib/libgpod"

/* Optional features - disabled by default for SPM builds */
/* #define HAVE_GDKPIXBUF 1 */
/* #define HAVE_LIBIMOBILEDEVICE 1 */
/* #define HAVE_SGUTILS 1 */
/* #define HAVE_LIBUSB 1 */

#endif /* LIBGPOD_SPM_CONFIG_H */
