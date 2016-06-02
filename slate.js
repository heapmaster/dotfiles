S.config("orderScreensLeftToRight", true);

var leftScreenRef = "0";
var rightScreenRef = "1";

var bottomMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 4)",
            "y": "screenOriginY + (screenSizeY / 2)",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var bottomLeft = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX",
            "y": "screenOriginY + (screenSizeY / 2)",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var bottomRight = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 2)",
            "y": "screenOriginY + (screenSizeY / 2)",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var topMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 4)",
            "y": "screenOriginY",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var topLeft = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX",
            "y": "screenOriginY",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var topRight = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 2)",
            "y": "screenOriginY",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var middleMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 4)",
            "y": "screenOriginY + (screenSizeY / 4)",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var bigMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 8)",
            "y": "screenOriginY + (screenSizeY / 10)",
            "width": "screenSizeX * 4 / 5",
            "height": "screenSizeY * 4 / 5"
    });
};

var oneMonitorLayout = S.layout("oneMonitor", {
    "iTerm2": {
        "operations": [ topLeft(leftScreenRef), topRight(leftScreenRef), bottomLeft(leftScreenRef), bottomRight(leftScreenRef) ],
        "sort-title": true,
        "repeat": true
    },
    "Google Chrome": {
        "operations": [ bigMiddle(leftScreenRef) ],
        "repeat": true,
        "ignore-fail": true
    },
    "Slack": {
        "operations": [ bottomLeft(leftScreenRef) ]
    }
});

var twoMonitorLayout = S.layout("twoMonitor", {
    "iTerm2": {
        "operations": [ topLeft(leftScreenRef), topRight(leftScreenRef), bottomLeft(leftScreenRef), bottomRight(leftScreenRef) ],
        "sort-title": true,
        "repeat": true
    },
    "Google Chrome": {
        "operations": [ bigMiddle(leftScreenRef), bigMiddle(rightScreenRef) ],
        "ignore-fail": true,
        "repeat": true
    },
    "Slack": {
        "operations": [ topLeft(rightScreenRef) ]
    },
    "Spotify": {
        "operations": [ bottomLeft(rightScreenRef) ]
    }
});

S.bind("o:cmd,shift", S.op("layout", { "name": twoMonitorLayout }));

S.default(1, oneMonitorLayout);
S.default(["3840x2160", "3840x2160"], twoMonitorLayout);

/*
var leftThird = S.op("push", {
        "direction": "left",
        "style": "bar-resize: screenSizeX/3"});
var leftHalf = S.op("push", {
        "direction": "left",
        "style": "bar-resize: screenSizeX/2"});

var rightThird = S.op("push", {
        "direction": "right",
        "style": "bar-resize: screenSizeX/3"});
var rightHalf = S.op("push", {
        "direction": "right",
        "style": "bar-resize: screenSizeX/2"});

S.bind('h:cmd,shift', leftHalf);
S.bind('l:cmd,shift', rightHalf);
S.bind('j:cmd,shift', downHalf);
S.bind('k:cmd,shift', upHalf);
*/
