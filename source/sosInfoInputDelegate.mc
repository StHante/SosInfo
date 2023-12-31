import Toybox.Lang;
import Toybox.WatchUi;

class sosInfoInputDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    /*
    function onTap(clickEvent) {
        getApp().incrementIndex();

        WatchUi.requestUpdate();

        return true;
    }
    */

    function onSelect() {
        getApp().incrementIndex();

        WatchUi.requestUpdate();

        return true;
    }

}