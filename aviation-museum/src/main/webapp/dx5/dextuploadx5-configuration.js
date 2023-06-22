/* dextuploadx5-configuration Copyright ⓒ DEXTSolution Inc. */

(function (win) {

    if (!location.origin) location.origin = location.protocol + "//" + location.host;

    win.dextuploadx5Configuration = {
        // authkey: Authentication Key string
        authkey: "ZJaUD2VrXKTyQHf9lEWL/XzBMtXAOaS6epWA2264mKsE/YRrbS4hN7kh8xlhYk/gBPa1S93ipfPLdDHn7eL5n1AusTjM+b1e2dKTwkvzytHksf/jPIYlnC9NU+HBTVb9qB9eIH08fIMQRq0K6UbTUB3wyYht+4BUH0iQpgkvDOE=",
        //authkey: "t15HdhLKJ6jZW0ZmAtCEwX58mONf1Ar2enY5t7auYqYSZxcrTCtvbE8e22UFfmr1X1Yd/VQtopUBhZt3SUURWgZhS/lquX7IOICSQR0aEclJtTwuLk8RixEpKHoKYYSqiw4/ov3YoiXIipTWd4arLB1KuU6OfbmvY5vKy9wueUI=",
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