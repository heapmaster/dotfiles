S.config("orderScreensLeftToRight", true);

var leftScreenRef = "0";
var rightScreenRef = "1";

var bottomMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 2)",
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
            "x": "screenOriginX + (screenSizeX / 3 * 2)",
            "y": "screenOriginY + (screenSizeY / 2)",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var topMiddle = function(screenRef) {
    return S.op("move", {
            "screen": screenRef,
            "x": "screenOriginX + (screenSizeX / 2)",
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
            "x": "screenOriginX + (screenSizeX / 3 * 2)",
            "y": "screenOriginY",
            "width": "screenSizeX / 2",
            "height": "screenSizeY / 2"
            });
};

var oneMonitorLayout = S.layout("oneMonitor", {
    "iTerm": {
        "operations": [ bottomLeft(leftScreenRef), bottomMiddle(leftScreenRef), bottomRight(leftScreenRef) ],
        "sort-title": true,
        "repeat": true
    },
    "Google Chrome": {
        "operations": [ topMiddle(leftScreenRef) ],
        "repeat": true,
        "ignore-fail": true
    }
});

var twoMonitorLayout = S.layout("twoMonitor", {});

S.bind("o:cmd,shift", S.op("layout", { "name": oneMonitorLayout }));

S.default(1, oneMonitorLayout);

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
