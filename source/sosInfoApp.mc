import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class sosInfoApp extends Application.AppBase {

    var index = 0;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new sosInfoView(), new sosInfoInputDelegate() ] as Array<Views or InputDelegates>;
    }

    // New app settings have been received so trigger a UI update
    function onSettingsChanged() as Void {
        WatchUi.requestUpdate();
    }

    function incrementIndex() {
        index = (index + 1) % 3;
    }

}

function getApp() as sosInfoApp {
    return Application.getApp() as sosInfoApp;
}