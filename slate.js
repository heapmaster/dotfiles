var windowStates = {};

var leftThird = S.op("push",
                        {"direction": "left",
                         "style": "bar-resize: screenSizeX/3"});
var leftHalf = S.op("push",
                        {"direction": "left",
                         "style": "bar-resize: screenSizeX/2"});

var rightThird = S.op("push",
                        {"direction": "right",
                         "style": "bar-resize: screenSizeX/3"});
var rightHalf = S.op("push",
                        {"direction": "right",
                         "style": "bar-resize: screenSizeX/2"});

var upThird = S.op("push",
                    {"direction": "up"});
var upHalf = S.op("push",
                    {"direction": "up"});

var downThird = S.op("push",
                    {"direction": "down"});
var downHalf = S.op("push",
                    {"direction": "down"});

S.bind('h:cmd,shift', leftThird);
S.bind('l:cmd,shift', rightThird);
S.bind('j:cmd,shift', downThird);
S.bind('k:cmd,shift', upThird);
