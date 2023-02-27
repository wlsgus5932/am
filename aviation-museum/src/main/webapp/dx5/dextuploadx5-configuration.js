/* dextuploadx5-configuration Copyright ⓒ DEXTSolution Inc. */

(function (win) {

    if (!location.origin) location.origin = location.protocol + "//" + location.host;

    win.dextuploadx5Configuration = {
        // authkey: Authentication Key string
        authkey: "3U5+R0bEdtxjxSVJaSuCdM23dR0sQnZ01AYn5NubNVJnHjv4K6ZU5nuQXSOMs8Yl8QYMPGXDfuSwPwu3DQtaMvSk2eOWEIjYT3+I+Ap/bra7hk81WhzLXQJrsbuorvw+0w+62VpNliaPdB3enbbjxU8r+c2jtsND9WOz0pgY80I=",

        version: "3.6.0.0",

        // productPath: DEXTUploadX5 location path (It MUST be a web address started with http or https.)
        productPath: location.origin + "/dx5/",

        // Below properties must be web addresses started with http or https.
        ieDownloadURL: location.origin + "/dx5/client/dextuploadx5-ax-download.html",
        hdDownloadURL: location.origin + "/dx5/client/dextuploadx5-hd-download.html",
        hd32UpdateURL: location.origin + "/dx5/client/dextuploadx5-hd-installer.exe",
        hd64UpdateURL: location.origin + "/dx5/client/dextuploadx5-hd-installer-x64.exe"
    };
})(window);