/* dextuploadx5-configuration Copyright ⓒ DEXTSolution Inc. */

(function (win) {

    if (!location.origin) location.origin = location.protocol + "//" + location.host;

    win.dextuploadx5Configuration = {
        // authkey: Authentication Key string
        authkey: "VsS676g6Q3KToiqH2hYahZEYycSNF3y/XG6ms8STPxbWAClJ/yDs0V0NCnswb8kYKg+SdfYFBqXcwC5nBsEeCT+xzoZVdbj0DDKT0p8iP6oURAxtDFNlG/ESqZPGl3OUgQTelPYDWlJ2zf4iRlwvLSzsEIUT0lYDI+sgpsqNUcs=",

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