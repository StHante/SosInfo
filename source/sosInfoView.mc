import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application.Properties;
import Toybox.Lang;

class sosInfoView extends WatchUi.View {

    function stringReplace(str as String, oldString as String, newString as String) {
        var result = str;

        for (var index = result.find(oldString); index != null; index = result.find(oldString)) {
            var index2 = index+oldString.length();
            result = result.substring(0, index) + newString + result.substring(index2, result.length());
        }

        return result;
    }

    function initialize() {
        View.initialize();
    }

    function setTexts() as Void {
        var headerDrawable = View.findDrawableById("Header") as Text;
        var contentDrawable = View.findDrawableById("Content") as Text;
        var header = "";
        var content = "";


        if (getApp().index == 0) {
            header = Properties.getValue("header1");
            content = Properties.getValue("content1");
        } else if (getApp().index == 1) {
            header = Properties.getValue("header2");
            content = Properties.getValue("content2");
        } else if (getApp().index == 2) {
            header = Properties.getValue("header3");
            content = Properties.getValue("content3");
        }

        if (header.length() + content.length() == 0) {
            getApp().incrementIndex();
            setTexts();
        } else {
            headerDrawable.setText(stringReplace(header, ";", "\n"));
            contentDrawable.setText(stringReplace(content, ";", "\n"));
        }
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));

        getApp().index = 0;

        setTexts();

        var tapForMoreDrawable = View.findDrawableById("TapForMore") as Text;
        tapForMoreDrawable.setText(Properties.getValue("tapForMore"));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        setTexts();
    }

    function onSettingsChanged(dc as Dc) as Void {
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
