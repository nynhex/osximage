var fullscreen = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});
var topleft = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});
var bottomleft = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY + screenSizeY/2",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});
var bottomright = slate.operation("move",{
    "x" : "screenOriginX + screenSizeX/2",
    "y" : "screenOriginY + screenSizeY/2",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});
var topright = slate.operation("move",{
    "x" : "screenOriginX + screenSizeX/2",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY/2"
});
var tophalf = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});
var lefthalf = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY"
});
var righthalf = slate.operation("move",{
    "x" : "screenOriginX + screenSizeX/2",
    "y" : "screenOriginY",
    "width" : "screenSizeX / 2",
    "height" : "screenSizeY"
});
var bottomhalf = slate.operation("move",{
    "x" : "screenOriginX",
    "y" : "screenOriginY + screenSizeY/2",
    "width" : "screenSizeX",
    "height" : "screenSizeY/2"
});

slate.bind("pad6:ctrl", function(win){ win.doOperation(righthalf);  })
slate.bind("pad5:ctrl", function(win){ win.doOperation(fullscreen); })
slate.bind("pad7:ctrl", function(win){ win.doOperation(topleft);    })
slate.bind("pad9:ctrl", function(win){ win.doOperation(topright);   })
slate.bind("pad1:ctrl", function(win){ win.doOperation(bottomleft); })
slate.bind("pad3:ctrl", function(win){ win.doOperation(bottomright);})
slate.bind("pad8:ctrl", function(win){ win.doOperation(tophalf);    })
slate.bind("pad2:ctrl", function(win){ win.doOperation(bottomhalf); })
slate.bind("pad4:ctrl", function(win){ win.doOperation(lefthalf);   })

// for a laptop without a numpad:
/*
slate.bind("d:space,ctrl", function(win){ win.doOperation(righthalf); })
slate.bind("s:space,ctrl", function(win){ win.doOperation(fullscreen); })
slate.bind("q:space,ctrl", function(win){ win.doOperation(topleft); })
slate.bind("e:space,ctrl", function(win){ win.doOperation(topright); })
slate.bind("z:space,ctrl", function(win){ win.doOperation(bottomleft); })
slate.bind("c:space,ctrl", function(win){ win.doOperation(bottomright); })
slate.bind("w:space,ctrl", function(win){ win.doOperation(tophalf); })
slate.bind("x:space,ctrl", function(win){ win.doOperation(bottomhalf); })
slate.bind("a:space,ctrl", function(win){ win.doOperation(lefthalf); })

*/
