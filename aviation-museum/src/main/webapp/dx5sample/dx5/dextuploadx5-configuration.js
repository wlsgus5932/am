/* dextuploadx5-configuration Copyright ⓒ DEXTSolution Inc. */

(function (win) {

    if (!location.origin) location.origin = location.protocol + "//" + location.host;

    win.dextuploadx5Configuration = {
        // authkey: Authentication Key string
        authkey: "6vmwhqV6W9sQpN096P/6m0BUIjT/w7IYQQAfmzkcO7eE5zSBYrIFHmEgPMF3EGzV3j3tyB2TDr3l/m7v/I72NDGJlcA3DCTrqCewX3MaMmDwhcoX/u4w7rde5FRkxMMrks5DNYPPRV+JceeqPfxztOPBHt16m0RemX895J/8GzA=",

        version: "3.6.0.0",

        // productPath: DEXTUploadX5 location path (It MUST be a web address started with http or https.)
        productPath: location.origin + "/dx5sample/dx5/",

        // Below properties must be web addresses started with http or https.
        ieDownloadURL: location.origin + "/dx5sample/dx5/client/dextuploadx5-ax-download.html",
        hdDownloadURL: location.origin + "/dx5sample/dx5/client/dextuploadx5-hd-download.html",
        hd32UpdateURL: location.origin + "/dx5sample/dx5/client/dextuploadx5-hd-installer.exe",
        hd64UpdateURL: location.origin + "/dx5sample/dx5/client/dextuploadx5-hd-installer-x64.exe"
    };
})(window);