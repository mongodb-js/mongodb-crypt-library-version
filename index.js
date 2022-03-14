const { getCSFLESharedLibraryVersion } = require('bindings')('mongodb_csfle_library_version');

module.exports = getCSFLESharedLibraryVersion;
