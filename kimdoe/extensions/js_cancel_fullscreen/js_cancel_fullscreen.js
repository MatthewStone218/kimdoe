function CancelFullScreen() {
    if (!(document.fullScreenElement && document.fullScreenElement !== null) && !(!document.mozFullScreen && !document.webkitIsFullScreen))
    {
        if (document.cancelFullScreen) {
            document.cancelFullScreen();
        } else if (document.mozCancelFullScreen) {
            document.mozCancelFullScreen();
        } else if (document.webkitCancelFullScreen) {
            document.webkitCancelFullScreen();
        }
    }
}